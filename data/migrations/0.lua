function onUpdateDatabase()
    return false -- true = There are others migrations file | false = this is the last migration file
end

--[=====[
-- Insert this part to create initial players samples if your web site doesn't do that
    print("[DB] Updating database to version 1 (default accounts and sample players)")
    db.query([[
        INSERT INTO `accounts`
        (`name`, `password`,                                 `type`) VALUES
        ('1',    '060d38973b4ba4051fa6ca22f9acd4be7d1557fe',  1);]])
    db.query([[
        INSERT INTO `players`
        (`id`, `name`,           `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `mana`, `manamax`, `town_id`, `conditions`, `cap`, `sex`) VALUES
        (1,    'Rook Sample',     1,          1,            1,       0,          150,      150,         0,            106,        95,         78,         116,        128,        5,      5,         6,         '',           400,   0),
        (2,    'Sorcerer Sample', 1,          1,            8,       1,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1),
        (3,    'Druid Sample',    1,          1,            8,       2,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1),
        (4,    'Paladin Sample',  1,          1,            8,       3,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1),
        (5,    'Knight Sample',   1,          1,            8,       4,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1);]])
    return false -- true = There are others migrations file | false = this is the last migration file
--]=====]