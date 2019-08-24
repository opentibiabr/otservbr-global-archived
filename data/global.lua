dofile('data/lib/libs.lua')

NOT_MOVEABLE_ACTION = 8000
PARTY_PROTECTION = 1 -- Set to 0 to disable.
ADVANCED_SECURE_MODE = 1 -- Set to 0 to disable.

STORAGEVALUE_PROMOTION = 30018
STORAGEVALUE_ASSISTS = 30000
STORAGEVALUE_DEATHS = 30001
STORAGEVALUE_KILLS = 30002

monsterIdName = {
      [262] = {name = "Toad"}, 
      [267] = {name = "Green Frog"}, 
      [268] = {name = "Azure Frog"}, 
      [269] = {name = "Coral Frog"}, 
      [270] = {name = "Crimson Frog"}, 
      [271] = {name = "Orchid Frog"}, 
      [563] = {name = "Infernal Frog"}, 
      [738] = {name = "Bog Frog"}, 
      [913] = {name = "Salamander"}, 
      [112] = {name = "Crab"}, 
      [237] = {name = "Quara Predator"}, 
      [238] = {name = "Quara Predator Scout"}, 
      [239] = {name = "Quara Constrictor"}, 
      [240] = {name = "Quara Constrictor Scout"}, 
      [241] = {name = "Quara Mantassin"}, 
      [242] = {name = "Quara Mantassin Scout"}, 
      [243] = {name = "Quara Hydromancer"}, 
      [244] = {name = "Quara Hydromancer Scout"}, 
      [245] = {name = "Quara Pincher"}, 
      [246] = {name = "Quara Pincher Scout"}, 
      [261] = {name = "Blood Crab"}, 
      [697] = {name = "Crustacea Gigantica"}, 
      [734] = {name = "Deepling Scout"}, 
      [735] = {name = "Filth Toad"}, 
      [769] = {name = "Deepling Warrior"}, 
      [770] = {name = "Deepling Guard"}, 
      [772] = {name = "Deepling Spellsinger"}, 
      [779] = {name = "Manta Ray"}, 
      [780] = {name = "Calamary"}, 
      [781] = {name = "Jellyfish"}, 
      [782] = {name = "Shark"}, 
      [783] = {name = "Northern Pike"}, 
      [784] = {name = "Fish"}, 
      [795] = {name = "Deepling Worker"}, 
      [859] = {name = "Deepling Brawler"}, 
      [860] = {name = "Deepling Master Librarian"}, 
      [861] = {name = "Deepling Tyrant"}, 
      [862] = {name = "Deepling Elite"}, 
      [1667] = {name = "Deathling Scout"}, 
      [1677] = {name = "Deathling Spellsinger"}, 
      [111] = {name = "Chicken"}, 
      [212] = {name = "Flamingo"}, 
      [217] = {name = "Parrot"}, 
      [218] = {name = "Terror Bird"}, 
      [264] = {name = "Seagull"}, 
      [318] = {name = "Penguin"}, 
      [335] = {name = "Dire Penguin"}, 
      [561] = {name = "Berserker Chicken"}, 
      [562] = {name = "Demon Parrot"}, 
      [914] = {name = "Marsh Stalker"}, 
      [915] = {name = "Pigeon"}, 
      [67] = {name = "Stone Golem"}, 
      [326] = {name = "Ice Golem"}, 
      [503] = {name = "Worker Golem"}, 
      [524] = {name = "Damaged Worker Golem"}, 
      [533] = {name = "War Golem"}, 
      [615] = {name = "Eternal Guardian"}, 
      [680] = {name = "Cake Golem"}, 
      [700] = {name = "Iron Servant"}, 
      [701] = {name = "Golden Servant"}, 
      [702] = {name = "Diamond Servant"}, 
      [705] = {name = "Sandstone Scorpion"}, 
      [706] = {name = "Clay Guardian"}, 
      [873] = {name = "Enraged Crystal Golem"}, 
      [874] = {name = "Damaged Crystal Golem"}, 
      [879] = {name = "Stone Devourer"}, 
      [882] = {name = "Weeper"}, 
      [883] = {name = "Orewalker"}, 
      [884] = {name = "Lava Golem"}, 
      [885] = {name = "Magma Crawler"}, 
      [897] = {name = "Infected Weeper"}, 
      [1038] = {name = "Glooth Golem"}, 
      [1039] = {name = "Metal Gargoyle"}, 
      [1041] = {name = "Rustheap Golem"}, 
      [1043] = {name = "Walker"}, 
      [1325] = {name = "Iron Servant Replica"}, 
      [1326] = {name = "Diamond Servant Replica"}, 
      [1327] = {name = "Golden Servant Replica"}, 
      [1656] = {name = "Biting Book"}, 
      [1751] = {name = "Animated Snowman"}, 
      [35] = {name = "Demon"}, 
      [40] = {name = "Fire Devil"}, 
      [285] = {name = "Dark Torturer"}, 
      [287] = {name = "Destroyer"}, 
      [288] = {name = "Diabolic Imp"}, 
      [291] = {name = "Fury"}, 
      [294] = {name = "Hellhound"}, 
      [295] = {name = "Hellfire Fighter"}, 
      [296] = {name = "Juggernaut"}, 
      [314] = {name = "Plaguesmith"}, 
      [519] = {name = "Hellspawn"}, 
      [523] = {name = "Gozzler"}, 
      [581] = {name = "Duskbringer"}, 
      [582] = {name = "Shadow Hound"}, 
      [586] = {name = "Herald Of Gloom"}, 
      [724] = {name = "Shaburak Demon"}, 
      [725] = {name = "Shaburak Lord"}, 
      [726] = {name = "Shaburak Prince"}, 
      [727] = {name = "Askarak Demon"}, 
      [728] = {name = "Askarak Lord"}, 
      [729] = {name = "Askarak Prince"}, 
      [973] = {name = "Nightfiend"}, 
      [1019] = {name = "Demon Outcast"}, 
      [1134] = {name = "Dawnfire Asura"}, 
      [1135] = {name = "Midnight Asura"}, 
      [1196] = {name = "Grimeleech"}, 
      [1197] = {name = "Vexclaw"}, 
      [1198] = {name = "Hellflayer"}, 
      [1619] = {name = "Frost Flower Asura"}, 
      [1620] = {name = "True Dawnfire Asura"}, 
      [1621] = {name = "True Midnight Asura"}, 
      [1622] = {name = "True Frost Flower Asura"}, 
      [1637] = {name = "Floating Savant"}, 
      [34] = {name = "Dragon"}, 
      [39] = {name = "Dragon Lord"}, 
      [121] = {name = "Hydra"}, 
      [317] = {name = "Frost Dragon"}, 
      [385] = {name = "Dragon Hatchling"}, 
      [386] = {name = "Dragon Lord Hatchling"}, 
      [402] = {name = "Frost Dragon Hatchling"}, 
      [461] = {name = "Wyrm"}, 
      [617] = {name = "Draken Warmaster"}, 
      [618] = {name = "Draken Spellweaver"}, 
      [643] = {name = "Ghastly Dragon"}, 
      [672] = {name = "Draken Elite"}, 
      [673] = {name = "Draken Abominationl"}, 
      [963] = {name = "Elder Wyrm"}, 
      [1376] = {name = "Haunted Dragon"}, 
      [1380] = {name = "Ice Dragon"}, 
      [49] = {name = "Fire Elemental"}, 
      [236] = {name = "Water Elemental"}, 
      [279] = {name = "Massive Water Elemental"}, 
      [313] = {name = "Massive Fire Elemental"}, 
      [455] = {name = "Massive Earth Elemental"}, 
      [456] = {name = "Massive Energy Elemental"}, 
      [457] = {name = "Energy Elemental"}, 
      [458] = {name = "Earth Elemental"}, 
      [889] = {name = "Cliff Strider"}, 
      [890] = {name = "Ironblight"}, 
      [1569] = {name = "Ravenous Lava Lurker"}, 
      [1670] = {name = "Knowledge Elemental"}, 
      [717] = {name = "Yielothax"}, 
      [1224] = {name = "Reality Reaver"}, 
      [1234] = {name = "Sparkion"}, 
      [1235] = {name = "Breach Brood"}, 
      [1260] = {name = "Dread Intruder"}, 
      [383] = {name = "Dryad"}, 
      [462] = {name = "Wisp"}, 
      [1434] = {name = "Faun"}, 
      [1435] = {name = "Pooka"}, 
      [1436] = {name = "Twisted Pooka"}, 
      [1437] = {name = "Swan Maiden"}, 
      [1438] = {name = "Pixie"}, 
      [1439] = {name = "Boogy"}, 
      [1485] = {name = "Nymph"}, 
      [1496] = {name = "Dark Faun"}, 
      [1740] = {name = "Percht"}, 
      [1741] = {name = "Schiach"}, 
      [22] = {name = "Cyclops"}, 
      [55] = {name = "Behemoth"}, 
      [324] = {name = "Frost Giant"}, 
      [334] = {name = "Frost Giantess"}, 
      [389] = {name = "Cyclops Smith"}, 
      [391] = {name = "Cyclops Drone"}, 
      [1161] = {name = "Ogre Brute"}, 
      [1162] = {name = "Ogre Savage"}, 
      [1163] = {name = "Ogre Shaman"}, 
      [1314] = {name = "Orclops Doomhauler"}, 
      [1820] = {name = "Ogre Ruffian"}, 
      [1821] = {name = "Ogre Rowdy"}, 
      [1822] = {name = "Ogre Sage"}, 
      [9] = {name = "Necromancer"}, 
      [10] = {name = "Warlock"}, 
      [11] = {name = "Hunter"}, 
      [12] = {name = "Valkyrie"}, 
      [47] = {name = "Wild Warrior"}, 
      [54] = {name = "Witch"}, 
      [57] = {name = "Monk"}, 
      [58] = {name = "Priestess"}, 
      [72] = {name = "Stalker"}, 
      [73] = {name = "Hero"}, 
      [77] = {name = "Amazon"}, 
      [222] = {name = "Smuggler"}, 
      [223] = {name = "Bandit"}, 
      [224] = {name = "Assassin"}, 
      [225] = {name = "Dark Monk"}, 
      [247] = {name = "Pirate Marauder"}, 
      [248] = {name = "Pirate Cutthroat"}, 
      [249] = {name = "Pirate Buccaneer"}, 
      [250] = {name = "Pirate Corsair"}, 
      [252] = {name = "Enlightened Of The Cult"}, 
      [253] = {name = "Acolyte Of The Cult"}, 
      [254] = {name = "Adept Of The Cult"}, 
      [255] = {name = "Novice Of The Cult"}, 
      [310] = {name = "Nomad"}, 
      [322] = {name = "Barbarian Skullhunter"}, 
      [323] = {name = "Barbarian Bloodwalker"}, 
      [331] = {name = "Ice Witch"}, 
      [332] = {name = "Barbarian Brutetamer"}, 
      [333] = {name = "Barbarian Headsplitter"}, 
      [371] = {name = "Dark Magician"}, 
      [372] = {name = "Dark Apprentice"}, 
      [376] = {name = "Poacher"}, 
      [521] = {name = "Mutated Human"}, 
      [525] = {name = "Crazed Beggar"}, 
      [526] = {name = "Gang Member"}, 
      [527] = {name = "Gladiator"}, 
      [528] = {name = "Mad Scientist"}, 
      [529] = {name = "Infernalist"}, 
      [578] = {name = "Acolyte of Darkness"}, 
      [579] = {name = "Nightslayer"}, 
      [583] = {name = "Doomsay Cultist"}, 
      [585] = {name = "Midnight Warrior"}, 
      [587] = {name = "Bride of Night"}, 
      [719] = {name = "Feverish Citizen"}, 
      [776] = {name = "Nomad"}, 
      [777] = {name = "Nomad"}, 
      [867] = {name = "Grave Robber"}, 
      [868] = {name = "Crypft Defiler"}, 
      [922] = {name = "Adventurer"}, 
      [960] = {name = "Shadow Pupil"}, 
      [961] = {name = "Blood Priest"}, 
      [974] = {name = "Blood Hand"}, 
      [1119] = {name = "Glooth Bandit"}, 
      [1120] = {name = "Glooth Brigand"}, 
      [1145] = {name = "Vicious Squire"}, 
      [1146] = {name = "Renegade Knight"}, 
      [1147] = {name = "Vile Grandmaster"}, 
      [1413] = {name = "Misguided Thief"}, 
      [1481] = {name = "Goldhanded Cultist"}, 
      [1482] = {name = "Goldhanded Cultist Bride"}, 
      [1512] = {name = "Cult Believer"}, 
      [1513] = {name = "Cult Enforcer"}, 
      [1775] = {name = "Cobra Assassin"}, 
      [1776] = {name = "Cobra Scout"}, 
      [1824] = {name = "Cobra Vizier"}, 
      [1800] = {name = "Black Sphinx Acolyte"}, 
      [1799] = {name = "Priestess Of The Wild Sun"}, 
      [1798] = {name = "Burning Gladiator"}, 
      [2] = {name = "Orc Warlord"}, 
      [4] = {name = "Orc Rider"}, 
      [5] = {name = "Orc"}, 
      [6] = {name = "Orc Shamn"}, 
      [7] = {name = "Orc Warrior"}, 
      [8] = {name = "Orc Berserker"}, 
      [15] = {name = "Troll"}, 
      [23] = {name = "Minotaur Mage"}, 
      [24] = {name = "Minotaur Archer"}, 
      [25] = {name = "Minotaur"}, 
      [29] = {name = "Minotaur Guard"}, 
      [50] = {name = "Orc Spearman"}, 
      [53] = {name = "Frost Troll"}, 
      [59] = {name = "Orc Leader"}, 
      [61] = {name = "Goblin"}, 
      [62] = {name = "Elf"}, 
      [63] = {name = "Elf Arcanist"}, 
      [64] = {name = "Elf Scout"}, 
      [66] = {name = "Dwarf Geomancer"}, 
      [69] = {name = "Dwarf"}, 
      [70] = {name = "Dwarf Guard"}, 
      [71] = {name = "Dwarf Soldier"}, 
      [76] = {name = "Swamp Troll"}, 
      [214] = {name = "Dworc Voodoomaster"}, 
      [215] = {name = "Dworc Fleshhunter"}, 
      [216] = {name = "Dworc Venomsniper"}, 
      [277] = {name = "Island Troll"}, 
      [319] = {name = "Chakoya Tribewarden"}, 
      [328] = {name = "Chakoya Toolshaper"}, 
      [329] = {name = "Chakoya Windcaller"}, 
      [377] = {name = "Goblin Leader"}, 
      [379] = {name = "Dwarf Henchman"}, 
      [392] = {name = "Troll Champion"}, 
      [393] = {name = "Grynch Clan Goblin"}, 
      [463] = {name = "Goblin Assassin"}, 
      [464] = {name = "Goblin Scarvenger"}, 
      [540] = {name = "Furous Troll"}, 
      [541] = {name = "Troll Legionnaire"}, 
      [614] = {name = "Orc Marauder"}, 
      [737] = {name = "Firestarter"}, 
      [741] = {name = "Elf Overseer"}, 
      [745] = {name = "Troll Guard"}, 
      [886] = {name = "Enslaved Dwarf"}, 
      [888] = {name = "Lost Berserker"}, 
      [916] = {name = "Corym Charlatan"}, 
      [917] = {name = "Corym Skirmisher"}, 
      [918] = {name = "Corym Vanguard"}, 
      [920] = {name = "Little Corym Charlatan"}, 
      [924] = {name = "Lost Husher"},
      [925] = {name = "Lost Basher"}, 
      [926] = {name = "Lost Thrower"}, 
      [1044] = {name = "Moohtant"},
      [1045] = {name = "Minotaur Amazon"}, 
      [1046] = {name = "Execowtioner"}, 
      [1051] = {name = "Mooh'tah Warrior"}, 
      [1052] = {name = "Minotaur Hunter"}, 
      [1053] = {name = "Worm Priestess"}, 
      [1321] = {name = "Broken Shaper"}, 
      [1322] = {name = "Twisted Shaper"}, 
      [1394] = {name = "Shaper Matriarch"}, 
      [1412] = {name = "Misguided Bully"}, 
      [1486] = {name = "Barkless Devotee"}, 
      [1488] = {name = "Barkless Fanatic"}, 
      [1503] = {name = "Orc Cultist"}, 
      [1504] = {name = "Orc Cult Priest"}, 
      [1505] = {name = "Orc Cult Inquisitor"}, 
      [1506] = {name = "Orc Cult Fanatic"}, 
      [1507] = {name = "Orc Cult Minion"}, 
      [1508] = {name = "Minotaur Cult Follower"}, 
      [1509] = {name = "Minotaur Cult Prophet"}, 
      [1510] = {name = "Minotaur Cult Zealot"}, 
      [1529] = {name = "Lost Exile"}, 
      [1730] = {name = "Crazy Winter Vanguard"}, 
      [1731] = {name = "Crazy Winter Rearguard"}, 
      [1732] = {name = "Crazy Summer Vanguard"}, 
      [1733] = {name = "Crazy Summer Rearguard"}, 
      [1734] = {name = "Soul-broken Harbinger"}, 
      [1735] = {name = "Insane Siren"}, 
      [510] = {name = "Werewolf"}, 
      [1142] = {name = "Werebear"}, 
      [1143] = {name = "Wereboar"}, 
      [1144] = {name = "Werebadger"}, 
      [1549] = {name = "Werefox"}, 
      [17] = {name = "Bonelord"}, 
      [51] = {name = "Green Djinn"}, 
      [80] = {name = "Blue Djinn"}, 
      [95] = {name = "Gargoyle"}, 
      [103] = {name = "Efreet"}, 
      [104] = {name = "Marid"}, 
      [108] = {name = "Elder Bonelord"}, 
      [109] = {name = "Gazer"}, 
      [292] = {name = "Phantasm"}, 
      [299] = {name = "Nightmare"}, 
      [330] = {name = "Crystal Spider"}, 
      [460] = {name = "Bog Raider"}, 
      [518] = {name = "Nightmare Scion"}, 
      [520] = {name = "Nightstalker"}, 
      [570] = {name = "Medusa"}, 
      [698] = {name = "Midnight Panther"}, 
      [739] = {name = "Thornfire Wolf"}, 
      [740] = {name = "Crystalwolf"}, 
      [869] = {name = "Crystalcrusher"}, 
      [880] = {name = "Armadille"}, 
      [894] = {name = "Dragonling"}, 
      [978] = {name = "Rorc"}, 
      [980] = {name = "Forest Fury"}, 
      [1004] = {name = "Shock Head"}, 
      [1012] = {name = "Sight of Surrender"}, 
      [1013] = {name = "Guzzlemaw"}, 
      [1014] = {name = "Silencer"}, 
      [1015] = {name = "Choking Fear"}, 
      [1016] = {name = "Terrorsleep"}, 
      [1018] = {name = "Retching Horror"}, 
      [1021] = {name = "Feversleep"}, 
      [1022] = {name = "Frazzlemaw"}, 
      [1157] = {name = "Elder Forest Fury"}, 
      [1442] = {name = "Weakened Frazzlemaw"}, 
      [1443] = {name = "Enfeebled Silencer"}, 
      [1653] = {name = "Brain Squid"}, 
      [1655] = {name = "Cursed Book"}, 
      [1659] = {name = "Guardian of Tales"}, 
      [1663] = {name = "Burning Book"}, 
      [1664] = {name = "Icecold Book"}, 
      [1665] = {name = "Energetic Book"}, 
      [1666] = {name = "Energuardian Of Tales"}, 
      [1668] = {name = "Rage Squid"}, 
      [1669] = {name = "Squid Warden"}, 
      [1671] = {name = "Animated Feather"}, 
      [1721] = {name = "Lumbering Carnivor"}, 
      [1722] = {name = "Spiky Carnivor"}, 
      [1723] = {name = "Menancing Carnivor"}, 
      [1728] = {name = "Thanatursus"}, 
      [1729] = {name = "Arachnophobica"}, 
      [1808] = {name = "Sphinx"}, 
      [1807] = {name = "Feral Sphinx"}, 
      [1806] = {name = "Lamassu"}, 
      [1816] = {name = "Manticore"}, 
      [1819] = {name = "Gryphon"}, 
      [3] = {name = "War Wolf"}, 
      [13] = {name = "Black  Sheep"}, 
      [14] = {name = "Sheep"}, 
      [16] = {name = "Bear"}, 
      [21] = {name = "Rat"}, 
      [27] = {name = "Wolf"}, 
      [31] = {name = "Deer"}, 
      [32] = {name = "Dog"}, 
      [41] = {name = "Lion"}, 
      [42] = {name = "Polar Bear"}, 
      [52] = {name = "Winter Wolf"}, 
      [56] = {name = "Cave Rat"}, 
      [60] = {name = "Pig"}, 
      [74] = {name = "Rabbit"}, 
      [94] = {name = "Hyaena"}, 
      [105] = {name = "Badger"}, 
      [106] = {name = "Skunk"}, 
      [110] = {name = "Yeti"}, 
      [116] = {name = "Kongra"}, 
      [117] = {name = "Merlkin"}, 
      [118] = {name = "Sibang"}, 
      [122] = {name = "Bat"}, 
      [123] = {name = "Panda"}, 
      [125] = {name = "Tiger"}, 
      [211] = {name = "Elephant"}, 
      [260] = {name = "Mammoth"}, 
      [325] = {name = "Husky"}, 
      [327] = {name = "Silver Rabbit"}, 
      [384] = {name = "Squirrel"}, 
      [387] = {name = "Cat"}, 
      [502] = {name = "Mutated Rat"}, 
      [509] = {name = "Mutated Bat"}, 
      [516] = {name = "Mutated Tiger"}, 
      [555] = {name = "Evil Sheep"}, 
      [556] = {name = "Evil Sheep Lord"}, 
      [557] = {name = "Hot Dog"}, 
      [559] = {name = "Doom Deer"}, 
      [560] = {name = "Killer Rabbit"}, 
      [630] = {name = "Gnarhound"}, 
      [693] = {name = "Boar"}, 
      [720] = {name = "White Deer"}, 
      [723] = {name = "Starving Wolf"}, 
      [730] = {name = "Wilf Horse"}, 
      [733] = {name = "Dromedary"}, 
      [870] = {name = "Mushroom Sniffler"}, 
      [872] = {name = "Water Buffalo"}, 
      [877] = {name = "Modified Gnarhound"}, 
      [898] = {name = "Vulcongra"}, 
      [981] = {name = "Roaring Lion"}, 
      [1118] = {name = "Noble Lion"}, 
      [1139] = {name = "Gloom Wolf"}, 
      [1174] = {name = "Clomp"}, 
      [1395] = {name = "Stone Rhino"}, 
      [1548] = {name = "Fox"}, 
      [1570] = {name = "Mole"}, 
      [1742] = {name = "Baleful Bunny"}, 
      [120] = {name = "Carniphila"}, 
      [221] = {name = "Spit Nettle"}, 
      [511] = {name = "Haunted Treeling"}, 
      [679] = {name = "Bane Bringer"}, 
      [881] = {name = "Humongus Fungus"}, 
      [891] = {name = "Hideous Fungus"}, 
      [919] = {name = "Swampling"}, 
      [979] = {name = "Leaf Golem"}, 
      [982] = {name = "Wilting Leaf Golem"}, 
      [1042] = {name = "Glooth Anemone"}, 
      [1141] = {name = "Omnivora"}, 
      [28] = {name = "Snake"}, 
      [81] = {name = "Cobra"}, 
      [113] = {name = "Lizard Templar"}, 
      [114] = {name = "Lizard Sentinel"}, 
      [115] = {name = "Lizard Snakecharmer"}, 
      [119] = {name = "Crocodile"}, 
      [220] = {name = "Serpent Spawn"}, 
      [258] = {name = "Tortoise"}, 
      [259] = {name = "Thornback Tortoise"}, 
      [290] = {name = "Wyvern"}, 
      [438] = {name = "Sea Serpent"}, 
      [439] = {name = "Young Sea Serpent"}, 
      [616] = {name = "Lizard Zaogun"}, 
      [620] = {name = "Lizard Chosen"}, 
      [623] = {name = "Lizard Dragon Priest"}, 
      [624] = {name = "Lizard Legionnaire"}, 
      [625] = {name = "Lizard High Guard"}, 
      [627] = {name = "Killer Caiman"}, 
      [655] = {name = "Lizard Magistratus"}, 
      [656] = {name = "Lizard Noble"}, 
      [694] = {name = "Stampor"}, 
      [695] = {name = "Draptor"}, 
      [1096] = {name = "Seacrest Serpent"}, 
      [1525] = {name = "Stonerefiner"}, 
      [1817] = {name = "Young Goanna"}, 
      [1818] = {name = "Adult Goanna"}, 
      [19] = {name = "Slime"}, 
      [265] = {name = "Son of Verminor"}, 
      [289] = {name = "Defiler"}, 
      [513] = {name = "Acid Blob"}, 
      [514] = {name = "Death Blob"}, 
      [515] = {name = "Mercury Blob"}, 
      [584] = {name = "Midnight Spawn"}, 
      [1054] = {name = "Glooth Blob"}, 
      [1056] = {name = "Devourer"}, 
      [1658] = {name = "Ink Blob"}, 
      [18] = {name = "Ghoul"}, 
      [33] = {name = "Skeleton"}, 
      [37] = {name = "Demon Skeleton"}, 
      [48] = {name = "Ghost"}, 
      [65] = {name = "Mumy"}, 
      [68] = {name = "Vampire"}, 
      [78] = {name = "Banshee"}, 
      [99] = {name = "Lich"}, 
      [100] = {name = "Crypt Shambler"}, 
      [101] = {name = "Bonebeast"}, 
      [256] = {name = "Pirate Skeleton"}, 
      [257] = {name = "Pirate Ghost"}, 
      [281] = {name = "Hand of Cursed Fate"}, 
      [282] = {name = "Undead Dragon"}, 
      [283] = {name = "Lost Soul"}, 
      [284] = {name = "Betrayed Wraith"}, 
      [286] = {name = "Spectre"}, 
      [298] = {name = "Blightwalker"}, 
      [321] = {name = "Braindeath"}, 
      [388] = {name = "Undead Jester"}, 
      [446] = {name = "Skeleton Warrior"}, 
      [465] = {name = "Grim Reaper"}, 
      [483] = {name = "Vampire Bride"}, 
      [508] = {name = "Undead Gladiator"}, 
      [512] = {name = "Zombie"}, 
      [558] = {name = "Vampire Pig"}, 
      [580] = {name = "Bane of Light"}, 
      [594] = {name = "Undead Mine Worker"}, 
      [595] = {name = "Undead Prospector"}, 
      [675] = {name = "Souleater"}, 
      [696] = {name = "Undead Cavebear"}, 
      [704] = {name = "Ghoulish Hyaena"}, 
      [707] = {name = "Grave Guard"}, 
      [708] = {name = "Tomb Servant"}, 
      [710] = {name = "Death Priest"}, 
      [711] = {name = "Elder Mummy"}, 
      [712] = {name = "Honour Guard"}, 
      [958] = {name = "Vampire Viscount"}, 
      [959] = {name = "Vicious Manbat"}, 
      [962] = {name = "White Shade"}, 
      [975] = {name = "Gravedigger"}, 
      [976] = {name = "Tarnished Spirit"}, 
      [1040] = {name = "Blood Beast"}, 
      [1055] = {name = "Rot Elemental"}, 
      [1148] = {name = "Ghost Wolf"}, 
      [1415] = {name = "Putrid Mummy"}, 
      [1646] = {name = "Falcon Knight"}, 
      [1647] = {name = "Falcon Paladin"}, 
      [1674] = {name = "Skeleton Elite Warrior"}, 
      [1675] = {name = "Undead Elite Gladiator"}, 
      [1724] = {name = "Ripper Spectre"}, 
      [1725] = {name = "Gazer Spectre"}, 
      [1726] = {name = "Burster Spectre"}, 
      [1805] = {name = "Crypt Warden"}, 
      [26] = {name = "Rotworm"}, 
      [30] = {name = "Spider"}, 
      [36] = {name = "Poison  Spider"}, 
      [38] = {name = "Giant Spider"}, 
      [43] = {name = "Scorpion"}, 
      [44] = {name = "Wasp"}, 
      [45] = {name = "Bug"}, 
      [79] = {name = "Ancient Scarab"}, 
      [82] = {name = "Larva"}, 
      [83] = {name = "Scarab"}, 
      [124] = {name = "Centipede"}, 
      [219] = {name = "Tarantula"}, 
      [251] = {name = "Carrion Worm"}, 
      [621] = {name = "Insect Swarm"}, 
      [631] = {name = "Terramite"}, 
      [632] = {name = "Wailing Widow"}, 
      [633] = {name = "Lancer Beetle"}, 
      [641] = {name = "Sandcrawler"}, 
      [674] = {name = "Brimstomne Bug"}, 
      [691] = {name = "Berrypest"}, 
      [709] = {name = "Sacred Spider"}, 
      [731] = {name = "Slug"}, 
      [732] = {name = "Insectoid Scout"}, 
      [778] = {name = "Ladybug"}, 
      [786] = {name = "Crawler"}, 
      [787] = {name = "Spidris"}, 
      [788] = {name = "Kollos"}, 
      [790] = {name = "Swarmer"}, 
      [791] = {name = "Spitter"}, 
      [792] = {name = "Waspoid"}, 
      [796] = {name = "Insectoid Worker"}, 
      [797] = {name = "Spidris Elite"}, 
      [801] = {name = "Hive Overseer"}, 
      [878] = {name = "Drillworm"}, 
      [899] = {name = "Wiggler"}, 
      [912] = {name = "Emerald Damselfly"}, 
      [1531] = {name = "Deppworm"}, 
      [1532] = {name = "Diremaw"}, 
      [1544] = {name = "Cave Devourer"}, 
      [1545] = {name = "Tunnel Tyrant"}, 
      [1546] = {name = "Chasm Spawn"}, 
      [1736] = {name = "Lacewing Moth"}, 
      [1737] = {name = "Hibernal Moth"},
} 


