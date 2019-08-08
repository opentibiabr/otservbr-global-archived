Prey = {
    Credits = "System remake: Westwol ~ Packet logic: Cjaker ~  Formulas: slavidodo",
    Version = "4.0",
    LastUpdate = "07/07/19",
}
 
CONST_PREY_SLOT_FIRST = 0
CONST_PREY_SLOT_SECOND = 1
CONST_PREY_SLOT_THIRD = 2
 
CONST_MONSTER_TIER_BRONZE = 0
CONST_MONSTER_TIER_SILVER = 1
CONST_MONSTER_TIER_GOLD = 2
CONST_MONSTER_TIER_GOLD = 3
CONST_MONSTER_TIER_PLATINUM = 4
 
CONST_BONUS_DAMAGE_BOOST = 0
CONST_BONUS_DAMAGE_REDUCTION = 1
CONST_BONUS_XP_BONUS = 2
CONST_BONUS_IMPROVED_LOOT = 3
 
Prey.Config = {
    ListRerollPrice = 2000
}
 
Prey.S_Packets = {
    ShowDialog = 0xED,
    PreyRerollPrice = 0xE9,
    PreyData = 0xE8,
    PreyTimeLeft = 0xE7
}
 
Prey.StateTypes = {
    LOCKED = 0,
    INACTIVE = 1,
    ACTIVE = 2,
    SELECTION = 3,
    SELECTION_CHANGE_MONSTER = 4
}
 
Prey.UnlockTypes = {
    PREMIUM_OR_STORE = 0,
    STORE = 1,
    NONE = 2
}
 
Prey.Actions = {
    NEW_LIST = 0,
    NEW_BONUS = 1,
    SELECT = 2,
    NEW_LIST_PREY_WILDCARD = 3
}
 
Prey.C_Packets = {
    RequestData = 0xED,
    PreyAction = 0xEB
}
 
Prey.Bonuses = {
    [CONST_BONUS_DAMAGE_BOOST] = {step = 2, min = 7, max = 25},
    [CONST_BONUS_DAMAGE_REDUCTION] = {step = 2, min = 12, max = 30},
    [CONST_BONUS_XP_BONUS] = {step = 3, min = 13, max = 40},
    [CONST_BONUS_IMPROVED_LOOT] = {step = 3, min = 13, max = 40}
}
 
