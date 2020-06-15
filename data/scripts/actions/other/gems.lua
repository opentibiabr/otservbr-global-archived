local lionsRockSanctuaryPos = Position(33073, 32300, 9)
local lionsRockSanctuaryRockId = 3608
local lionsRockSanctuaryFountainId = 6390

local shrine = {
	[2146] = {
		targetAction = 15001,
		-- shrinePosition = {x = 32194, y = 31418, z = 2},
		destination = {x = 33430, y = 32278, z = 7}
	},
	[2147] = {
		targetAction = 15002,
		-- shrinePosition = {x = 32910, y = 32338, z = 15},
		destination = {x = 33586, y = 32263, z = 7}
	},
	[2149] = {
		targetAction = 15003,
		-- shrinePosition = {x = 32973, y = 32225, z = 7},
		destination = {x = 33539, y = 32263, z = 7}
	},
	[2150] = {
		targetAction = 15004,
		-- shrinePosition = {x = 33060, y = 32713, z = 5},
		destination = {x = 33527, y = 32301, z = 4}
	}
}

local UniqueTable = {
	[25006] = {
		storage = Storage.LionsRock.Questline,
		value = 9,
		item = 2147,
		fieldId = 1492,
		message = "You place the ruby on the small socket. A red flame begins to burn.",
		effect = CONST_ME_MAGIC_RED
	},
	[25007] = {
		itemId = 23813,
		itemPos = {x = 33069, y = 32302, z = 9},
		storage = Storage.LionsRock.Questline,
		value = 9,
		item = 2146,
		fieldId = 24618,
		message = "You place the sapphire on the small socket. A blue flame begins to burn.",
		effect = CONST_ME_MAGIC_BLUE
	},
	[25008] = {
		itemId = 23811,
		itemPos = {x = 33077, y = 32302, z = 9},
		storage = Storage.LionsRock.Questline,
		value = 9,
		item = 2150,
		fieldId = 7465,
		message = "You place the amethyst on the small socket. A violet flame begins to burn.",
		effect = CONST_ME_PURPLESMOKE
	},
	[25009] = {
		itemId = 23808,
		itemPos = {x = 33077, y = 32298, z = 9},
		storage = Storage.LionsRock.Questline,
		value = 9,
		item = 9970,
		fieldId = 1500,
		message = "You place the topaz on the small socket. A yellow flame begins to burn.",
		effect = CONST_ME_BLOCKHIT
	}
}

local gems = Action()

function gems.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Gems teleport to feyrist
	for index, value in pairs(shrine) do
		if item.itemid == index then
			if toPosition == value.targetAction then
				player:removeItem(index, 1)
				player:teleportTo(value.destination)
				player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
				return true
			end
			if player:getItemCount(2147) >= 1 and target.itemid == 2342 then
				target:transform(2343)
				target:decay()
				item:remove(1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				return true
			end
		end
	end

	-- Use gems in the tile of lions rock quest
	local setting = UniqueTable[target.uid]
	if not setting then
		return true
	end

	-- Reset lion's fields
	local function lionsRockFieldReset()
		local gemSpot = Tile(setting.itemPos):getItemById(setting.fieldId)
		if gemSpot then
			Game.setStorageValue(GlobalStorage.LionsRockFields, Game.getStorageValue(GlobalStorage.LionsRockFields) - 1)
			gemSpot:remove()
		end
	end

	-- Check if all lion's fields are set
	local function checkLionsRockFields(storage)
		if Game.getStorageValue(GlobalStorage.LionsRockFields) == 3 then
			local stone = Tile(lionsRockSanctuaryPos):getItemById(lionsRockSanctuaryRockId)
			if stone then
				stone:transform(lionsRockSanctuaryFountainId)
				lionsRockSanctuaryPos:sendMagicEffect(CONST_ME_THUNDER)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Something happens at the center of the room ...')
				player:setStorageValue(storage, 10)
			end
		end
	end

	-- Delay to create lion's field
	local function lionsRockCreateField(itemPos, fieldId, storage)
		local gemSpot = Tile(itemPos):getItemById(fieldId)
		if not gemSpot then
			Game.createItem(fieldId, 1, itemPos)
			Game.setStorageValue(GlobalStorage.LionsRockFields, Game.getStorageValue(GlobalStorage.LionsRockFields) + 1)
			checkLionsRockFields(storage)
		end
	end

	if player:getStorageValue(setting.storage) >= setting.value then
		if setting.item == item.itemid then
			local gemSpot = Tile(setting.itemPos):getItemById(setting.fieldId)
			if not gemSpot then
				toPosition:sendMagicEffect(setting.effect)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, setting.message)
				item:remove()
				addEvent(lionsRockCreateField, 2 * 1000, setting.itemPos, setting.fieldId, setting.storage)
				addEvent(lionsRockFieldReset, 60 * 1000)
			end
		end
	end
	return true
end

for index, value in pairs(shrine) do
	gems:id(index)
end

gems:id(9970)
gems:register()
