local destination = {
	[64001] = {newPos = Position(34022, 32037,14)},
	[64002] = {newPos = Position(33982, 32235, 14)},
	[64003] = {newPos = Position(33921, 32401, 14)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = destination[item.actionid]
	if not teleport then
		return
	end
		player:teleportTo(teleport.newPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
end

