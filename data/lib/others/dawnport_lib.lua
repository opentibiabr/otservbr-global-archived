-- First items, added only in first step and having no vocation
function dawnportAddFirstItems(player)
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
function dawnportTileStep(player, trial)
	-- First Step
	local vocationId = player:getVocation():getId()
	if vocationId == VOCATION.ID.NONE then
		for i = 1, #Dawnport.trial.effects do
			Position(trial.effectPosition):sendMagicEffect(Dawnport.trial.effects[i])
		end
		player:sendTutorial(trial.tutorialId)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"As this is the first time you try out a vocation, the Guild has kitted you out. " .. trial.message)
		dawnportAddFirstItems(player)
	-- Second step
	elseif player:getStorageValue(trial.storage) == -1 and vocationId ~= VOCATION.ID.NONE then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("As this is your first time as a \z
		".. trial.vocation.name ..', you received a few extra items. ' .. trial.message))
		player:setStorageValue(trial.storage, 1)
		player:sendTutorial(trial.tutorialId)
	-- Other steps
	elseif player:getStorageValue(trial.storage) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have received the weapons of a \z
		".. trial.vocation.name ..'. ' .. trial.message))
	end
end

-- Set player vocation, converts magic level and skills between vocations and set proper stats
-- Keep it as global function due its called from vocation trial, Oressa and Inigo
function dawnportSetVocation(player, vocationId)
	-- Get current vocation magic level and mana spent
	local magic = {level = player:getBaseMagicLevel(), manaSpent = player:getManaSpent()}
	
	for level = 1, magic.level do
		magic.manaSpent = magic.manaSpent + player:getVocation():getRequiredManaSpent(level)
		
		--print("OLD " .. player:getVocation():getName() .. " MAGIC LEVEL" .. " level:" .. level .. " reqManaSpent:" .. player:getVocation():getRequiredManaSpent(level))
	end
	
	--print("OLD " .. player:getVocation():getName() .. " MAGIC LEVEL" .. " level:" .. magic.level .. " totalManaSpent:" .. magic.manaSpent)

	local skills = {
		{id = SKILL_FIST},
		{id = SKILL_CLUB},
		{id = SKILL_SWORD},
		{id = SKILL_AXE},
		{id = SKILL_DISTANCE},
		{id = SKILL_SHIELD}
	}
	
	-- Get current vocation skills levels and skills tries
	for i = 1, #skills do
		skills[i].level = player:getSkillLevel(skills[i].id)
		skills[i].tries = player:getSkillTries(skills[i].id)
		
		for level = 11, skills[i].level do
            skills[i].tries = skills[i].tries + player:getVocation():getRequiredSkillTries(skills[i].id, level)
        end
		
		--print("OLD " .. player:getVocation():getName() .. " SKILL" .. " id:" .. skills[i].id .. " level:" .. skills[i].level .. " totalTries:" .. skills[i].tries)
	end
	
	-- Set player new vocation
	player:setVocation(Vocation(vocationId))
	
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
	
	--print("NEW " .. player:getVocation():getName() .. " MAGIC LEVEL" .. " level:" .. newMagicLevel .. " leftManaSpent:" .. magic.manaSpent)
	
	-- Apply magic level and/or mana spent
	if newMagicLevel > 0 then
		player:setMagicLevel(newMagicLevel, magic.manaSpent)
	elseif magic.manaSpent > 0 then
		player:addManaSpent(magic.manaSpent)
	end
	
	-- Convert skills from previous vocation
	for i = 1, #skills do
		local newSkillLevel = 10
		
		-- Calculate new level
		if skills[i].tries > 0 then
			local reqSkillTries = player:getVocation():getRequiredSkillTries(skills[i].id, (newSkillLevel + 1))
			
			while skills[i].tries >= reqSkillTries do
			  skills[i].tries = skills[i].tries - reqSkillTries
			  newSkillLevel = newSkillLevel + 1;
			  reqSkillTries = player:getVocation():getRequiredSkillTries(skills[i].id, (newSkillLevel + 1))
			end
		end
		
		--print("NEW " .. player:getVocation():getName() .. " SKILL" .. " id:" .. skills[i].id .. " level:" .. newSkillLevel .. " leftTries:" .. skills[i].tries)
		
		-- Apply skill level and/or skill tries
		if newSkillLevel > 10 then
			player:setSkillLevel(skills[i].id, newSkillLevel, skills[i].tries)
		elseif skills[i].tries > 0 then
			player:addSkillTries(skills[i].id, skills[i].tries)
		end
    end
	
	-- Set player stats if is higher than level 8
	if player:getLevel() > 8 then
		dawnportSetStats(player)
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

-- Add items to player from trial items data
function dawnportAddItems(player, items)
	local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
	-- If dont have backpack, give one or will cause error and items will added on ground
	if not backpack then
		backpack = player:addItem(1988, 1, true, 1, CONST_SLOT_BACKPACK)
	end
	for slot, item in pairs(items) do
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
		if item.limit and item.storage then
			local given = math.max(player:getStorageValue(item.storage), 0)
			if given >= item.limit then
				giveItem = false
			else
				player:setStorageValue(item.storage, given + 1)
			end
		end
		if giveItem then
			if extra then
				player:addItemEx(Game.createItem(item[1], item[2]), INDEX_WHEREEVER, 0)
			else
				local ret = player:addItem(item[1], item[2], false, 1, slot)
				if not ret then
					player:addItemEx(Game.createItem(item[1], item[2]), false, slot)
				end
			end
		end
	end
end

-- Set player outfit from trial outfit data
function dawnportSetOutfit(player, outfit)
	player:setOutfit({
		lookTypeEx = 0,
		lookType = outfit.lookType[player:getSex()],
		lookHead = outfit.lookHead,
		lookBody = outfit.lookBody,
		lookLegs = outfit.lookLegs,
		lookFeet = outfit.lookFeet,
		lookAddons = 0,
		lookMount = 0
	})
end

-- Set player health/mana/capacity stats based on the vocation
function dawnportSetStats(player)
	-- Base stats
	local stats = {health = 150, mana = 55, capacity = 40000}
	local vocation = player:getVocation()
	
	-- NO VOCATION
	if vocation:getId() == VOCATION.ID.NONE then
		local level = player:getLevel() - 1
		
		stats.health = stats.health + (level * vocation:getHealthGain())
		stats.mana = stats.mana + (level * vocation:getManaGain())
		stats.capacity = stats.capacity + (level * vocation:getCapacityGain())
	-- MAIN VOCATIONS
	elseif isInArray({VOCATION.ID.SORCERER, VOCATION.ID.DRUID, VOCATION.ID.PALADIN, VOCATION.ID.KNIGHT}, vocation:getId()) and player:getLevel() > 8 then
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

-- Teleport to the dawnport temple after reaching level 20 (the player has five minutes before being teleported)
function teleportToDawnportTemple(uid)
	local player = Player(uid)
	-- If not have the Oressa storage, teleport player to the temple
	if player and player:getStorageValue(Storage.Dawnport.DoorVocation) == -1 then
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
end

-- Checks if the skill growth is limited for a dawnport player
function isSkillGrowthLimited(player, skillId)
	local town = player:getTown()
	-- Check that resides on dawnport
	if town and town:getId() == TOWNS_LIST.DAWNPORT then
		local vocationId = player:getVocation():getId()
		local skillsLimit = Dawnport.limit.skills[vocationId]
		
		-- Check if there is set a skillId limit
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
	},
	trial = {
		effects = {
			CONST_ME_TUTORIALARROW,
			CONST_ME_TUTORIALSQUARE
		},
		-- Sorcerer trial
		[25005] = {
			tutorialId = 5,
			effectPosition = {x = 32050, y = 31891, z = 5},
			storage = Storage.Dawnport.Sorcerer,
			message = "As a sorcerer, you can use the following spells: Magic Patch, Buzz, Scorch.",
			vocation = {
				id = VOCATION.ID.SORCERER,
				name = "sorcerer",
				outfit = {
					lookType = {
						[PLAYERSEX_FEMALE] = 138,
						[PLAYERSEX_MALE] = 130
					},
					lookHead = 95,
					lookBody = 109,
					lookLegs = 112,
					lookFeet = 128
				}
			},
			items = {
				[CONST_SLOT_LEFT] = {23719, 1}, -- the scorcher
				[CONST_SLOT_RIGHT] = {23771, 1}, -- spellbook of the novice
				[11] = {8704, 2, storage = Storage.Dawnport.SorcererHealthPotion, limit = 1}, -- potion
				[12] = {7620, 10, storage = Storage.Dawnport.SorcererManaPotion, limit = 1}, -- potion
				[13] = {23723, 2, storage = Storage.Dawnport.SorcererLightestMissile, limit = 1}, -- 2 lightest missile runes
				[14] = {23722, 2, storage = Storage.Dawnport.SorcererLightStoneShower, limit = 1}, -- 2 light stone shower runes
				[15] = {2666, 1, storage = Storage.Dawnport.SorcererMeat, limit = 1}, -- 1 meat
			}
		},
		-- Druid trial
		[25006] = {
			tutorialId = 6,
			effectPosition = {x = 32064, y = 31905, z = 5},
			storage = Storage.Dawnport.Druid,
			message = "As a druid, you can use these spells: Mud Attack, Chill Out, Magic Patch.",
			vocation = {
				id = VOCATION.ID.DRUID,
				name = "druid",
				outfit = {
					lookType = {
						[PLAYERSEX_FEMALE] = 138,
						[PLAYERSEX_MALE] = 130
					},
					lookHead = 95,
					lookBody = 123,
					lookLegs = 9,
					lookFeet = 118
				}
			},
			items = {
				[CONST_SLOT_LEFT] = {23721, 1}, -- the chiller
				[CONST_SLOT_RIGHT] = {23771, 1}, -- spellbook of the novice
				[11] = {8704, 2, storage = Storage.Dawnport.DruidHealthPotion, limit = 1}, -- potion
				[12] = {7620, 10, storage = Storage.Dawnport.DruidManaPotion, limit = 1}, -- potion
				[13] = {23723, 2, storage = Storage.Dawnport.DruidLightestMissile, limit = 1}, -- 2 lightest missile runes
				[14] = {23722, 2, storage = Storage.Dawnport.DruidLightStoneShower, limit = 1}, -- 2 light stone shower runes
				[15] = {2666, 1, storage = Storage.Dawnport.DruidMeat, limit = 1}, -- 1 meat
			}
		},
		-- Paladin trial
		[25007] = {
			tutorialId = 4,
			effectPosition = {x = 32078, y = 31891, z = 5},
			storage = Storage.Dawnport.Paladin,
			message = "As a paladin, you can use the following spells: Magic Patch, Arrow Call.",
			vocation = {
				id = VOCATION.ID.PALADIN,
				name = "paladin",
				outfit = {
					lookType = {
						[PLAYERSEX_FEMALE] = 137,
						[PLAYERSEX_MALE] = 129
					},
					lookHead = 95,
					lookBody = 117,
					lookLegs = 98,
					lookFeet = 78
				}
			},
			items = {
				[CONST_SLOT_LEFT] = {2456, 1}, -- bow
				[CONST_SLOT_AMMO] = {23839, 100}, -- 100 arrows
				[11] = {8704, 7, storage = Storage.Dawnport.PaladinHealthPotion, limit = 1}, -- potion
				[12] = {7620, 5, storage = Storage.Dawnport.PaladinManaPotion, limit = 1}, -- potion
				[13] = {23723, 1, storage = Storage.Dawnport.PaladinLightestMissile, limit = 1}, -- 1 lightest missile rune
				[14] = {23722, 1, storage = Storage.Dawnport.PaladinLightStoneShower, limit = 1}, -- 1 light stone shower rune
				[15] = {2666, 1, storage = Storage.Dawnport.PaladinMeat, limit = 1}, -- 1 meat
			}
		},
		-- Knight trial
		[25008] = {
			tutorialId = 3,
			effectPosition = {x = 32064, y = 31876, z = 5},
			storage = Storage.Dawnport.Knight,
			message = "As a knight, you can use the following spells: Bruise Bane.",
			vocation = {
				id = VOCATION.ID.KNIGHT,
				name = "knight",
				outfit = {
					lookType = {
						[PLAYERSEX_FEMALE] = 139,
						[PLAYERSEX_MALE] = 131
					},
					lookHead = 95,
					lookBody = 38,
					lookLegs = 94,
					lookFeet = 115
				}
			},
			items = {
				[CONST_SLOT_LEFT] = {2379, 1}, -- dagger
				[CONST_SLOT_RIGHT] = {2512, 1}, -- wooden shield
				[11] = {8704, 10, storage = Storage.Dawnport.KnightHealthPotion, limit = 1}, -- potion
				[12] = {7620, 2, storage = Storage.Dawnport.KnightManaPotion, limit = 1}, -- potion
				[13] = {2666, 1, storage = Storage.Dawnport.KnightMeat, limit = 1} -- 1 meat
			}
		}
	}
}
