DawnportTable = {
	Storage = {
		Storage.Dawnport.Sorcerer,
		Storage.Dawnport.Druid,
		Storage.Dawnport.Paladin,
		Storage.Dawnport.Knight
	},
	FirstItems = {
		2461,
		2651,
		2649,
		2238
	},
	[40001] = {
		first = {
			id = 1,
		},
		second = {
			id = 5,
		},
		tutorial = 5,
		skills = {1,2,3,4,5},
		limits = {20, 20},
		storage = Storage.Dawnport.Sorcerer,
		name = "sorcerer",
		firstMessage = "As a sorcerer, you can use the following spells: Magic Patch, Buzz, Scorch.",
		outfit = {
			lookBody = 109,
			lookAddons = 0,
			lookTypeName = {Mage}, -- {male, female}
			lookTypeEx = 130,
			lookTypeFm = 138,
			lookHead = 95,
			lookMount = 0,
			lookLegs = 112,
			lookFeet = 128
		},
		items = {
			[CONST_SLOT_LEFT] = {23719, 1, false}, -- the scorcher
			[CONST_SLOT_RIGHT] = {23771, 1, false}, -- spellbook of the novice
			[11] = {8704, 2, true, limitStorage = Storage.Dawnport.SorcererHealthPotion, limit = 1}, -- potion
			[12] = {7620, 10, true, limitStorage = Storage.Dawnport.SorcererManaPotion, limit = 1}, -- potion
			[13] = {23723, 2, true, limitStorage = Storage.Dawnport.SorcererLightestMissile, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, limitStorage = Storage.Dawnport.SorcererLightStoneShower, limit = 1} -- 2 light stone shower runes
		},
	},
	[40002] = {
		first = {
			id = 2,
		},
		second = {
			id = 6,
		},
		tutorial = 6,
		skills = {1,2,3,4,5},
		limits = {20, 20},
		storage = Storage.Dawnport.Druid,
		name = "druid",
		firstMessage = "As a druid, you can use these spells: Mud Attack, Chill Out, Magic Patch.",
		outfit = {
			lookBody = 123,
			lookAddons = 0,
			lookTypeName = {Mage}, -- {male, female}
			lookTypeEx = 130,
			lookTypeFm = 138,
			lookHead = 95,
			lookMount = 0,
			lookLegs = 9,
			lookFeet = 118
		},
		items = {
			[CONST_SLOT_LEFT] = {23721, 1, true}, -- the chiller
			[CONST_SLOT_RIGHT] = {23771, 1, true}, -- spellbook of the novice
			[11] = {8704, 2, true, limitStorage = Storage.Dawnport.StorageItemDruidHealthPotion, limit = 1}, -- potion
			[12] = {7620, 10, true, limitStorage = Storage.Dawnport.DruidManaPotion, limit = 1}, -- potion
			[13] = {23723, 2, true, limitStorage = Storage.Dawnport.DruidLightestMissile, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, limitStorage = Storage.Dawnport.DruidLightStoneShower, limit = 1} -- 2 light stone shower runes
		}
	},
	[40003] = {
		first = {
			id = 3,
		},
		second = {
			id = 7,
		},
		tutorial = 4,
		skills = {1,2,3,5},
		limits = {9, 20},
		receiveArrow = true,
		storage = Storage.Dawnport.Paladin,
		name = "paladin",
		firstMessage = "As a paladin, you can use the following spells: Magic Patch, Arrow Call.",
		outfit = {
			lookBody = 117,
			lookAddons = 0,
			lookTypeName = {Hunter}, -- {male, female}
			lookTypeEx = 129,
			lookTypeFm = 137,
			lookHead = 95,
			lookMount = 0,
			lookLegs = 98,
			lookFeet = 78
		},
		items = {
			[CONST_SLOT_LEFT] = {2456, 1, true}, -- bow
			[CONST_SLOT_AMMO] = {23839, 100, true}, -- 100 arrows
			[11] = {8704, 7, true, limitStorage = Storage.Dawnport.PaladinHealthPotion, limit = 1}, -- potion
			[12] = {7620, 5, true, limitStorage = Storage.Dawnport.PaladinManaPotion, limit = 1}, -- potion
			[13] = {23723, 1, true, limitStorage = Storage.Dawnport.PaladinLightestMissile, limit = 1}, -- 1 lightest missile rune
			[14] = {23722, 1, true, limitStorage = Storage.Dawnport.PaladinLightStoneShower, limit = 1} -- 1 light stone shower rune
		}
	},
	[40004] = {
		first = {
			id = 4,
		},
		second = {
			id = 8,
		},
		tutorial = 3,
		skills= {4},
		limits= {4, 20},
		storage = Storage.Dawnport.Knight,
		name = "knight",
		firstMessage = "As a knight, you can use the following spells: Bruise Bane.",
		outfit = {
			lookBody = 38,
			lookAddons = 0,
			lookTypeName = {Knight}, -- {male, female}
			lookTypeEx = 131,
			lookTypeFm = 139,
			lookHead = 95,
			lookMount = 0,
			lookLegs = 94,
			lookFeet = 115,
		},
		items = {
			[CONST_SLOT_LEFT] = {2379, 1, true}, -- dagger
			[CONST_SLOT_RIGHT] = {2512, 1, true}, -- wooden shield
			[11] = {8704, 10, true, limitStorage = Storage.Dawnport.KnightHealthPotion, limit = 1}, -- potion
			[12] = {7620, 2, true, limitStorage = Storage.Dawnport.KnightManaPotion, limit = 1}, -- potion
			[13] = {23723, 1, true, limitStorage = Storage.Dawnport.KnightLightestMissile, limit = 1}, -- 1 lightest missile rune
			[14] = {23722, 1, true, limitStorage = Storage.Dawnport.KnightLightStoneShower, limit = 1} -- 1 light stone shower rune
		}
	}
}