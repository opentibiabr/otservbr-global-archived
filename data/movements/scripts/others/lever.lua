function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
local config = {
	leverPositions = {
		Position(32645, 32465, 9),
		Position(32647, 32483, 9),
		Position(32619, 32523, 9),
		Position(32610, 32523, 9),
		Position(32583, 32482, 9),
		Position(32584, 32465, 9)
	},
	leverId = 1946 
}
    if item.uid == 6001 then
	local player = creature:getPlayer()
	if not player then
		return true
	end
	for i = 1, #config.leverPositions do
		local leverItem = Tile(config.leverPositions[i]):getItemById(config.leverId)
		if not leverItem then
			player:teleportTo({x = 32615, y = 32482, z = 9})
			position:sendMagicEffect(CONST_ME_TELEPORT)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "There are 6 levers to use to open the teleporter..")
			return true
		end
	end

	player:teleportTo({x = 32615, y = 32482, z = 10})
	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
end
