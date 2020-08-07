function onUpdateDatabase()
    print("> Updating database to version 6 (sexId update)")
	db.query([[UPDATE `players` SET `sex` = '0' WHERE `sex` = 2;]])
    return true= this is the last migration file
end
