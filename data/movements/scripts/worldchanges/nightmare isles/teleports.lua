local config = {
	{storageKey = 210001, teleportPosition = Position(33032, 32400, 7)}, -- entrance teleport Darashia Northwest
	{storageKey = 210002, teleportPosition = Position(33215, 32273, 7)}, -- entrance teleport Darashia North
	{storageKey = 210016, teleportPosition = Position(33255, 32678, 7)} -- {x = 33255, y = 32678, z = 7}
}

local portals = {
	[64001] = 210001, -- northwest Darashia
	[64002] = 210002, -- north Darashia
	[64003] = 210016  -- north Ankrahmun
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	for i = 1, #config do
		local table = config[i]
		local backStorage = table.storageKey

		if player:getStorageValue(backStorage) >= 1 then
			player:teleportTo(table.teleportPosition)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(backStorage, 0)
			break
		end
	end

	local storagePortal = portals[item.uid]
	if storagePortal then
		local entracePosition = Position(33497, 32616, 8)
		player:teleportTo(entracePosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(storagePortal, 1)
	end

	return true
end