Prey.MonsterList = {
    [CONST_MONSTER_TIER_BRONZE] = {
        "Deepling Brawler", "Deepling Elite", "Deepling Guard", "Deepling Master Librarian", "Deepling Scout", "Deepling Spellsinger", "Deepling Tyrant", "Deepling Warrior", "Deepling Worker", "Quara Constrictor", "Quara Hydromancer", "Quara Mantassin", "Quara Pincher", "Quara Predator", "Quara Constrictor Scout", "Quara Hydromancer Scout", "Quara Mantassin Scout", "Quara Pincher Scout", "Quara Predator Scout", "Renegade Quara Constrictor", "Renegade Quara Hydromancer", "Renegade Quara Mantassin", "Renegade Quara Pincher", "Renegade Quara Predator", "Toad", "Salamander", "Manta Ray", "Calamary", "Jellyfish", "Shark", "Abyssal Calamary", "Blood Crab", "Crab", "Deepsea Blood Crab", "Terror Bird", "Marsh Stalker", "Stone Golem", "Ice Golem", "Worker Golem", "Damaged Worker Golem", "War Golem", "Eternal Guardian", "Iron Servant", "Golden Servant", "Diamond Servant", "Sandstone Scorpion", "Clay Guardian", "Enraged Crystal Golem", "Damaged Crystal Golem", "Stone Devourer", "Weeper", "Orewalker", "Lava Golem", "Magma Crawler", "Glooth Golem", "Metal Gargoyle", "Rustheap Golem", "Walker", "Biting Book", "Demon", "Fire Devil", "Dark Torturer", "Destroyer", "Diabolic Imp", "Fury", "Hellhound", "Hellfire Fighter", "Juggernaut", "Plaguesmith", "Hellspawn", "Gozzler", "Shaburak Demon", "Shaburak Lord", "Shaburak Prince", "Askarak Demon", "Askarak Lord", "Askarak Prince", "Nightfiend", "Demon Outcast", "Dawnfire Asura", "Midnight Asura", "Grimeleech", "Vexclaw", "Hellflayer", "Frost Flower Asura", "True Dawnfire Asura", "True Midnight Asura", "True Frost Flower Asura", "Floating Savant", "Dragon", "Dragon Lord", "Hydra", "Frost Dragon", "Dragon Hatchling", "Dragon Lord Hatchling", "Frost Dragon Hatchling", "Wyrm", "Draken Warmaster", "Draken Spellweaver", "Ghastly Dragon", "Draken Elite", "Draken Abomination", "Elder Wyrm", "Fire Elemental", "Water Elemental", "Massive Water Elemental", "Massive Earth Elemental", "Massive Fire Elemental", "Massive Energy Elemental", "Energy Elemental", "Earth Elemental", "Cliff Strider", "Ironblight", "Raging Fire", "Lava Lurker", "Ravenous Lava Lurker", "Knowledge Elemental", "Yielothax", "Reality Reaver", "Sparkion", "Breach Brood", "Dread Intruder", "Instable Sparkion", "Instable Breach Brood", "Stabilizing Reality Reaver", "Stabilizing Dread Intruder", "Dryad", "Wisp", "Faun", "Pooka", "Twisted Pooka", "Swan Maiden", "Pixie", "Boogy", "Nymph", "Dark Faun", "Arctic Faun", "Percht", "Schiach", "Cyclops", "Behemoth", "Frost Giant", "Frost Giantess", "Cyclops Smith", "Cyclops Drone", "Ogre Brute", "Ogre Savage", "Ogre Shaman", "Orclops Doomhauler", "Orclops Ravager", "Necromancer", "Warlock", "Hunter", "Valkyrie", "Wild Warrior", "Witch", "Monk", "Priestess", "Stalker", "Hero", "Amazon", "Bandit", "Smuggler", "Assassin", "Dark Monk", "Pirate Marauder", "Pirate Cutthroat", "Pirate Buccaneer", "Pirate Corsair", "Enlightened of the Cult", "Acolyte of the Cult", "Adept of the Cult", "Novice of the Cult", "Nomad", "Barbarian Skullhunter", "Barbarian Bloodwalker", "Ice Witch", "Barbarian Brutetamer", "Barbarian Headsplitter", "Dark Magician", "Dark Apprentice", "Poacher", "Mutated Human", "Crazed Beggar", "Gang Member", "Mad Scientist", "Gladiator", "Infernalist", "Acolyte of Darkness", "Nightslayer", "Doomsday Cultist", "Midnight Warrior", "Feverish Citizen", "Nomad", "Shadow Pupil", "Blood Priest", "Blood Hand", "Glooth Bandit", "Glooth Brigand", "Vicious Squire", "Renegade Knight", "Vile Grandmaster", "Misguided Thief", "Goldhanded Cultist", "Goldhanded Cultist Bride", "Cult Believer", "Cult Enforcer", "Cult Scholar", "Orc Warlord", "Orc Rider", "Orc", "Orc Shaman", "Orc Warrior", "Orc Berserker", "Troll", "Minotaur Mage", "Minotaur Archer", "Minotaur", "Minotaur Guard", "Orc Spearman", "Frost Troll", "Orc Leader", "Goblin", "Elf", "Elf Arcanist", "Elf Scout", "Dwarf Geomancer", "Dwarf", "Dwarf Guard", "Dwarf Soldier", "Swamp Troll", "Dworc Voodoomaster", "Dworc Venomsniper", "Dworc Fleshhunter", "Island Troll", "Chakoya Tribewarden", "Chakoya Toolshaper", "Chakoya Windcaller", "Goblin Leader", "Dwarf Henchman", "Troll Champion", "Goblin Assassin", "Goblin Scavenger", "Orc Marauder", "Enslaved Dwarf", "Lost Berserker", "Corym Charlatan", "Corym Skirmisher", "Corym Vanguard", "Little Corym Charlatan", "Lost Husher", "Lost Basher", "Lost Thrower", "Moohtant", "Minotaur Amazon", "Execowtioner", "Mooh'tah Warrior", "Minotaur Hunter", "Worm Priestess", "Minotaur Invader", "Broken Shaper", "Twisted Shaper", "Shaper Matriarch", "Misguided Bully", "Barkless Devotee", "Barkless Fanatic", "Orc Cultist", "Orc Cult Priest", "Orc Cult Inquisitor", "Orc Cult Fanatic", "Orc Cult Minion", "Minotaur Cult Follower", "Minotaur Cult Prophet", "Minotaur Cult Zealot", "Lost Exile", "Crazed Winter Vanguard", "Crazed Winter Rearguard", "Crazed Summer Vanguard", "Crazed Summer Rearguard", "Soul-Broken Harbinger", "Insane Siren", "Werewolf", "Werebear", "Wereboar", "Werebadger", "Werefox", "Bonelord", "Green Djinn", "Blue Djinn", "Gargoyle", "Efreet", "Marid", "Elder Bonelord", "Gazer", "Phantasm", "Nightmare", "Crystal Spider", "Bog Raider", "Nightmare Scion", "Nightstalker", "Medusa", "Midnight Panther", "Thornfire Wolf", "Crystal Wolf", "Crystalcrusher", "Armadile", "Dragonling", "Rorc", "Forest Fury", "Shock Head", "Sight of Surrender", "Guzzlemaw", "Silencer", "Choking Fear", "Terrorsleep", "Retching Horror", "Feversleep", "Frazzlemaw", "Tainted Soul", "Redeemed Soul", "Elder Forest Fury", "Weakened Frazzlemaw", "Enfeebled Silencer", "Brain Squid", "Flying Book", "Cursed Book", "Guardian of Tales", "Burning Book", "Icecold Book", "Energuardian of Tales", "Energetic Book", "Rage Squid", "Squid Warden", "Animated Feather", "Lumbering Carnivor", "Spiky Carnivor", "Menacing Carnivor", "Thanatursus", "Arachnophobica", "War Wolf", "Bear", "Wolf", "Lion", "Polar Bear", "Winter Wolf", "Cave Rat", "Hyaena", "Skunk", "Kongra", "Merlkin", "Sibang", "Bat", "Tiger", "Elephant", "Mammoth", "Mutated Rat", "Mutated Bat", "Mutated Tiger", "Gnarlhound", "Boar", "Vulcongra", "Roaring Lion", "Noble Lion", "Gloom Wolf", "Clomp", "Stone Rhino", "Carniphila", "Spit Nettle", "Haunted Treeling", "Bane Bringer", "Humongous Fungus", "Swampling", "Hideous Fungus", "Leaf Golem", "Wilting Leaf Golem", "Glooth Anemone", "Omnivora", "Cobra", "Lizard Templar", "Lizard Sentinel", "Lizard Snakecharmer", "Crocodile", "Serpent Spawn", "Tortoise", "Thornback Tortoise", "Wyvern", "Sea Serpent", "Young Sea Serpent", "Lizard Zaogun", "Lizard Chosen", "Lizard Dragon Priest", "Lizard Legionnaire", "Lizard High Guard", "Killer Caiman", "Lizard Magistratus", "Lizard Noble", "Stampor", "Seacrest Serpent", "Stonerefiner", "Slime", "Squidgy Slime", "Son of Verminor", "Defiler", "Acid Blob", "Death Blob", "Mercury Blob", "Essence of Darkness", "Glooth Blob", "Devourer", "Ink Blob", "Ghoul", "Skeleton", "Demon Skeleton", "Ghost", "Mummy", "Vampire", "Banshee", "Lich", "Crypt Shambler", "Bonebeast", "Pirate Skeleton", "Pirate Ghost", "Hand of Cursed Fate", "Undead Dragon", "Lost Soul", "Betrayed Wraith", "Spectre", "Blightwalker", "Braindeath", "Undead Jester", "Skeleton Warrior", "Grim Reaper", "Vampire Bride", "Undead Gladiator", "Zombie", "Souleater", "Ghoulish Hyaena", "Grave Guard", "Tomb Servant", "Death Priest", "Elder Mummy", "Honour Guard", "Vampire Viscount", "Vicious Manbat", "White Shade", "Gravedigger", "Tarnished Spirit", "Blood Beast", "Rot Elemental", "Ghost Wolf", "Putrid Mummy", "Falcon Knight", "Falcon Paladin", "Skeleton Elite Warrior", "Undead Elite Gladiator", "Ripper Spectre", "Gazer Spectre", "Burster Spectre", "Rotworm", "Giant Spider", "Ancient Scarab", "Larva", "Scarab", "Centipede", "Tarantula", "Sandcrawler", "Brimstone Bug", "Slug", "Insectoid Scout", "Crawler", "Spidris", "Kollos", "Swarmer", "Spitter", "Waspoid", "Insectoid Worker", "Spidris Elite", "Hive Overseer", "Drillworm", "Wiggler", "Emerald Damselfly", "Deepworm", "Diremaw", "Cave Devourer"


    },
    [CONST_MONSTER_TIER_SILVER] = {
         "Deepling Brawler", "Deepling Elite", "Deepling Guard", "Deepling Master Librarian", "Deepling Scout", "Deepling Spellsinger", "Deepling Tyrant", "Deepling Warrior", "Deepling Worker", "Quara Constrictor", "Quara Hydromancer", "Quara Mantassin", "Quara Pincher", "Quara Predator", "Quara Constrictor Scout", "Quara Hydromancer Scout", "Quara Mantassin Scout", "Quara Pincher Scout", "Quara Predator Scout", "Renegade Quara Constrictor", "Renegade Quara Hydromancer", "Renegade Quara Mantassin", "Renegade Quara Pincher", "Renegade Quara Predator", "Toad", "Salamander", "Manta Ray", "Calamary", "Jellyfish", "Shark", "Abyssal Calamary", "Blood Crab", "Crab", "Deepsea Blood Crab", "Terror Bird", "Marsh Stalker", "Stone Golem", "Ice Golem", "Worker Golem", "Damaged Worker Golem", "War Golem", "Eternal Guardian", "Iron Servant", "Golden Servant", "Diamond Servant", "Sandstone Scorpion", "Clay Guardian", "Enraged Crystal Golem", "Damaged Crystal Golem", "Stone Devourer", "Weeper", "Orewalker", "Lava Golem", "Magma Crawler", "Glooth Golem", "Metal Gargoyle", "Rustheap Golem", "Walker", "Biting Book", "Demon", "Fire Devil", "Dark Torturer", "Destroyer", "Diabolic Imp", "Fury", "Hellhound", "Hellfire Fighter", "Juggernaut", "Plaguesmith", "Hellspawn", "Gozzler", "Shaburak Demon", "Shaburak Lord", "Shaburak Prince", "Askarak Demon", "Askarak Lord", "Askarak Prince", "Nightfiend", "Demon Outcast", "Dawnfire Asura", "Midnight Asura", "Grimeleech", "Vexclaw", "Hellflayer", "Frost Flower Asura", "True Dawnfire Asura", "True Midnight Asura", "True Frost Flower Asura", "Floating Savant", "Dragon", "Dragon Lord", "Hydra", "Frost Dragon", "Dragon Hatchling", "Dragon Lord Hatchling", "Frost Dragon Hatchling", "Wyrm", "Draken Warmaster", "Draken Spellweaver", "Ghastly Dragon", "Draken Elite", "Draken Abomination", "Elder Wyrm", "Fire Elemental", "Water Elemental", "Massive Water Elemental", "Massive Earth Elemental", "Massive Fire Elemental", "Massive Energy Elemental", "Energy Elemental", "Earth Elemental", "Cliff Strider", "Ironblight", "Raging Fire", "Lava Lurker", "Ravenous Lava Lurker", "Knowledge Elemental", "Yielothax", "Reality Reaver", "Sparkion", "Breach Brood", "Dread Intruder", "Instable Sparkion", "Instable Breach Brood", "Stabilizing Reality Reaver", "Stabilizing Dread Intruder", "Dryad", "Wisp", "Faun", "Pooka", "Twisted Pooka", "Swan Maiden", "Pixie", "Boogy", "Nymph", "Dark Faun", "Arctic Faun", "Percht", "Schiach", "Cyclops", "Behemoth", "Frost Giant", "Frost Giantess", "Cyclops Smith", "Cyclops Drone", "Ogre Brute", "Ogre Savage", "Ogre Shaman", "Orclops Doomhauler", "Orclops Ravager", "Necromancer", "Warlock", "Hunter", "Valkyrie", "Wild Warrior", "Witch", "Monk", "Priestess", "Stalker", "Hero", "Amazon", "Bandit", "Smuggler", "Assassin", "Dark Monk", "Pirate Marauder", "Pirate Cutthroat", "Pirate Buccaneer", "Pirate Corsair", "Enlightened of the Cult", "Acolyte of the Cult", "Adept of the Cult", "Novice of the Cult", "Nomad", "Barbarian Skullhunter", "Barbarian Bloodwalker", "Ice Witch", "Barbarian Brutetamer", "Barbarian Headsplitter", "Dark Magician", "Dark Apprentice", "Poacher", "Mutated Human", "Crazed Beggar", "Gang Member", "Mad Scientist", "Gladiator", "Infernalist", "Acolyte of Darkness", "Nightslayer", "Doomsday Cultist", "Midnight Warrior", "Feverish Citizen", "Nomad", "Shadow Pupil", "Blood Priest", "Blood Hand", "Glooth Bandit", "Glooth Brigand", "Vicious Squire", "Renegade Knight", "Vile Grandmaster", "Misguided Thief", "Goldhanded Cultist", "Goldhanded Cultist Bride", "Cult Believer", "Cult Enforcer", "Cult Scholar", "Orc Warlord", "Orc Rider", "Orc", "Orc Shaman", "Orc Warrior", "Orc Berserker", "Troll", "Minotaur Mage", "Minotaur Archer", "Minotaur", "Minotaur Guard", "Orc Spearman", "Frost Troll", "Orc Leader", "Goblin", "Elf", "Elf Arcanist", "Elf Scout", "Dwarf Geomancer", "Dwarf", "Dwarf Guard", "Dwarf Soldier", "Swamp Troll", "Dworc Voodoomaster", "Dworc Venomsniper", "Dworc Fleshhunter", "Island Troll", "Chakoya Tribewarden", "Chakoya Toolshaper", "Chakoya Windcaller", "Goblin Leader", "Dwarf Henchman", "Troll Champion", "Goblin Assassin", "Goblin Scavenger", "Orc Marauder", "Enslaved Dwarf", "Lost Berserker", "Corym Charlatan", "Corym Skirmisher", "Corym Vanguard", "Little Corym Charlatan", "Lost Husher", "Lost Basher", "Lost Thrower", "Moohtant", "Minotaur Amazon", "Execowtioner", "Mooh'tah Warrior", "Minotaur Hunter", "Worm Priestess", "Minotaur Invader", "Broken Shaper", "Twisted Shaper", "Shaper Matriarch", "Misguided Bully", "Barkless Devotee", "Barkless Fanatic", "Orc Cultist", "Orc Cult Priest", "Orc Cult Inquisitor", "Orc Cult Fanatic", "Orc Cult Minion", "Minotaur Cult Follower", "Minotaur Cult Prophet", "Minotaur Cult Zealot", "Lost Exile", "Crazed Winter Vanguard", "Crazed Winter Rearguard", "Crazed Summer Vanguard", "Crazed Summer Rearguard", "Soul-Broken Harbinger", "Insane Siren", "Werewolf", "Werebear", "Wereboar", "Werebadger", "Werefox", "Bonelord", "Green Djinn", "Blue Djinn", "Gargoyle", "Efreet", "Marid", "Elder Bonelord", "Gazer", "Phantasm", "Nightmare", "Crystal Spider", "Bog Raider", "Nightmare Scion", "Nightstalker", "Medusa", "Midnight Panther", "Thornfire Wolf", "Crystal Wolf", "Crystalcrusher", "Armadile", "Dragonling", "Rorc", "Forest Fury", "Shock Head", "Sight of Surrender", "Guzzlemaw", "Silencer", "Choking Fear", "Terrorsleep", "Retching Horror", "Feversleep", "Frazzlemaw", "Tainted Soul", "Redeemed Soul", "Elder Forest Fury", "Weakened Frazzlemaw", "Enfeebled Silencer", "Brain Squid", "Flying Book", "Cursed Book", "Guardian of Tales", "Burning Book", "Icecold Book", "Energuardian of Tales", "Energetic Book", "Rage Squid", "Squid Warden", "Animated Feather", "Lumbering Carnivor", "Spiky Carnivor", "Menacing Carnivor", "Thanatursus", "Arachnophobica", "War Wolf", "Bear", "Wolf", "Lion", "Polar Bear", "Winter Wolf", "Cave Rat", "Hyaena", "Skunk", "Kongra", "Merlkin", "Sibang", "Bat", "Tiger", "Elephant", "Mammoth", "Mutated Rat", "Mutated Bat", "Mutated Tiger", "Gnarlhound", "Boar", "Vulcongra", "Roaring Lion", "Noble Lion", "Gloom Wolf", "Clomp", "Stone Rhino", "Carniphila", "Spit Nettle", "Haunted Treeling", "Bane Bringer", "Humongous Fungus", "Swampling", "Hideous Fungus", "Leaf Golem", "Wilting Leaf Golem", "Glooth Anemone", "Omnivora", "Cobra", "Lizard Templar", "Lizard Sentinel", "Lizard Snakecharmer", "Crocodile", "Serpent Spawn", "Tortoise", "Thornback Tortoise", "Wyvern", "Sea Serpent", "Young Sea Serpent", "Lizard Zaogun", "Lizard Chosen", "Lizard Dragon Priest", "Lizard Legionnaire", "Lizard High Guard", "Killer Caiman", "Lizard Magistratus", "Lizard Noble", "Stampor", "Seacrest Serpent", "Stonerefiner", "Slime", "Squidgy Slime", "Son of Verminor", "Defiler", "Acid Blob", "Death Blob", "Mercury Blob", "Essence of Darkness", "Glooth Blob", "Devourer", "Ink Blob", "Ghoul", "Skeleton", "Demon Skeleton", "Ghost", "Mummy", "Vampire", "Banshee", "Lich", "Crypt Shambler", "Bonebeast", "Pirate Skeleton", "Pirate Ghost", "Hand of Cursed Fate", "Undead Dragon", "Lost Soul", "Betrayed Wraith", "Spectre", "Blightwalker", "Braindeath", "Undead Jester", "Skeleton Warrior", "Grim Reaper", "Vampire Bride", "Undead Gladiator", "Zombie", "Souleater", "Ghoulish Hyaena", "Grave Guard", "Tomb Servant", "Death Priest", "Elder Mummy", "Honour Guard", "Vampire Viscount", "Vicious Manbat", "White Shade", "Gravedigger", "Tarnished Spirit", "Blood Beast", "Rot Elemental", "Ghost Wolf", "Putrid Mummy", "Falcon Knight", "Falcon Paladin", "Skeleton Elite Warrior", "Undead Elite Gladiator", "Ripper Spectre", "Gazer Spectre", "Burster Spectre", "Rotworm", "Giant Spider", "Ancient Scarab", "Larva", "Scarab", "Centipede", "Tarantula", "Sandcrawler", "Brimstone Bug", "Slug", "Insectoid Scout", "Crawler", "Spidris", "Kollos", "Swarmer", "Spitter", "Waspoid", "Insectoid Worker", "Spidris Elite", "Hive Overseer", "Drillworm", "Wiggler", "Emerald Damselfly", "Deepworm", "Diremaw", "Cave Devourer"

,
    },
    [CONST_MONSTER_TIER_GOLD] = {
        "Deepling Brawler", "Deepling Elite", "Deepling Guard", "Deepling Master Librarian", "Deepling Scout", "Deepling Spellsinger", "Deepling Tyrant", "Deepling Warrior", "Deepling Worker", "Quara Constrictor", "Quara Hydromancer", "Quara Mantassin", "Quara Pincher", "Quara Predator", "Quara Constrictor Scout", "Quara Hydromancer Scout", "Quara Mantassin Scout", "Quara Pincher Scout", "Quara Predator Scout", "Renegade Quara Constrictor", "Renegade Quara Hydromancer", "Renegade Quara Mantassin", "Renegade Quara Pincher", "Renegade Quara Predator", "Toad", "Salamander", "Manta Ray", "Calamary", "Jellyfish", "Shark", "Abyssal Calamary", "Blood Crab", "Crab", "Deepsea Blood Crab", "Terror Bird", "Marsh Stalker", "Stone Golem", "Ice Golem", "Worker Golem", "Damaged Worker Golem", "War Golem", "Eternal Guardian", "Iron Servant", "Golden Servant", "Diamond Servant", "Sandstone Scorpion", "Clay Guardian", "Enraged Crystal Golem", "Damaged Crystal Golem", "Stone Devourer", "Weeper", "Orewalker", "Lava Golem", "Magma Crawler", "Glooth Golem", "Metal Gargoyle", "Rustheap Golem", "Walker", "Biting Book", "Demon", "Fire Devil", "Dark Torturer", "Destroyer", "Diabolic Imp", "Fury", "Hellhound", "Hellfire Fighter", "Juggernaut", "Plaguesmith", "Hellspawn", "Gozzler", "Shaburak Demon", "Shaburak Lord", "Shaburak Prince", "Askarak Demon", "Askarak Lord", "Askarak Prince", "Nightfiend", "Demon Outcast", "Dawnfire Asura", "Midnight Asura", "Grimeleech", "Vexclaw", "Hellflayer", "Frost Flower Asura", "True Dawnfire Asura", "True Midnight Asura", "True Frost Flower Asura", "Floating Savant", "Dragon", "Dragon Lord", "Hydra", "Frost Dragon", "Dragon Hatchling", "Dragon Lord Hatchling", "Frost Dragon Hatchling", "Wyrm", "Draken Warmaster", "Draken Spellweaver", "Ghastly Dragon", "Draken Elite", "Draken Abomination", "Elder Wyrm", "Fire Elemental", "Water Elemental", "Massive Water Elemental", "Massive Earth Elemental", "Massive Fire Elemental", "Massive Energy Elemental", "Energy Elemental", "Earth Elemental", "Cliff Strider", "Ironblight", "Raging Fire", "Lava Lurker", "Ravenous Lava Lurker", "Knowledge Elemental", "Yielothax", "Reality Reaver", "Sparkion", "Breach Brood", "Dread Intruder", "Instable Sparkion", "Instable Breach Brood", "Stabilizing Reality Reaver", "Stabilizing Dread Intruder", "Dryad", "Wisp", "Faun", "Pooka", "Twisted Pooka", "Swan Maiden", "Pixie", "Boogy", "Nymph", "Dark Faun", "Arctic Faun", "Percht", "Schiach", "Cyclops", "Behemoth", "Frost Giant", "Frost Giantess", "Cyclops Smith", "Cyclops Drone", "Ogre Brute", "Ogre Savage", "Ogre Shaman", "Orclops Doomhauler", "Orclops Ravager", "Necromancer", "Warlock", "Hunter", "Valkyrie", "Wild Warrior", "Witch", "Monk", "Priestess", "Stalker", "Hero", "Amazon", "Bandit", "Smuggler", "Assassin", "Dark Monk", "Pirate Marauder", "Pirate Cutthroat", "Pirate Buccaneer", "Pirate Corsair", "Enlightened of the Cult", "Acolyte of the Cult", "Adept of the Cult", "Novice of the Cult", "Nomad", "Barbarian Skullhunter", "Barbarian Bloodwalker", "Ice Witch", "Barbarian Brutetamer", "Barbarian Headsplitter", "Dark Magician", "Dark Apprentice", "Poacher", "Mutated Human", "Crazed Beggar", "Gang Member", "Mad Scientist", "Gladiator", "Infernalist", "Acolyte of Darkness", "Nightslayer", "Doomsday Cultist", "Midnight Warrior", "Feverish Citizen", "Nomad", "Shadow Pupil", "Blood Priest", "Blood Hand", "Glooth Bandit", "Glooth Brigand", "Vicious Squire", "Renegade Knight", "Vile Grandmaster", "Misguided Thief", "Goldhanded Cultist", "Goldhanded Cultist Bride", "Cult Believer", "Cult Enforcer", "Cult Scholar", "Orc Warlord", "Orc Rider", "Orc", "Orc Shaman", "Orc Warrior", "Orc Berserker", "Troll", "Minotaur Mage", "Minotaur Archer", "Minotaur", "Minotaur Guard", "Orc Spearman", "Frost Troll", "Orc Leader", "Goblin", "Elf", "Elf Arcanist", "Elf Scout", "Dwarf Geomancer", "Dwarf", "Dwarf Guard", "Dwarf Soldier", "Swamp Troll", "Dworc Voodoomaster", "Dworc Venomsniper", "Dworc Fleshhunter", "Island Troll", "Chakoya Tribewarden", "Chakoya Toolshaper", "Chakoya Windcaller", "Goblin Leader", "Dwarf Henchman", "Troll Champion", "Goblin Assassin", "Goblin Scavenger", "Orc Marauder", "Enslaved Dwarf", "Lost Berserker", "Corym Charlatan", "Corym Skirmisher", "Corym Vanguard", "Little Corym Charlatan", "Lost Husher", "Lost Basher", "Lost Thrower", "Moohtant", "Minotaur Amazon", "Execowtioner", "Mooh'tah Warrior", "Minotaur Hunter", "Worm Priestess", "Minotaur Invader", "Broken Shaper", "Twisted Shaper", "Shaper Matriarch", "Misguided Bully", "Barkless Devotee", "Barkless Fanatic", "Orc Cultist", "Orc Cult Priest", "Orc Cult Inquisitor", "Orc Cult Fanatic", "Orc Cult Minion", "Minotaur Cult Follower", "Minotaur Cult Prophet", "Minotaur Cult Zealot", "Lost Exile", "Crazed Winter Vanguard", "Crazed Winter Rearguard", "Crazed Summer Vanguard", "Crazed Summer Rearguard", "Soul-Broken Harbinger", "Insane Siren", "Werewolf", "Werebear", "Wereboar", "Werebadger", "Werefox", "Bonelord", "Green Djinn", "Blue Djinn", "Gargoyle", "Efreet", "Marid", "Elder Bonelord", "Gazer", "Phantasm", "Nightmare", "Crystal Spider", "Bog Raider", "Nightmare Scion", "Nightstalker", "Medusa", "Midnight Panther", "Thornfire Wolf", "Crystal Wolf", "Crystalcrusher", "Armadile", "Dragonling", "Rorc", "Forest Fury", "Shock Head", "Sight of Surrender", "Guzzlemaw", "Silencer", "Choking Fear", "Terrorsleep", "Retching Horror", "Feversleep", "Frazzlemaw", "Tainted Soul", "Redeemed Soul", "Elder Forest Fury", "Weakened Frazzlemaw", "Enfeebled Silencer", "Brain Squid", "Flying Book", "Cursed Book", "Guardian of Tales", "Burning Book", "Icecold Book", "Energuardian of Tales", "Energetic Book", "Rage Squid", "Squid Warden", "Animated Feather", "Lumbering Carnivor", "Spiky Carnivor", "Menacing Carnivor", "Thanatursus", "Arachnophobica", "War Wolf", "Bear", "Wolf", "Lion", "Polar Bear", "Winter Wolf", "Cave Rat", "Hyaena", "Skunk", "Kongra", "Merlkin", "Sibang", "Bat", "Tiger", "Elephant", "Mammoth", "Mutated Rat", "Mutated Bat", "Mutated Tiger", "Gnarlhound", "Boar", "Vulcongra", "Roaring Lion", "Noble Lion", "Gloom Wolf", "Clomp", "Stone Rhino", "Carniphila", "Spit Nettle", "Haunted Treeling", "Bane Bringer", "Humongous Fungus", "Swampling", "Hideous Fungus", "Leaf Golem", "Wilting Leaf Golem", "Glooth Anemone", "Omnivora", "Cobra", "Lizard Templar", "Lizard Sentinel", "Lizard Snakecharmer", "Crocodile", "Serpent Spawn", "Tortoise", "Thornback Tortoise", "Wyvern", "Sea Serpent", "Young Sea Serpent", "Lizard Zaogun", "Lizard Chosen", "Lizard Dragon Priest", "Lizard Legionnaire", "Lizard High Guard", "Killer Caiman", "Lizard Magistratus", "Lizard Noble", "Stampor", "Seacrest Serpent", "Stonerefiner", "Slime", "Squidgy Slime", "Son of Verminor", "Defiler", "Acid Blob", "Death Blob", "Mercury Blob", "Essence of Darkness", "Glooth Blob", "Devourer", "Ink Blob", "Ghoul", "Skeleton", "Demon Skeleton", "Ghost", "Mummy", "Vampire", "Banshee", "Lich", "Crypt Shambler", "Bonebeast", "Pirate Skeleton", "Pirate Ghost", "Hand of Cursed Fate", "Undead Dragon", "Lost Soul", "Betrayed Wraith", "Spectre", "Blightwalker", "Braindeath", "Undead Jester", "Skeleton Warrior", "Grim Reaper", "Vampire Bride", "Undead Gladiator", "Zombie", "Souleater", "Ghoulish Hyaena", "Grave Guard", "Tomb Servant", "Death Priest", "Elder Mummy", "Honour Guard", "Vampire Viscount", "Vicious Manbat", "White Shade", "Gravedigger", "Tarnished Spirit", "Blood Beast", "Rot Elemental", "Ghost Wolf", "Putrid Mummy", "Falcon Knight", "Falcon Paladin", "Skeleton Elite Warrior", "Undead Elite Gladiator", "Ripper Spectre", "Gazer Spectre", "Burster Spectre", "Rotworm", "Giant Spider", "Ancient Scarab", "Larva", "Scarab", "Centipede", "Tarantula", "Sandcrawler", "Brimstone Bug", "Slug", "Insectoid Scout", "Crawler", "Spidris", "Kollos", "Swarmer", "Spitter", "Waspoid", "Insectoid Worker", "Spidris Elite", "Hive Overseer", "Drillworm", "Wiggler", "Emerald Damselfly", "Deepworm", "Diremaw", "Cave Devourer"


    }
}
 