customDoorsRange = {
	{ openDoor = 26545, closedDoor = 26541 },
	{ openDoor = 26545, closedDoor = 26542 },
	{ openDoor = 26546, closedDoor = 26543 },
	{ openDoor = 26546, closedDoor = 26544 },
	{ openDoor = 33121, closedDoor = 33117 },
	{ openDoor = 33121, closedDoor = 33118 },
	{ openDoor = 33122, closedDoor = 33119 },
	{ openDoor = 33122, closedDoor = 33120 },
	{ openDoor = 34673, closedDoor = 34671 },
	{ openDoor = 34674, closedDoor = 34672 },
	{ openDoor = 34677, closedDoor = 34675 },
	{ openDoor = 34678, closedDoor = 34676 },
}

ropeSpots = {384, 418, 8278, 8592, 13189, 14435, 14436, 15635, 19518, 26019, 24621, 24622, 24623, 24624}

doors = {
	[1209] = 1211, [1210] = 1211, [1212] = 1214, [1213] = 1214, [1219] = 1220, [1221] = 1222, [1231] = 1233, [1232] = 1233, [1234] = 1236,
	[1235] = 1236, [1237] = 1238, [1239] = 1240, [1249] = 1251, [1250] = 1251, [1252] = 1254, [1253] = 1254, [1539] = 1540, [1541] = 1542,
	[3535] = 3537, [3536] = 3537, [3538] = 3539, [3544] = 3546, [3545] = 3546, [3547] = 3548, [4913] = 4915, [4914] = 4915, [4916] = 4918,
	[4917] = 4918, [5082] = 5083, [5084] = 5085, [5098] = 5100, [5099] = 5100, [5101] = 5102, [5107] = 5109, [5108] = 5109, [5110] = 5111,
	[5116] = 5118, [5117] = 5118, [5119] = 5120, [5125] = 5127, [5126] = 5127, [5128] = 5129, [5134] = 5136, [5135] = 5136, [5137] = 5139,
	[5138] = 5139, [5140] = 5142, [5141] = 5142, [5143] = 5145, [5144] = 5145, [5278] = 5280, [5279] = 5280, [5281] = 5283, [5282] = 5283,
	[5284] = 5285, [5286] = 5287, [5515] = 5516, [5517] = 5518, [5732] = 5734, [5733] = 5734, [5735] = 5737, [5736] = 5737, [6192] = 6194,
	[6193] = 6194, [6195] = 6197, [6196] = 6197, [6198] = 6199, [6200] = 6201, [6249] = 6251, [6250] = 6251, [6252] = 6254, [6253] = 6254,
	[6255] = 6256, [6257] = 6258, [6795] = 6796, [6797] = 6798, [6799] = 6800, [6801] = 6802, [6891] = 6893, [6892] = 6893, [6894] = 6895,
	[6900] = 6902, [6901] = 6902, [6903] = 6904, [7033] = 7035, [7034] = 7035, [7036] = 7037, [7042] = 7044, [7043] = 7044, [7045] = 7046,
	[7054] = 7055, [7056] = 7057, [8541] = 8543, [8542] = 8543, [8544] = 8546, [8545] = 8546, [8547] = 8548, [8549] = 8550, [9165] = 9167,
	[9166] = 9167, [9168] = 9170, [9169] = 9170, [9171] = 9172, [9173] = 9174, [9267] = 9269, [9268] = 9269, [9270] = 9272, [9271] = 9272,
	[9273] = 9274, [9275] = 9276, [10276] = 10277, [10274] = 10275, [10268] = 10270, [10269] = 10270, [10271] = 10273, [10272] = 10273, [10471] = 10472,
	[10480] = 10481, [10477] = 10479, [10478] = 10479, [10468] = 10470, [10469] = 10470, [10775] = 10777, [10776] = 10777, [12092] = 12094, [12093] = 12094,
	[12188] = 12190, [12189] = 12190, [19840] = 19842, [19841] = 19842, [19843] = 19844, [19980] = 19982, [19981] = 19982, [19983] = 19984, [20273] = 20275,
	[20274] = 20275, [20276] = 20277, [17235] = 17236, [18208] = 18209, [13022] = 13023, [10784] = 10786, [10785] = 10786, [12099] = 12101, [12100] = 12101,
	[12197] = 12199, [12198] = 12199, [19849] = 19851, [19850] = 19851, [19852] = 19853, [19989] = 19991, [19990] = 19991, [19992] = 19993, [20282] = 20284,
	[20283] = 20284, [20285] = 20286, [17237] = 17238, [13020] = 13021, [10780] = 10781, [12095] = 12096, [12195] = 12196, [19845] = 19846, [19985] = 19986,
	[20278] = 20279, [10789] = 10790, [12102] = 12103, [12204] = 12205, [19854] = 19855, [19994] = 19995, [20287] = 20288, [10782] = 10783, [12097] = 12098,
	[12193] = 12194, [19847] = 19848, [19987] = 19988, [20280] = 20281, [10791] = 10792, [12104] = 12105, [12202] = 12203, [19856] = 19857, [19996] = 19997,
	[20289] = 20290, [22814] = 22815, [22815] = 22816, [22817] = 22818, [22819] = 22820, [22823] = 22825, [22824] = 22825, [22826] = 22827, [22828] = 22829,
	[25158] = 25159, [25160] = 25161, [25162] = 25163, [25164] = 25165, [27209] = 27210, [27211] = 27212, [33295] = 33296, [34679] = 34680, [34681] = 34682,
	[34683] = 34684, [34685] = 34686

}

