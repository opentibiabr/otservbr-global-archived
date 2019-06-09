local config = {
	{storageKey = 10130, teleportPosition = Position(33264, 31835, 10)}, --EK
	{storageKey = 10131, teleportPosition = Position(33272, 31835, 10)}, --RP
	{storageKey = 10132, teleportPosition = Position(33268, 31840, 10)}, --ED
	{storageKey = 10133, teleportPosition = Position(33268, 31831, 10)} -- SORC
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	for i = 1, #config do
		local table = config[i]
		if player:getStorageValue(table.storageKey) >= 1 then
			player:teleportTo(table.teleportPosition)
			table.teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(table.storageKey, 0)
			return true
		end
	end

	player:teleportTo(player:getTown():getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