-- Communication functions
function Player.sendResource(self, resourceType, value)
    local typeByte = 0
    if resourceType == "bank" then
        typeByte = 0x00
    elseif resourceType == "inventory" then
        typeByte = 0x01
    elseif resourceType == "prey" then
        typeByte = 0x0A
    end
    local msg = NetworkMessage()
    msg:addByte(0xEE)
    msg:addByte(typeByte)
    msg:addU64(value)
    msg:sendToPlayer(self)
end
 
function Player.sendErrorDialog(self, error)
    local msg = NetworkMessage()
    msg:addByte(Prey.S_Packets.ShowDialog)
    msg:addByte(0x15)
    msg:addString(error)
    msg:sendToPlayer(self)
end
 
-- Core functions
function Player.setRandomBonusValue(self, slot, bonus, typeChange)
    local type = self:getPreyBonusType(slot)
 
    local min = Prey.Bonuses[type].min
    local max = Prey.Bonuses[type].max
    local step = Prey.Bonuses[type].step
 
    if bonus then
        if typeChange then
            self:setPreyBonusValue(slot, math.random(min, max))
        else
            local oldValue = self:getPreyBonusValue(slot)
            if (oldValue + step >= max) then
                self:setPreyBonusValue(slot, max)
            else
                while (self:getPreyBonusValue(slot) - oldValue < step) do
                    self:setPreyBonusValue(slot, math.random(min, max))
                end
            end
        end
    else
        self:setPreyBonusValue(slot, math.random(min, max))
    end
 
    self:setPreyBonusGrade(slot, math.floor((self:getPreyBonusValue(slot) - min) / (max - min) * 10))
    if (self:getPreyBonusGrade(slot) == 10 and self:getPreyBonusValue(slot) < max) then
        self:setPreyBonusGrade(slot, self:getPreyBonusGrade(slot) - 1)
    end