verticalOpenDoors = {
	1211, 1220, 1224, 1228, 1233, 1238, 1242, 1246, 1251, 1256, 1260, 1540, 3546, 3548, 3550, 3552, 4915, 5083, 5109, 5111, 5113, 5115, 5127, 5129, 5131,
	5133, 5142, 5145, 5283, 5285, 5289, 5293, 5516, 5737, 5749, 6194, 6199, 6203, 6207, 6251, 6256, 6260, 6264, 6798, 6802, 6902, 6904, 6906, 6908, 7044,
	7046, 7048, 7050, 7055, 8543, 8548, 8552, 8556, 9167, 9172, 9269, 9274, 9274, 9269, 9278, 9282, 10270, 10275, 10279, 10283, 10479, 10481, 10485, 10483,
	10786, 12101, 12199, 19851, 19853, 19991, 19993, 20284, 20286, 17238, 13021, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997,
	20290, 22825, 22827, 22829, 22831, 25159, 25163, 26546
}

horizontalOpenDoors = {
	1214, 1222, 1226, 1230, 1236, 1240, 1244, 1248, 1254, 1258, 1262, 1542, 3537, 3539, 3541, 3543, 4918, 5085, 5100, 5102, 5104, 5106, 5118,
	5120, 5122, 5124, 5136, 5139, 5280, 5287, 5291, 5295, 5518, 5734, 5746, 6197, 6201, 6205, 6209, 6254, 6258, 6262, 6266, 6796, 6800, 6893,
	6895, 6897, 6899, 7035, 7037, 7039, 7041, 7057, 8546, 8550, 8554, 8558, 9170, 9174, 9272, 9276, 9280, 9284, 10273, 10277, 10281, 10285,
	10470, 10472, 10476, 10474, 10777, 12094, 12190, 19842, 19844, 19982, 19984, 20275, 20277, 17236, 18209, 13023, 10781, 12096, 12196,
	19846, 19986, 20279, 10783, 12098, 12194, 19848, 19988, 20281, 22816, 22818, 22820, 22822, 25161, 25165, 26545
}

