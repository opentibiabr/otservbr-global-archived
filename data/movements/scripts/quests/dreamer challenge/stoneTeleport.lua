local config = {
	{position = Position(32873, 32263, 14), itemId = 1946, transformId = 1945},
	{position = Position(32874, 32263, 14), itemId = 3733, transformId = 3729},
	{position = Position(32875, 32263, 14), itemId = 3734, transformId = 3730},
	{position = Position(32874, 32264, 14), itemId = 3735, transformId = 3731},
	{position = Position(32875, 32264, 14), itemId = 3736, transformId = 3732}
}

local sacrifices = {
	{position = Position(32878, 32270, 14), itemId = 2016},
	{position = Position(32881, 32267, 14), itemId = 2168},
	{position = Position(32881, 32273, 14), itemId = 6300},
	{position = Position(32884, 32270, 14), itemId = 1487}
}

function onAddItem(moveitem, tileitem, position)
	local sacrificeItems, sacrificeItem = true
	for i = 1, #sacrifices do
		sacrificeItem = Tile(sacrifices[i].position):getItemById(sacrifices[i].itemId)
		if not sacrificeItem then
			sacrificeItems = false
			break
		end
	end

	if not sacrificeItems then
		return true
	end

	local stonePosition = Position(32881, 32270, 14)
	local stoneItem = Tile(stonePosition):getItemById(1355)
	if stoneItem then
		stoneItem:remove()
	end

	local teleportExists = Tile(stonePosition):getItemById(1387)
	if not teleportExists then
		local newItem = Game.createItem(1387, 1, stonePosition)
		if newItem then
			newItem:setActionId(9031)
			stonePosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local sacrificeItems, sacrificeItem = true
	for i = 1, #sacrifices do
		sacrificeItem = Tile(sacrifices[i].position):getItemById(sacrifices[i].itemId)
		if not sacrificeItem then
			sacrificeItems = false
			break
		end
	end

	if not sacrificeItems then
		--player:teleportTo(fromPosition)
		--fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(Position(32920, 32296, 13))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	item:transform(1355)
		return true
	end

	for i = 1, #sacrifices do
		sacrificeItem = Tile(sacrifices[i].position):getItemById(sacrifices[i].itemId)
		if sacrificeItem then
			sacrificeItem:remove()
		end
	end

	player:teleportTo(Position(32920, 32296, 13))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	item:transform(1355)

	local thing
	for i = 1, #config do
		thing = Tile(config[i].position):getItemById(config[i].itemId)
		if thing then
			thing:transform(config[i].transformId)
		end
	end
	return true
end
