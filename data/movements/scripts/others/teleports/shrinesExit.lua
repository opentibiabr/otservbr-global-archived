local config = {
	{storageKey = 10017, teleportPosition = Position(32360, 31781, 9)},
	{storageKey = 10018, teleportPosition = Position(32369, 32242, 6)},
	{storageKey = 10019, teleportPosition = Position(32958, 32077, 5)},
	{storageKey = 10020, teleportPosition = Position(32681, 31686, 2)},
	{storageKey = 10021, teleportPosition = Position(32646, 31925, 11)},
	{storageKey = 10022, teleportPosition = Position(33230, 32392, 5)},
	{storageKey = 10023, teleportPosition = Position(33130, 32815, 4)},
	{storageKey = 10024, teleportPosition = Position(33266, 31835, 9)},
	{storageKey = 10025, teleportPosition = Position(32337, 32837, 8)},
	{storageKey = 10026, teleportPosition = Position(32628, 32743, 4)},
	{storageKey = 10027, teleportPosition = Position(32213, 31132, 8)},
	{storageKey = 10028, teleportPosition = Position(32786, 31245, 5)},
	{storageKey = 10029, teleportPosition = Position(33594, 31899, 4)}
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