end
 
function Player.getMonsterTier(self)
    if self:getLevel() > 0 and self:getLevel() < 60 then
        return CONST_MONSTER_TIER_BRONZE
    elseif self:getLevel() >= 60 and self:getLevel() < 160 then
        return CONST_MONSTER_TIER_SILVER
    elseif self:getLevel() >= 160 then
        return CONST_MONSTER_TIER_GOLD
    end
end
 
function Player.createMonsterList(self)
    -- Do not allow repeated monsters
    local repeatedList = {}
    for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
        if (self:getPreyCurrentMonster(slot) ~= '') then
            repeatedList[#repeatedList + 1] = self:getPreyCurrentMonster(slot)
        end
        if (self:getPreyMonsterList(slot) ~= '') then
            local currentList = self:getPreyMonsterList(slot):split(";")
            for i = 1, #currentList do
                repeatedList[#repeatedList + 1] = currentList[i]
            end
        end
    end
    -- Generating monsterList
    local monsters = {}
    while (#monsters ~= 9) do
        local randomMonster = Prey.MonsterList[self:getMonsterTier()][math.random(#Prey.MonsterList[self:getMonsterTier()])]
        -- Verify that monster actually exists
        if MonsterType(randomMonster) and not table.contains(monsters, randomMonster) and not table.contains(repeatedList, randomMonster) then
            monsters[#monsters + 1] = randomMonster
        end
    end
    return table.concat(monsters, ";")
end
 
function Player.resetPreySlot(self, slot, from)
    self:setPreyMonsterList(slot, self:createMonsterList())
    self:setPreyState(slot, from)
    return self:sendPreyData(slot)
end
 
function Player.getMinutesUntilFreeReroll(self, slot)
    local currentTime = os.time()
    if (self:getPreyNextUse(slot) <= currentTime) then
        return 0
    end
    return math.floor((self:getPreyNextUse(slot) - currentTime) / 60)
end
 
function Player.getRerollPrice(self)
    return (self:getLevel() / 2) * 100
end
 
function onRecvbyte(player, msg, byte)
    if (byte == Prey.C_Packets.RequestData) then
        player:sendPreyData(CONST_PREY_SLOT_FIRST)
        player:sendPreyData(CONST_PREY_SLOT_SECOND)
        player:sendPreyData(CONST_PREY_SLOT_THIRD)
    elseif (byte == Prey.C_Packets.PreyAction) then
        player:preyAction(msg)
    end
end
 
function Player.preyAction(self, msg)
 
    local slot = msg:getByte()
    local action = msg:getByte()
 
    if not slot then
        return self:sendErrorDialog("Sorry, there was an issue, please relog-in.")
    end
 
    -- Verify whether the slot is unlocked
    if (self:getPreyUnlocked(slot) ~= 1) then
        return self:sendErrorDialog("Sorry, you don't have this slot unlocked yet.")
    end
 
    -- Listreroll
    if (action == Prey.Actions.NEW_LIST) then
 
        -- Verifying state
        if (self:getPreyState(slot) ~= Prey.StateTypes.ACTIVE and self:getPreyState(slot) ~= Prey.StateTypes.SELECTION and self:getPreyState(slot) ~= Prey.StateTypes.SELECTION_CHANGE_MONSTER) then
            return self:sendErrorDialog("This is slot is not even active.")
        end
 
        -- If free reroll is available
        if (self:getMinutesUntilFreeReroll(slot) == 0) then
            self:setPreyNextUse(slot, os.time() + 20 * 60 * 60)
        elseif (not self:removeMoneyNpc(self:getRerollPrice())) then
            return self:sendErrorDialog("You do not have enough money to perform this action.")
        end
 
        self:setPreyCurrentMonster(slot, "")
        self:setPreyMonsterList(slot, self:createMonsterList())
        self:setPreyState(slot, Prey.StateTypes.SELECTION_CHANGE_MONSTER)
 
    -- Listreroll with wildcards
    elseif (action == Prey.Actions.NEW_LIST_PREY_WILDCARD) then
 
 
                if (self:getStorageValue(63353) < 5) then
                        return self:sendErrorDialog("You don't have any bonus rerolls.")
                end
 
        -- Removing bonus rerolls
                self:setStorageValue(63353, (self:getStorageValue(63353)-5))
 
        self:setPreyCurrentMonster(slot, "")
        self:setPreyMonsterList(slot, self:createMonsterList())
        self:setPreyState(slot, Prey.StateTypes.SELECTION_CHANGE_MONSTER)
 
    -- Bonus reroll
    elseif (action == Prey.Actions.NEW_BONUS) then
 
        -- Verifying state
        if (self:getPreyState(slot) ~= Prey.StateTypes.ACTIVE) then
            return self:sendErrorDialog("This is slot is not even active.")
                end
 
 
                if (self:getStorageValue(63353) <= 0) then
                        return self:sendErrorDialog("You don't have any bonus rerolls.")
                end
 
        -- Removing bonus rerolls
                self:setStorageValue(63353, (self:getStorageValue(63353)-1))
 
        -- Calculating new bonus
        local oldType = self:getPreyBonusType(slot)
        self:setPreyBonusType(slot, math.random(CONST_BONUS_DAMAGE_BOOST, CONST_BONUS_IMPROVED_LOOT))
        self:setRandomBonusValue(slot, true, (oldType ~= self:getPreyBonusType(slot) and true or false))
 
    -- Select monster from list
    elseif (action == Prey.Actions.SELECT) then
 
        local selectedMonster = msg:getByte()
        local monsterList = self:getPreyMonsterList(slot):split(";")
 
        -- Verify if the monster exists.
        local monster = MonsterType(monsterList[selectedMonster + 1])
        if not monster then
            return self:sendPreyData(slot)
        end
 
        -- Verifying slot state
        if (self:getPreyState(slot) ~= Prey.StateTypes.SELECTION and self:getPreyState(slot) ~= Prey.StateTypes.SELECTION_CHANGE_MONSTER) then
            return self:sendErrorDialog("This slot can't select monsters.")
        end
 
        -- Proceeding to prey monster selection
        self:selectPreyMonster(slot, monsterList[selectedMonster + 1])
    end
 
    -- Perfom slot update
    return self:sendPreyData(slot)
end
 
function Player.selectPreyMonster(self, slot, monster)
 
    -- Verify if the monster exists.
    local monster = MonsterType(monster)
    if not monster then
        return self:sendPreyData(slot)
    end
 
    local msg = NetworkMessage()
 
    -- Only first/expired selection list gets new prey bonus
    if (self:getPreyState(slot) == Prey.StateTypes.SELECTION) then
        -- Generating random prey type
        self:setPreyBonusType(slot, math.random(CONST_BONUS_DAMAGE_BOOST, CONST_BONUS_IMPROVED_LOOT))
        -- Generating random bonus stats
        self:setRandomBonusValue(slot, false, false)
    end
 
    -- Setting current monster
    self:setPreyCurrentMonster(slot, monster:getName())
    -- Setting preySlot state
    self:setPreyState(slot, Prey.StateTypes.ACTIVE)
    -- Time left
    self:setPreyTimeLeft(slot, 7200) -- 2 hours
end
 
function Player.sendPreyData(self, slot)
    if not slot then
        return true
    end
 
    local slotState = self:getPreyState(slot)
 
    local msg = NetworkMessage()
    msg:addByte(Prey.S_Packets.PreyData) -- packet header
    msg:addByte(slot) -- slot number
    msg:addByte(slotState) -- slot state
   
    -- This slot will preserve the same bonus and % but the monster might be changed
    if slotState == Prey.StateTypes.SELECTION_CHANGE_MONSTER then
 
        -- This values have to be stored on each slot
        msg:addByte(self:getPreyBonusType(slot))
        msg:addU16(self:getPreyBonusValue(slot))
        msg:addByte(self:getPreyBonusGrade(slot))
 
        -- MonsterList already exists in the slot
        local monsterList = self:getPreyMonsterList(slot):split(";")
        msg:addByte(#monsterList)
        for i = 1, #monsterList do
            local monster = MonsterType(monsterList[i])
            if monster then
                msg:addString(monster:getName())
                msg:addU16(monster:getOutfit().lookType or 21)
                msg:addByte(monster:getOutfit().lookHead or 0x00)
                msg:addByte(monster:getOutfit().lookBody or 0x00)
                msg:addByte(monster:getOutfit().lookLegs or 0x00)
                msg:addByte(monster:getOutfit().lookFeet or 0x00)
                msg:addByte(monster:getOutfit().lookAddons or 0x00)
            else
                -- Reset slot as it got bugged
                return self:resetPreySlot(slot, Prey.StateTypes.SELECTION_CHANGE_MONSTER)
            end
        end
 
 
    -- This slot will have a new monsterList and a random bonus
    elseif slotState == Prey.StateTypes.SELECTION then
 
        -- If list is empty, then we will create a new one and assign it to the monsterList or timeleft = 0
        local preyMonsterList = self:getPreyMonsterList(slot)
        if preyMonsterList == '' then
            self:setPreyMonsterList(slot, self:createMonsterList())
            -- Resending this preySlot as there was a change.
            return self:sendPreyData(slot)
        end
 
        local monsterList = preyMonsterList:split(";")
        msg:addByte(#monsterList)
        for i = 1, #monsterList do
            local monster = MonsterType(monsterList[i])
            if monster then
                msg:addString(monster:getName())
                msg:addU16(monster:getOutfit().lookType or 21)
                msg:addByte(monster:getOutfit().lookHead or 0x00)
                msg:addByte(monster:getOutfit().lookBody or 0x00)
                msg:addByte(monster:getOutfit().lookLegs or 0x00)
                msg:addByte(monster:getOutfit().lookFeet or 0x00)
                msg:addByte(monster:getOutfit().lookAddons or 0x00)
            else
                -- Reset slot as it got bugged
                return self:resetPreySlot(slot, Prey.StateTypes.SELECTION)
            end
        end
 
    -- This slot is active and will show current monster and bonus
    elseif slotState == Prey.StateTypes.ACTIVE then
 
        -- Getting current monster
        local monster = MonsterType(self:getPreyCurrentMonster(slot))
        if monster then
            msg:addString(monster:getName())
            msg:addU16(monster:getOutfit().lookType or 21)
            msg:addByte(monster:getOutfit().lookHead or 0x00)
            msg:addByte(monster:getOutfit().lookBody or 0x00)
            msg:addByte(monster:getOutfit().lookLegs or 0x00)
            msg:addByte(monster:getOutfit().lookFeet or 0x00)
            msg:addByte(monster:getOutfit().lookAddons or 0x00)
            msg:addByte(self:getPreyBonusType(slot))
            msg:addU16(self:getPreyBonusValue(slot))
            msg:addByte(self:getPreyBonusGrade(slot))
            msg:addU16(self:getPreyTimeLeft(slot))
        else
            -- Reset slot as it got expired or bugged.
            return self:resetPreySlot(slot, Prey.StateTypes.SELECTION)
        end
 
    -- This slot is inactive and will not take any extra bytes
    elseif slotState == Prey.StateTypes.INACTIVE then
 
 
    elseif slotState == Prey.StateTypes.LOCKED then
        msg.addByte(Prey.UnlockTypes.PREMIUM_OR_STORE) -- Store unlock method
    end
 
    -- Resources and times are always sent
    msg:addU16(self:getMinutesUntilFreeReroll(slot)) -- next prey reroll here
    -- Client 11.9+ compat, feature unavailable.
    if self:getClient().version >= 1190 then
        msg:addByte(0x00) -- preyWildCards
    end
    msg:addByte(0xEC)
    self:sendResource("prey", self:getStorageValue(63353))
    self:sendResource("bank", self:getBankBalance())
    self:sendResource("inventory", self:getMoney())
    -- List reroll price
    msg:addByte(Prey.S_Packets.PreyRerollPrice)
    msg:addU32(self:getRerollPrice())
    -- Client 11.9+ compat, feature unavailable.
    if self:getClient().version >= 1190 then
        msg:addByte(1)
        msg:addByte(2+2+1)
    end
    -- Sending message to client
    msg:sendToPlayer(self)
end