function onUpdateDatabase()
    print("> Updating database to version 6 (sexId update)")
	db.query([[UPDATE `players` SET `sex` = '2' WHERE `sex` = 0;]])
    return true
end
