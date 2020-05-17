/**
 * Open Tibia Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2020 Open Tibia Community
 */

#include "../src/account.hpp"
#include <catch2/catch.hpp>

TEST_CASE("Default Constructor") {

	SECTION("Empty ID") {
	  account::Account empty;
    uint32_t id;
    empty.GetID(&id);
    CHECK(id == 0);
  }

	SECTION("Empty Name") {
	  account::Account empty;
    std::string name;
    empty.GetName(&name);
    CHECK(name.empty() == true);
  }
}

TEST_CASE("Constructor ID") {
  account::Account with_id(14);
  uint32_t id;
  with_id.GetID(&id);
  CHECK(id == 14);
}

TEST_CASE("Constructor Name") {
	account::Account with_name("Test");
  std::string name;
  with_name.GetName(&name);
  CHECK(name == "Test");
}

TEST_CASE("Set Database Interface") {
	account::Account account;
  error_t result;
  Database new_database;
  result = account.SetDatabaseInterface(&new_database);
  CHECK(result == account::ERROR_NO);
}

TEST_CASE("Set Database Interface to Nullptr Must Fail") {
	account::Account account;
  error_t result;
  result = account.SetDatabaseInterface(nullptr);
  CHECK(result == account::ERROR_NULLPTR);
}

TEST_CASE("Set Database Task Interface") {
	account::Account account;
  error_t result;
  DatabaseTasks new_database_tasks;
  result = account.SetDatabaseTasksInterface(&new_database_tasks);
  CHECK(result == account::ERROR_NO);
}

TEST_CASE("Set Database Task Interface to Nullptr Must Fail") {
	account::Account account;
  error_t result;
  result = account.SetDatabaseTasksInterface(nullptr);
  CHECK(result == account::ERROR_NULLPTR);
}