openSpecialDoors = {
	1224, 1226, 1228, 1230, 1242, 1244, 1246, 1248, 1256, 1258, 1260, 1262, 3541, 3543, 3550, 3552, 5104, 5106, 5113, 5115, 5122, 5124, 5131, 5133,
	5289, 5291, 5293, 5295, 6203, 6205, 6207, 6209, 6260, 6262, 6264, 6266, 6897, 6899, 6906, 6908, 7039, 7041, 7048, 7050, 8552, 8554, 8556, 8558,
	9176, 9178, 9180, 9182, 9278, 9280, 9282, 9284, 10279, 10281, 10283, 10285, 10474, 10476, 10483, 10485, 10781, 12096, 12196, 19846, 19986, 20279,
	10783, 12098, 12194, 19848, 19988, 20281, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997, 20290
}

questDoors = {
	1223, 1225, 1241, 1243, 1255, 1257, 3542, 3551, 5105, 5114, 5123, 5132, 5288, 5290, 5745, 5748, 6202, 6204, 6259, 6261, 6898, 6907, 7040, 7049,
	8551, 8553, 9175,9177, 9277, 9279, 10278, 10280, 10475, 10484, 10782, 12097, 19847, 19987, 20280, 10791, 12104, 12204, 12195, 19856, 19996, 20289,
	22821, 22830, 25162, 25164
}

