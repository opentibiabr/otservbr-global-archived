/**
 * @file account.cpp
 *
 *
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019 Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "account.hpp"
#include "databasetasks.h"

#include <algorithm>
#include <limits>

namespace account {

Account::Account() {
  id_ = 0;
  name_.clear();
  password_.clear();
  premium_remaining_days_ = 0;
  premium_last_day_ = 0;
  account_type_ = ACCOUNT_TYPE_NORMAL;
  db_ = &Database::getInstance();
  db_tasks_ = &g_databaseTasks;
}

Account::Account(uint32_t id) {
  id_ = id;
  name_.clear();
  password_.clear();
  premium_remaining_days_ = 0;
  premium_last_day_ = 0;
  account_type_ = ACCOUNT_TYPE_NORMAL;
  db_ = &Database::getInstance();
  db_tasks_ = &g_databaseTasks;
}

Account::Account(std::string name) {
  id_ = 0;
  name_ = name;
  password_.clear();
  premium_remaining_days_ = 0;
  premium_last_day_ = 0;
  account_type_ = ACCOUNT_TYPE_NORMAL;
  db_ = &Database::getInstance();
  db_tasks_ = &g_databaseTasks;
}


/*******************************************************************************
 * Interfaces
 ******************************************************************************/

error_t Account::SetDatabaseInterface(Database *database) {
  if (database == nullptr) {
    LOG_F(ERROR, "Trying to set database pointer to point to a nullptr!");
    return ERROR_NULLPTR;
  }

  db_ = database;
  return ERROR_NO;
}

error_t Account::SetDatabaseTasksInterface(DatabaseTasks *database_tasks) {
  if (database_tasks == nullptr) {
    LOG_F(ERROR, "Trying to set database_tasks pointer to point to a nullptr!");
    return ERROR_NULLPTR;
  }

  db_tasks_ = database_tasks;
  return ERROR_NO;
}


/*******************************************************************************
 * Coins Methods
 ******************************************************************************/

error_t Account::GetCoins(uint32_t *coins) {
  DLOG_F(INFO, "Getting account[%d] coins", id_);

  if (db_ == nullptr || coins == nullptr || id_ == 0) {
      LOG_F(ERROR, "Error account not initialized!");
      DLOG_F(ERROR, "db_[%s], coins[%s], id_[%s]",
                                            db_ == nullptr ? "nullptr": "ok",
                                            coins == nullptr ? "nullptr": "ok",
                                            id_ == 0 ? "0": "ok");
      return ERROR_NOT_INITIALIZED;
  }

  std::ostringstream query;
  query << "SELECT `coins` FROM `accounts` WHERE `id` = " << id_;
  DLOG_F(INFO, "Query:[%s].", query.str().c_str());

  DBResult_ptr result = db_->storeQuery(query.str());
  if (!result) {
      LOG_F(ERROR, "Error getting account[%d] coins !", id_);
      return ERROR_DB;
  }

  *coins = result->getNumber<uint32_t>("coins");
  LOG_F(INFO, "Account:[%d] Coins:[%d].", id_, *coins);

  return ERROR_NO;
}

error_t Account::AddCoins(uint32_t amount) {
  LOG_F(INFO, "Adding coins[%d] to account[%d].", amount, id_);

  if (db_tasks_ == nullptr) {
      LOG_F(ERROR, "Error database tasks not initialized!");
      return ERROR_NULLPTR;
  }
  if (amount == 0)  {
    LOG_F(WARNING, "Amount has value zero!");
    return ERROR_NO;
  }

  uint32_t current_coins = 0;
  this->GetCoins(&current_coins);
  if ((current_coins + amount) < current_coins) {
    LOG_F(ERROR, "Overflow variable size!");
    return ERROR_VALUE_OVERFLOW;
  }

  std::ostringstream query;
  query << "UPDATE `accounts` SET `coins` = " << (current_coins + amount)
        << " WHERE `id` = " << id_;
  DLOG_F(INFO, "Query:[%s].", query.str().c_str());

  DLOG_F(INFO, "Adding Task to Add Coins[%d] to Account[%d]", amount, id_);
  db_tasks_->addTask(query.str());
  DLOG_F(INFO, "Add Coins DBTask added!");

  return ERROR_NO;
}

