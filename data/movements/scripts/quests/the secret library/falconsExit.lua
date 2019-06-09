local destination = {
	[64010] = {newPos = Position(33327, 31351, 7)},
	[64011] = {newPos = Position(33201, 31765, 1)},
	[64012] = {newPos = Position(33327, 31351, 7)}
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
