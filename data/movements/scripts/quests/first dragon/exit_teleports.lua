local config = {
	[24885] = {backPos = Position(33234, 32278, 12)},
	[24886] = {backPos = Position(33162, 31320, 5)},
	[24887] = {backPos = Position(33002, 31595, 11)},
	[24888] = {backPos = Position(32278, 31367, 4)},
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = config[item.uid]
	if not teleport then
		return true
	end
	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(teleport.backPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