levelDoors = {
	1227, 1229, 1245, 1247, 1259, 1261, 3540, 3549, 5103, 5112, 5121, 5130, 5292, 5294, 6206, 6208, 6263, 6265, 6896, 6905, 7038, 7047, 8555, 8557,9179, 9181,
	9281, 9283, 10282, 10284, 10473, 10482, 10780, 10789, 10780, 12095, 12195, 19845, 19985, 20278, 10789, 12102, 12193, 12202, 19854, 19994, 20287
}

keys = {2086, 2087, 2088, 2089, 2090, 2091, 2092, 10032}

--[ Impact Analyser ]--
updateInterval = 2 --every 2 seconds
-- Healing
healingImpact = {} -- global table to insert data
-- Damage
damageImpact = {} -- global table to insert data

-- New prey => preyTimeLeft
nextPreyTime = {}


  --
local start = os.time()
local linecount = 0
debug.sethook(function(event, line)
    linecount = linecount + 1
    if os.mtime() - start >= 1 then
        if linecount >= 30000 then
            print(string.format("possible infinite loop in file %s near line %s", debug.getinfo(2).source, line))
            debug.sethook()
        end
        linecount = 0
        start = os.time()
    end
end, "l")
 --

function doCreatureSayWithRadius(cid, text, type, radiusx, radiusy, position)
	if not position then
		position = Creature(cid):getPosition()
	end

	local spectators, spectator = Game.getSpectators(position, false, true, radiusx, radiusx, radiusy, radiusy)
	for i = 1, #spectators do
		spectator = spectators[i]
		spectator:say(text, type, false, spectator, position)
	end