error_t Account::RemoveCoins(uint32_t amount) {
  LOG_F(INFO, "Removing coins[%d] from account[%d].", amount, id_);

  if (db_tasks_ == nullptr) {
      LOG_F(ERROR, "Error database tasks not initialized!");
      return ERROR_NULLPTR;
  }

  if (amount == 0)  {
    LOG_F(WARNING, "Amount has value zero!");
    return ERROR_NO;
  }

  uint32_t current_coins = 0;
  this->GetCoins(&current_coins);

  if ((current_coins - amount) > current_coins) {
    LOG_F(ERROR, "Not enough coins!");
    return ERROR_VALUE_NOT_ENOUGH_COINS;
  }

  std::ostringstream query;
  query << "UPDATE `accounts` SET `coins` = "<< (current_coins - amount)
        << " WHERE `id` = " << id_;
  DLOG_F(INFO, "Query:[%s].", query.str().c_str());

  db_tasks_->addTask(query.str());
  DLOG_F(INFO, "Remove Coins DBTask added!");

  return ERROR_NO;
}

error_t Account::RegisterCoinsTransaction(CoinTransactionType type,
                                          uint32_t coins,
                                          const std::string& description) {
  LOG_F(INFO, "Register coin transaction: account[%d], type[%d], coins[%d], "
      "description[%s].", type, id_, coins, description.c_str());

  if (db_ == nullptr) {
      LOG_F(ERROR, "Error database interface not initialized!");
      return ERROR_NULLPTR;
  }

  std::ostringstream query;
  query << "INSERT INTO `coins_transactions` (`account_id`, `type`, `amount`,"
          " `description`) VALUES (" << id_ << ", " << type << ", "<< coins
          << "," << db_->escapeString(description) << ")";
  DLOG_F(INFO, "Query:[%s].", query.str().c_str());

  if (!db_->executeQuery(query.str())) {
      LOG_F(ERROR, "Error running database query[%s]!", query.str().c_str());
      return ERROR_DB;
  }

  DLOG_F(INFO, "Coin Transaction Registered");
  return ERROR_NO;
}


/*******************************************************************************
 * Database
 ******************************************************************************/

error_t Account::LoadAccountDB() {
  if (id_ != 0) {
    return this->LoadAccountDB(id_);
  } else if (!name_.empty()) {
    return this->LoadAccountDB(name_);
  }

  LOG_F(ERROR, "Account not initialized! ID and Name without value!");
  return ERROR_NOT_INITIALIZED;
}

error_t Account::LoadAccountDB(std::string name) {
  std::ostringstream query;
  query << "SELECT * FROM `accounts` WHERE `name` = "
      << db_->escapeString(name);
  return this->LoadAccountDB(query);
}

error_t Account::LoadAccountDB(uint32_t id) {
  std::ostringstream query;
  query << "SELECT * FROM `accounts` WHERE `id` = " << id;
  return this->LoadAccountDB(query);
}

error_t Account::LoadAccountDB(std::ostringstream &query) {
  if (db_ == nullptr) {
      LOG_F(ERROR, "Error database interface not initialized!");
      return ERROR_NULLPTR;
  }

  DBResult_ptr result = db_->storeQuery(query.str());
  if (!result) {
      LOG_F(ERROR, "Error loading account!");
      return false;
  }

  this->SetID(result->getNumber<uint32_t>("id"));
  this->SetName(result->getString("name"));
  this->SetAccountType(static_cast<AccountType>(
                                          result->getNumber<int32_t>("type")));
  this->SetPassword(result->getString("password"));
  this->SetPremiumRemaningDays(result->getNumber<uint16_t>("premdays"));
  this->SetPremiumLastDay(result->getNumber<time_t>("lastday"));

  return ERROR_NO;
}

error_t Account::LoadAccountPlayersDB(std::vector<Player> *players) {
  if (id_ == 0) {
    LOG_F(ERROR, "Account not initialized! ID without value!");
    return ERROR_NOT_INITIALIZED;
  }

  std::ostringstream query;
  query << "SELECT `name`, `deletion` FROM `players` WHERE `account_id` = "
        << id_ << " ORDER BY `name` ASC";
  DBResult_ptr result = db_->storeQuery(query.str());
  if (!result) {
    LOG_F(ERROR, "Error loading account players![%s]", query.str().c_str());
    return ERROR_DB;
  }

  do {
    if (result->getNumber<uint64_t>("deletion") == 0) {
      Player new_player;
      new_player.name = result->getString("name");
      new_player.deletion = result->getNumber<uint64_t>("deletion");
      players->push_back(new_player);
    }
  } while (result->next());
  return ERROR_NO;
}

