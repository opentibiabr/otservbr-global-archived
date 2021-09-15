local config = {
	{position = Position(32873, 32263, 14), itemId = 1946, transformId = 2772},
	{position = Position(32874, 32263, 14), itemId = 3733, transformId = 2094},
	{position = Position(32875, 32263, 14), itemId = 3734, transformId = 2095},
	{position = Position(32874, 32264, 14), itemId = 3735, transformId = 2096},
	{position = Position(32875, 32264, 14), itemId = 3736, transformId = 2097}
}

local sacrifices = {
	{position = Position(32878, 32270, 14), itemId = 2016},
	{position = Position(32881, 32267, 14), itemId = 2168},
	{position = Position(32881, 32273, 14), itemId = 6300},
	{position = Position(32884, 32270, 14), itemId = 1487}
}

local stoneTeleport = MoveEvent()

function stoneTeleport.onAddItem(moveitem, tileitem, position)
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
	local stoneItem = Tile(stonePosition):getItemById(1842)
	if stoneItem then
		stoneItem:remove()
	end

	local teleportExists = Tile(stonePosition):getItemById(1949)
	if not teleportExists then
		local newItem = Game.createItem(1949, 1, stonePosition)
		if newItem then
			newItem:setActionId(9031)
			stonePosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end

stoneTeleport:type("additem")
stoneTeleport:aid(8034)
stoneTeleport:register()

stoneTeleport = MoveEvent()

function stoneTeleport.onStepIn(creature, item, position, fromPosition)
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
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		item:transform(1842)
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
	item:transform(1842)

	local thing
	for i = 1, #config do
		thing = Tile(config[i].position):getItemById(config[i].itemId)
		if thing then
			thing:transform(config[i].transformId)
		end
	end
	return true
end

stoneTeleport:type("stepin")
stoneTeleport:aid(9031)
stoneTeleport:register()