end

function getBlessingsCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 120 then
		return 20000
	else
		return (level - 20) * 200
	end
end

function getPvpBlessingCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 270 then
		return 50000
	else
		return (level - 20) * 200
	end
end

function isInRange(pos, fromPos, toPos)
	return pos.x >= fromPos.x and pos.y >= fromPos.y and pos.z >= fromPos.z and pos.x <= toPos.x and pos.y <= toPos.y and pos.z <= toPos.z
end

function isNumber(str)
	return tonumber(str) ~= nil
end

function Creature.getMonster(self)
return self:isMonster() and self or nil
end

function getTibianTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
end

table.contains = function(array, value)
	for _, targetColumn in pairs(array) do
		if targetColumn == value then
			return true
		end
	end
	return false
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

-- Stamina
if nextUseStaminaTime == nil then
    nextUseStaminaTime = {}
end

if nextUseStaminaPrey == nil then
    nextUseStaminaPrey = {}
end

if nextUseXpStamina == nil then
    nextUseXpStamina = {}
end

if lastItemImbuing == nil then
    lastItemImbuing = {}
end

if nextDelayPreyReroll == nil then
	nextDelayPreyReroll = {}
end

--Boss entry
if not bosssPlayers then
	bosssPlayers = {
		addPlayers = function (self, cid)
			local player = Player(cid)
			if not player then return false end
			if not self.players then
				self.players = {}
			end
			self.players[player:getId()] = 1
		end,
		removePlayer = function (self, cid)
			local player = Player(cid)
			if not player then  return false end
			if not self.players then return false end
			self.players[player:getId()] = nil
		end,
		getPlayersCount = function (self)
			if not self.players then return 0 end
			local c = 0
			for _ in pairs(self.players) do  c = c + 1 end
			return c
		end
	}
