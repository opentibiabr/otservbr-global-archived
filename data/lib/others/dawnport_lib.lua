-- First items, added only in first step and having no vocation
function dawnportAddFirstItems(player, item, slot)
	local firstItems = {
		slots = {
			[CONST_SLOT_HEAD] = Game.createItem(2461),
			[CONST_SLOT_ARMOR] = Game.createItem(2651),
			[CONST_SLOT_LEGS] = Game.createItem(2649),
			[CONST_SLOT_FEET] = Game.createItem(2643)
		}
	}

	for slot, item in pairs(firstItems.slots) do
		local ret = player:addItemEx(item, false, sot)
		if not ret then
			player:addItemEx(item, false, INDEX_WHEREEVER, 0)
		end
	end
end

-- On step in tiles, for first step, second and third or more steps
function dawnportTileStep(player, vocation)
	-- First Step
	local getVocation = player:getVocation()
	if getVocation and getVocation:getId() == VOCATION.ID.NONE then
		for i = 1, #DawnportTable.Effects do
			Position(vocation.effectPosition):sendMagicEffect(DawnportTable.Effects[i])
		end
		player:sendTutorial(vocation.tutorial)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"As this is the first time you try out a vocation, the Guild has kitted you out. " .. vocation.firstMessage)
		dawnportAddFirstItems(player, item, slot)
	-- Second step
	elseif player:getStorageValue(vocation.storage) == -1 and getVocation:getId() ~= VOCATION.ID.NONE then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("As this is your first time as a \z
		".. vocation.name ..', you received a few extra items. ' .. vocation.firstMessage))
		player:setStorageValue(vocation.storage, 1)
		player:sendTutorial(vocation.tutorial)
	-- Other steps
	elseif player:getStorageValue(vocation.storage) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have received the weapons of a \z
			".. vocation.name ..'. ' .. vocation.firstMessage))
	end
end

-- Set vocation
function dawnportSetVocation(player, vocationId)
	-- Get current vocation magic level
	local magic = {level = player:getBaseMagicLevel(), manaSpent = player:getManaSpent()}
	
	for level = 1, magic.level do
		magic.manaSpent = magic.manaSpent + player:getVocation():getRequiredManaSpent(level)
		
		--print("OLD " .. player:getVocation():getName() .. "->" .. player:getVocation():getId() .. " ML" .. " level:" .. level .. " reqManaSpent:" .. player:getVocation():getRequiredManaSpent(level))
	end
	
	--print("OLD " .. player:getVocation():getName() .. "->" .. player:getVocation():getId() .. " MAGIC" .. " level:" .. magic.level .. " totalManaSpent:" .. magic.manaSpent)

	local skills = {
		['fist'] = {id = SKILL_FIST},
		['club'] = {id = SKILL_CLUB},
		['sword'] = {id = SKILL_SWORD},
		['axe'] = {id = SKILL_AXE},
		['distance'] = {id = SKILL_DISTANCE},
		['shield'] = {id = SKILL_SHIELD}
	}
	
	-- Get current vocation skills
	for key, skill in pairs(skills) do
		skill.level = player:getSkillLevel(skill.id)
		skill.tries = player:getSkillTries(skill.id)
		
		for level = 11, skill.level do
            skill.tries = skill.tries + player:getVocation():getRequiredSkillTries(skill.id, level)
        end
		
		--print("OLD " .. player:getVocation():getName() .. "->" .. player:getVocation():getId() .. " SKILL:" .. key .. " id:" .. skill.id .. " level:" .. skill.level .. " totalTries:" .. skill.tries)
	end
	
	player:setVocation(Vocation(vocationId))
	
	if player:getLevel() > Dawnport.upgrade.level and player:getLevel() < Dawnport.limit.level then
		-- Set player stats if have level 9 or more (health, mana, capacity)
		dawnportSetStats(player)
	end
	
	-- Convert magic level from previous vocation
	local newMagicLevel = 0
	
	if magic.manaSpent > 0 then
		local reqManaSpent = player:getVocation():getRequiredManaSpent(newMagicLevel + 1)
		
		while magic.manaSpent >= reqManaSpent do
		  magic.manaSpent = magic.manaSpent - reqManaSpent
		  newMagicLevel = newMagicLevel + 1;
		  reqManaSpent = player:getVocation():getRequiredManaSpent(newMagicLevel + 1)
		end
	end
	
	--print("NEW " .. player:getVocation():getName() .. "->" .. player:getVocation():getId() .. " MAGIC" .. " level:" .. newMagicLevel .. " leftManaSpent:" .. magic.manaSpent)
	
	-- Apply magic level and/or mana spent
	if newMagicLevel > 0 then
		player:setMagicLevel(newMagicLevel, magic.manaSpent)
	elseif magic.manaSpent > 0 then
		player:addManaSpent(magic.manaSpent)
	end
	
	-- Convert skills from previous vocation
	for key, skill in pairs(skills) do
		local newSkillLevel = 10
		
		-- Calculate new level
		if skill.tries > 0 then
			local reqSkillTries = player:getVocation():getRequiredSkillTries(skill.id, (newSkillLevel + 1))
			
			while skill.tries >= reqSkillTries do
			  skill.tries = skill.tries - reqSkillTries
			  newSkillLevel = newSkillLevel + 1;
			  reqSkillTries = player:getVocation():getRequiredSkillTries(skill.id, (newSkillLevel + 1))
			end
		end
		
		--print("NEW " .. player:getVocation():getName() .. "->" .. player:getVocation():getId() .. " SKILL:" .. key .. " id:" .. skill.id .. " level:" .. newSkillLevel .. " leftTries:" .. skill.tries)
		
		-- Apply skill level and/or skill tries
		if newSkillLevel > 10 then
			player:setSkillLevel(skill.id, newSkillLevel, skill.tries)
		elseif skill.tries > 0 then
			player:addSkillTries(skill.id, skill.tries)
		end
    end
end

-- Remove items (weapons and shield)
function dawnportRemoveItems(player)
	local itemIds = {
		{id = 2379},
		{id = 2456},
		{id = 2512},
		{id = 23719},
		{id = 23721},
		{id = 23771}
	}

	for i = 1, #itemIds do
		if player:removeItem(itemIds[i].id, 1) then
			player:removeItem(itemIds[i].id, 1)
		end
	end
end

-- Add items
function dawnportAddItems(player, vocation)
	local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
	-- If dont have backpack, give one or will cause error and items will added on ground
	if not backpack then
		backpack = player:addItem(1988, 1, true, 1, CONST_SLOT_BACKPACK)
	end
	for slot, info in pairs(vocation.items) do
		local extra
		if slot > CONST_SLOT_AMMO then
			extra = true
		else
			local equipped = player:getSlotItem(slot)
			if equipped then
				equipped:moveTo(backpack)
			end
		end
		local giveItem = true
		if info.limit and info.storage then
			local given = math.max(player:getStorageValue(info.storage), 0)
			if given >= info.limit then
				giveItem = false
			else
				player:setStorageValue(info.storage, given + 1)
			end
		end
		if giveItem then
			if extra then
				player:addItemEx(Game.createItem(info[1], info[2]), INDEX_WHEREEVER, 0)
			else
				local ret = player:addItem(info[1], info[2], false, 1, slot)
				if not ret then
					player:addItemEx(Game.createItem(info[1], info[2]), false, slot)
				end
			end
		end
	end
end

-- Set outfit for each vocation
function dawnportSetOutfit(player, vocation)
	if player:getSex() == PLAYERSEX_MALE then
		player:setOutfit({
			lookBody = vocation.outfit.lookBody,
			lookAddons = vocation.outfit.lookAddons,
			lookTypeName = vocation.outfit.lookTypeName,
			lookType = vocation.outfit.lookTypeEx,
			lookHead = vocation.outfit.lookHead,
			lookMount = vocation.outfit.lookMount,
			lookLegs = vocation.outfit.lookLegs,
			lookFeet = vocation.outfit.lookFeet
		})
	else
		player:setOutfit({
			lookBody = vocation.outfit.lookBody,
			lookAddons = vocation.outfit.lookAddons,
			lookTypeName = vocation.outfit.lookTypeName,
			lookType = vocation.outfit.lookTypeFm,
			lookHead = vocation.outfit.lookHead,
			lookMount = vocation.outfit.lookMount,
			lookLegs = vocation.outfit.lookLegs,
			lookFeet = vocation.outfit.lookFeet
		})
	end
end

-- Set health/mana/capacity per vocation
function dawnportSetStats(player)
	-- Base stats
	local stats = {health = 150, mana = 55, capacity = 40000}
	local vocation = player:getVocation()
	
	-- NO VOCATION
	if vocation:getId() == VOCATION.ID.NONE and player:getLevel() <= (Dawnport.upgrade.level + 1) then
		local level = player:getLevel() - 1
		
		stats.health = stats.health + (level * vocation:getHealthGain())
		stats.mana = stats.mana + (level * vocation:getManaGain())
		stats.capacity = stats.capacity + (level * vocation:getCapacityGain())
	-- MAIN VOCATIONS
	elseif isInArray({VOCATION.ID.SORCERER, VOCATION.ID.DRUID, VOCATION.ID.PALADIN, VOCATION.ID.KNIGHT}, vocation:getId()) and player:getLevel() > Dawnport.upgrade.level then
		local baseLevel = 7
		local baseVocation = Vocation(VOCATION.ID.NONE)
		local level = player:getLevel() - 8
		
		stats.health = stats.health + (baseLevel * baseVocation:getHealthGain()) + (level * vocation:getHealthGain())
		stats.mana = stats.mana + (baseLevel * baseVocation:getManaGain()) + (level * vocation:getManaGain())
		stats.capacity = stats.capacity + (baseLevel * baseVocation:getCapacityGain()) + (level * vocation:getCapacityGain())
	end
	
	--print("[" .. vocation:getName() .. " Level:" .. player:getLevel() .. "]" .. " health:" .. stats.health .. " mana:" .. stats.mana .. " capacity:" .. stats.capacity)
	
	player:setMaxHealth(stats.health)
	player:addHealth(stats.health)
	player:setMaxMana(stats.mana)
	player:addMana(stats.mana)
	player:setCapacity(stats.capacity)
end

-- Set rookgaard health/mana/capacity (after talk with Inigo npc)
function rookgaardSetStats(player)
	local vocation = player:getVocation()
	if player:getLevel() <= 8 and vocation and vocation:getId() == VOCATION.ID.NONE then
    	player:setMaxHealth(5 * (player:getLevel() + 29))
   		player:addHealth(player:getMaxHealth())
    	player:setMaxMana(5 * ((6 * player:getLevel()) - (5 * 8) + 10))
    	player:addMana(player:getMaxMana())
		player:setCapacity((10 * (player:getLevel() + 39))*100)
	end
end

-- Teleport to the dawnport temple after reaching level 20 (the player has five minutes before being teleported)
function teleportToDawnportTemple(uid)
	local player = Player(uid)
	-- If not have the Oressa storage, teleport player to the temple
	if player and player:getStorageValue(Storage.Dawnport.DoorVocation) == -1 then
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
end

function isSkillGrowthLimited(player, skillId)
	-- Check resides on dawnport
	if player:getTown():getId() == TOWNS_LIST.DAWNPORT then
		local vocationId = player:getVocation():getId()
		local skillsLimit = Dawnport.limit.skills[vocationId]
		
		-- Check if is set a skillId limit
		if skillsLimit and skillsLimit[skillId] then
			-- Get current skillId level
			local skillLevel
			
			if skillId == SKILL_MAGLEVEL then
				skillLevel = player:getBaseMagicLevel()
			else
				skillLevel = player:getSkillLevel(skillId)
			end
			
			-- Check skillId limit
			if skillLevel >= skillsLimit[skillId] then
				return true
			end
		end
	end
	
	return false
end

Dawnport = {
	upgrade = {
		level = 8
	},
	limit = {
		level = 20,
		skills = {
			[VOCATION.ID.NONE] = {},
			[VOCATION.ID.SORCERER] = {
				[SKILL_MAGLEVEL] = 20
			},
			[VOCATION.ID.DRUID] = {
				[SKILL_MAGLEVEL] = 20
				
			},
			[VOCATION.ID.PALADIN] = {
				[SKILL_MAGLEVEL] = 9
			},
			[VOCATION.ID.KNIGHT] = {
				[SKILL_MAGLEVEL] = 4
			}
		}
	}
}

-- Table of configs
DawnportTable = {
	Effects = {
		CONST_ME_TUTORIALARROW,
		CONST_ME_TUTORIALSQUARE
	},
	[25005] = {
		-- First vocation (from lvl 1 to 7)
		first = {
			id = VOCATION.ID.DAWNPORT_SORCERER,
		},
		-- Second vocation (from lvl 8 to 20)
		second = {
			id = VOCATION.ID.SORCERER,
		},
		tutorial = 5,
		effectPosition = {x = 32050, y = 31891, z = 5},
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
			[11] = {8704, 2, true, storage = Storage.Dawnport.SorcererHealthPotion, limit = 1}, -- potion
			[12] = {7620, 10, true, storage = Storage.Dawnport.SorcererManaPotion, limit = 1}, -- potion
			[13] = {23723, 2, true, storage = Storage.Dawnport.SorcererLightestMissile, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, storage = Storage.Dawnport.SorcererLightStoneShower, limit = 1}, -- 2 light stone shower runes
			[15] = {2666, 1, true, storage = Storage.Dawnport.SorcererMeat, limit = 1}, -- 1 meat
		},
	},
	[25006] = {
		-- First vocation (from lvl 1 to 7)
		first = {
			id = VOCATION.ID.DAWNPORT_DRUID,
		},
		-- Second vocation (from lvl 8 to 20)
		second = {
			id = VOCATION.ID.DRUID,
		},
		tutorial = 6,
		effectPosition = {x = 32064, y = 31905, z = 5},
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
			[11] = {8704, 2, true, storage = Storage.Dawnport.DruidHealthPotion, limit = 1}, -- potion
			[12] = {7620, 10, true, storage = Storage.Dawnport.DruidManaPotion, limit = 1}, -- potion
			[13] = {23723, 2, true, storage = Storage.Dawnport.DruidLightestMissile, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, storage = Storage.Dawnport.DruidLightStoneShower, limit = 1}, -- 2 light stone shower runes
			[15] = {2666, 1, true, storage = Storage.Dawnport.DruidMeat, limit = 1}, -- 1 meat
		}
	},
	[25007] = {
		-- First vocation (from lvl 1 to 7)
		first = {
			id = VOCATION.ID.DAWNPORT_PALADIN,
		},
		-- Second vocation (from lvl 8 to 20)
		second = {
			id = VOCATION.ID.PALADIN,
		},
		tutorial = 4,
		effectPosition = {x = 32078, y = 31891, z = 5},
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
			[11] = {8704, 7, true, storage = Storage.Dawnport.PaladinHealthPotion, limit = 1}, -- potion
			[12] = {7620, 5, true, storage = Storage.Dawnport.PaladinManaPotion, limit = 1}, -- potion
			[13] = {23723, 1, true, storage = Storage.Dawnport.PaladinLightestMissile, limit = 1}, -- 1 lightest missile rune
			[14] = {23722, 1, true, storage = Storage.Dawnport.PaladinLightStoneShower, limit = 1}, -- 1 light stone shower rune
			[15] = {2666, 1, true, storage = Storage.Dawnport.PaladinMeat, limit = 1}, -- 1 meat
		}
	},
	[25008] = {
		-- First vocation (from lvl 1 to 7)
		first = {
			id = VOCATION.ID.DAWNPORT_KNIGHT,
		},
		-- Second vocation (from lvl 8 to 20)
		second = {
			id = VOCATION.ID.KNIGHT,
		},
		tutorial = 3,
		effectPosition = {x = 32064, y = 31876, z = 5},
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
			[11] = {8704, 10, true, storage = Storage.Dawnport.KnightHealthPotion, limit = 1}, -- potion
			[12] = {7620, 2, true, storage = Storage.Dawnport.KnightManaPotion, limit = 1}, -- potion
			[13] = {2666, 1, true, storage = Storage.Dawnport.KnightMeat, limit = 1} -- 1 meat
		}
	}
}
