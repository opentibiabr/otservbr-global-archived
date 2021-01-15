function onUpdateDatabase()
    print("> Updating database to version 5 (boosted creature)")
    db.query([[CREATE TABLE IF NOT EXISTS `boosted_creature` (
        `boostname` TEXT,
        `date` varchar(250) NOT NULL DEFAULT '0',
        `raceid` varchar(250) NOT NULL DEFAULT '0',
        PRIMARY KEY (`date`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;]])
    return true
end