end

-- MARRY
PROPOSED_STATUS = 1
MARRIED_STATUS = 2
PROPACCEPT_STATUS = 3
LOOK_MARRIAGE_DESCR = TRUE
ITEM_WEDDING_RING = 2121
ITEM_ENGRAVED_WEDDING_RING = 10502

function getPlayerSpouse(id)
    local resultQuery = db.storeQuery("SELECT `marriage_spouse` FROM `players` WHERE `id` = " .. db.escapeString(id))
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "marriage_spouse")
        result.free(resultQuery)
        return ret
    end
    return -1
end

function setPlayerSpouse(id, val)
    db.query("UPDATE `players` SET `marriage_spouse` = " .. val .. " WHERE `id` = " .. id)
end

function getPlayerMarriageStatus(id)
    local resultQuery = db.storeQuery("SELECT `marriage_status` FROM `players` WHERE `id` = " .. db.escapeString(id))
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "marriage_status")
        result.free(resultQuery)
        return ret
    end
    return -1
end

function setPlayerMarriageStatus(id, val)
    db.query("UPDATE `players` SET `marriage_status` = " .. val .. " WHERE `id` = " .. id)
end

function Player:getMarriageDescription(thing)
    local descr = ""
    if getPlayerMarriageStatus(thing:getGuid()) == MARRIED_STATUS then
        playerSpouse = getPlayerSpouse(thing:getGuid())
        if self == thing then
            descr = descr .. " You are "
        elseif thing:getSex() == PLAYERSEX_FEMALE then
            descr = descr .. " She is "
        else
            descr = descr .. " He is "
        end
        descr = descr .. "married to " .. getPlayerNameById(playerSpouse) .. '.'
    end
    return descr
