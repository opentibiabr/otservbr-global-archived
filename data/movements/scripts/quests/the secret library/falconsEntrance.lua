local destination = {
	[64007] = {newPos = Position(33345, 31347, 7)},
	[64008] = {newPos = Position(33357, 31308, 4)},
	[64009] = {newPos = Position(33382, 31292, 7)}
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
