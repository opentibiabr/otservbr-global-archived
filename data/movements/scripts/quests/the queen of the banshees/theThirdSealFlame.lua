local config = {
	[0] = 50015,
	[1] = 50016,
	[2] = 50017,
	[3] = 50018,
	[4] = 50019,

	basinPositions = {
		Position(32214, 31850, 15),
		Position(32215, 31850, 15),
		Position(32216, 31850, 15)
	},

	switchPositions = {
		Position(32220, 31846, 15),
		Position(32220, 31845, 15),
		Position(32220, 31844, 15),
		Position(32220, 31843, 15),
		Position(32220, 31842, 15)
	},

	destination = Position(32271, 31857, 15)
}

local function resetItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.ThirdSeal) >= 1 or Game.getStorageValue('switchNum') ~= 5 then
		player:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:setStorageValue(Storage.QueenOfBansheesQuest.ThirdSeal, 1)
	Game.setStorageValue('switchNum', 0)
	player:teleportTo(config.destination)
	config.destination:sendMagicEffect(CONST_ME_TELEPORT)

	for i = 1, #config.basinPositions do
		resetItem(config.basinPositions[i], 1484, 1485)
	end

	for i = 1, #config.switchPositions do
		resetItem(config.switchPositions[i], 1945, 1946)
	end
	return true
end