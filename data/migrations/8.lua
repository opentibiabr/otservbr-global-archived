function onUpdateDatabase()
    print("> Updating database to version 9 (one player online per account)")
    db.query("ALTER TABLE `players_online` ADD `account_id` INT(11) NOT NULL")
    return true
end
