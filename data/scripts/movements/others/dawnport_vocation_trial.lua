local tutorialEffects = {
	CONST_ME_TUTORIALARROW,
	CONST_ME_TUTORIALSQUARE
}

local vocationTrials = {
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
			-- TODO: Quiver
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

-- First items, added only in first step and having no vocation
local function addFirstItems(player)
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
local function tileStep(player, trial)
	-- First Step
	local vocationId = player:getVocation():getId()
	if vocationId == VOCATION.ID.NONE then
		for i = 1, #tutorialEffects do
			Position(trial.effectPosition):sendMagicEffect(tutorialEffects[i])
		end
		player:sendTutorial(trial.tutorialId)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"As this is the first time you try out a vocation, the Guild has kitted you out. " .. trial.message)
		addFirstItems(player)
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

-- Remove vocation trial equipment items
local function removeItems(player)
	local equipmentItemIds = {
		23719,	-- The scorcher
		23721,	-- The chiller
		23771,	-- Spellbook of the novice
		2456,	-- Bow
		2379,	-- Dagger
		2512	-- Wooden shield
		-- TODO: Quiver
	}

	for i = 1, #equipmentItemIds do
		local equipmentItemAmount = player:getItemCount(equipmentItemIds[i])
		if equipmentItemAmount > 0 then
			player:removeItem(equipmentItemIds[i], equipmentItemAmount)
		end
	end
end

-- Add items to player from trial items data
local function addItems(player, items)
	local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
	for slot, item in pairs(items) do
		local extra
		if slot > CONST_SLOT_AMMO then
			extra = true
		else
			local equipped = player:getSlotItem(slot)
			if equipped and backpack then
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
local function setOutfit(player, outfit)
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


-- Dawnport trial tiles step event
local dawnportVocationTrial = MoveEvent()

function dawnportVocationTrial.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local trial = vocationTrials[item.actionid]
	if trial then
		-- Center room position
		local centerPosition = Position(32065, 31891, 5)
		if centerPosition:getDistance(fromPosition) < centerPosition:getDistance(position) then
			-- Blocks the vocation trial if same vocation or after level 20
			if player:getVocation():getId() == trial.vocation.id or player:getLevel() >= 20 then
				return true
			end
			-- On step in the tile
			tileStep(player, trial)
			-- Change to new vocation, convert magic level and skills and set proper stats
			player:changeVocation(trial.vocation.id)
			-- Remove vocation trial equipment items
			removeItems(player)
			-- Add player item
			addItems(player, trial.items)
			-- Change outfit
			setOutfit(player, trial.vocation.outfit)
			player:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
			return true
		end
	end
	return true
end

for index, value in pairs(vocationTrials) do
	dawnportVocationTrial:aid(index)
end

dawnportVocationTrial:register()
