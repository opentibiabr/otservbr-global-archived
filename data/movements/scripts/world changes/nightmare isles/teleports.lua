local config = {
	{storageKey11 = 210001, teleportPosition = Position(33032, 32400, 7)}, -- entrance teleport Darashia Northwest
	{storageKey11 = 210002, teleportPosition = Position(33215, 32273, 7)}, -- entrance teleport Darashia North
	{storageKey11 = 210016, teleportPosition = Position(33255, 32678, 7)} -- {x = 33255, y = 32678, z = 7}
}

local portals = {
	[64001] = {210001}, -- northwest Darashia
	[64002] = {210002}, -- north Darashia
	[64003] = {210016}  -- north Ankrahmun
}

local pos = Position(33497, 32616, 8) -- Entrance

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	for i = 1, #config do
		local table = config[i]
		if player:getStorageValue(table.storageKey11) >= 1 then
			player:teleportTo(table.teleportPosition)
			table.teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(table.storageKey11, 0)
			return true
		end
	end

	player:teleportTo(player:getTown():getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	if not player then
		return true
	end

	local storage = portals[item.uid]
	if not storage then
		return true
	end

	player:teleportTo(pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(storage[1], 1)
	return true
end
