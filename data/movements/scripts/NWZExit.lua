local destination = {
	[64004] = {newPos = Position(33831, 32139,14)},
	[64005] = {newPos = Position(33829, 32186, 14)},
	[64006] = {newPos = Position(33782, 32205, 14)}
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

