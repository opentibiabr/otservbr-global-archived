function onUpdateDatabase()
	print("> Updating database to version 5 (boosted creature)")
	db.query([[CREATE TABLE IF NOT EXISTS `boosted_creature` (
   `boostname` TEXT,   
   `date` varchar(250)  NOT NULL default '',
   `raceid` varchar(250)  NOT NULL default '',
   PRIMARY KEY  (`date`)
   ) AS SELECT 42 AS date, "name" AS boostname, 69 AS raceid]])
    return true
end