end

-- The following 2 functions can be used for delayed shouted text
function say(param)
selfSay(text)
doCreatureSay(param.cid, param.text, 1)
end

function delayedSay(text, delay)
local delay = delay or 0
local cid = getNpcCid()
addEvent(say, delay, {cid = cid, text = text})
end

function functionRevert()
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Corrupted, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Desert, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Dimension, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Grass, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Ice, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Mushroom, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Roshamuul, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Venom, 0)
Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.AllHabitats, 0)
for a = 1, #basins do
	local item = Tile(basins[a].pos):getItemById(24852)
	item:transform(12070)
end
local specs, spec = Game.getSpectators(Position(33629, 32693, 12), false, false, 25, 25, 85, 85)
for i = 1, #specs do
	spec = specs[i]
	if spec:isPlayer() then
		spec:teleportTo(Position(33630, 32648, 12))
		spec:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		spec:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You were teleported because the habitats are returning to their original form.')
	elseif spec:isMonster() then
		spec:remove()
	end
end
for x = 33611, 33625 do
	for y = 32658, 32727 do
		local position = Position(x, y, 12)
		local tile = Tile(position)
		if not tile then
			return
		end
		local ground = tile:getGround()
		if not ground then
			return
		end
		ground:remove()
		local items = tile:getItems()
		if items then
			for i = 1, #items do
				local item = items[i]
				item:remove()
			end
		end
	end
end

for x = 33634, 33648 do
	for y = 32658, 32727 do
		local position = Position(x, y, 12)
		local tile = Tile(position)
		if not tile then
			return
		end
		local ground = tile:getGround()
		if not ground then
			return
		end
		ground:remove()
		local items = tile:getItems()
		if items then
			for i = 1, #items do
				local item = items[i]
				item:remove()
			end
		end
	end
end

Game.loadMap('data/world/worldchanges/habitats.otbm')
return true
end

function getLootRandom()
	return math.random(0, MAX_LOOTCHANCE) / configManager.getNumber(configKeys.RATE_LOOT)
end
