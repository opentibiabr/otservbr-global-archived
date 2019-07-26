function onUpdateDatabase()
    print("[DB] Updating database to version 1 (default accounts and sample players)")
    db.query("
        INSERT INTO `accounts`
        (`id`, `name`, `password`,                                 `type`) VALUES
        (1,    '1',    '060d38973b4ba4051fa6ca22f9acd4be7d1557fe',  1),
        (2,    'GOD',  '21298df8a3277357ee55b01df9530b535cf08ec1',  5);");
    db.query("
        INSERT INTO `players`
        (`id`, `name`,           `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `mana`, `manamax`, `town_id`, `conditions`, `cap`, `sex`) VALUES
        (1,    'Rook Sample',     1,          1,            1,       0,          150,      150,         0,            106,        95,         78,         116,        128,        5,      5,         6,         '',           400,   0),
        (2,    'Sorcerer Sample', 1,          1,            8,       1,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1),
        (3,    'Druid Sample',    1,          1,            8,       2,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1),
        (4,    'Paladin Sample',  1,          1,            8,       3,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1),
        (5,    'Knight Sample',   1,          1,            8,       4,          185,      185,         4200,         106,        95,         78,         116,        128,        40,     40,        2,         '',           470,   1),
        (6,    'ADM',             6,          2,            1,       0,          150,      150,         0,            106,        95,         78,         116,        128,        5,      5,         2,         '',           400,   1 );")
    return true
end