error_t Account::SaveAccountDB() {
  std::ostringstream query;

  query << "UPDATE `accounts` SET "
        << "`name` = " << db_->escapeString(name_) << " , "
        << "`type` = " << account_type_ << " , "
        << "`password` = " << db_->escapeString(password_) << " , "
        << "`premdays` = " << premium_remaining_days_ << " , "
        << "`lastday` = " << premium_last_day_;

  if (id_ != 0) {
    query << " WHERE `id` = " << id_;
  } else if (!name_.empty()) {
    query << " WHERE `name` = " << name_;
  }

  if (!db_->executeQuery(query.str())) {
    LOG_F(ERROR, "Failed to save account! Query[%s]", query.str().c_str());
    return ERROR_DB;
  }

  return ERROR_NO;
}

/*******************************************************************************
 * Setters and Getters
 ******************************************************************************/

error_t Account::SetID(uint32_t id) {
  if (id == 0) {
    LOG_F(ERROR, "Invalid ID[%d]!", id);
    return ERROR_INVALID_ID;
  }
  id_ = id;
  return ERROR_NO;
}

error_t Account::GetID(uint32_t *id) {
  if (id == nullptr) {
    LOG_F(ERROR, "Pointer is a nullptr!");
    return ERROR_NULLPTR;
  }

  *id = id_;
  return ERROR_NO;
}

error_t Account::SetName(std::string name) {
  if (name.empty()) {
    LOG_F(ERROR, "Name can't be empty!");
    return ERROR_INVALID_ACC_NAME;
  }
  name_ = name;
  return ERROR_NO;
}

error_t Account::GetName(std::string *name) {
  if (name == nullptr) {
    LOG_F(ERROR, "Pointer is a nullptr!");
    return ERROR_NULLPTR;
  }

  *name = name_;
  return ERROR_NO;
}

error_t Account::SetPassword(std::string password) {
  if (password.empty()) {
    LOG_F(ERROR, "Password can't be empty!");
    return ERROR_INVALID_ACC_PASSWORD;
  }
  password_ = password;
  return ERROR_NO;
}

error_t Account::GetPassword(std::string *password) {
  if (password == nullptr) {
    LOG_F(ERROR, "Pointer is a nullptr!");
    return ERROR_NULLPTR;
  }

  *password = password_;
  return ERROR_NO;
}

error_t Account::SetPremiumRemaningDays(uint32_t days) {
  premium_remaining_days_ = days;
  return ERROR_NO;
}

error_t Account::GetPremiumRemaningDays(uint32_t *days) {
  if (days == nullptr) {
    LOG_F(ERROR, "Pointer is a nullptr!");
    return ERROR_NULLPTR;
  }

  *days = premium_remaining_days_;
  return ERROR_NO;
}

error_t Account::SetPremiumLastDay(time_t last_day) {
  if (last_day < 0) {
    LOG_F(ERROR, "Invalid Premium Last Day!", last_day);
    return ERROR_INVALID_LAST_DAY;
  }
  premium_last_day_ = last_day;
  return ERROR_NO;
}

error_t Account::GetPremiumLastDay(time_t *last_day) {
  if (last_day == nullptr) {
    LOG_F(ERROR, "Pointer is a nullptr!");
    return ERROR_NULLPTR;
  }

  *last_day = premium_last_day_;
  return ERROR_NO;
}

error_t Account::SetAccountType(AccountType account_type) {
  if (account_type < 0 || account_type > 5) {
    LOG_F(ERROR, "Invalid Account Type!", static_cast<int>(account_type));
    return ERROR_INVALID_ACC_TYPE;
  }
  account_type_ = account_type;
  return ERROR_NO;
}

error_t Account::GetAccountType(AccountType *account_type) {
  if (account_type == nullptr) {
    LOG_F(ERROR, "Pointer is a nullptr!");
    return ERROR_NULLPTR;
  }

  *account_type = account_type_;
  return ERROR_NO;
}

error_t Account::GetAccountPlayers(std::vector<Player> *players) {
  if (players == nullptr) {
    LOG_F(ERROR, "Pointer is a nullptr!");
    return ERROR_NULLPTR;
  }

  return this->LoadAccountPlayersDB(players);
}

}  // namespace account
