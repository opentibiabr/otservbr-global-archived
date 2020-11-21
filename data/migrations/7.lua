function onUpdateDatabase()
  print("> Updating database to version 8 (Bestiary cpp)")
  db.query([[CREATE TABLE IF NOT EXISTS `player_charms` (
`id` INT(250) NOT NULL , 
`points` VARCHAR(250) NULL , 
`expansion` BOOLEAN NULL , 
`wound` INT(250) NULL , 
`enflame` INT(250) NULL , 
`poison` INT(250) NULL ,
`freeze` INT(250) NULL ,
`zap` INT(250) NULL ,
`curse` INT(250) NULL ,
`cripple` INT(250) NULL ,
`parry` INT(250) NULL ,
`dodge` INT(250) NULL ,
`adrenaline` INT(250) NULL ,
`numb` INT(250) NULL, 
`cleanse` INT(250) NULL ,
`bless` INT(250) NULL ,
`scavenge` INT(250) NULL ,
`gut` INT(250) NULL ,
`low blow` INT(250) NULL ,
`divine` INT(250) NULL ,
`vamp` INT(250) NULL ,
`void` INT(250) NULL ,
`UsedRunesBit` VARCHAR(250) NULL ,
`UnlockedRunesBit` VARCHAR(250) NULL,
`tracker list` BLOB NULL ) ENGINE = InnoDB DEFAULT CHARSET=utf8;]])  
    return true -- true = There are others migrations file | false = this is the last migration file
end
