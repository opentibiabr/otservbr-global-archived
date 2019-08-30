local config = {
	[57602] = Position(33329, 31333, 9),
	[57699] = Position(33308, 31325, 8),
	[57604] = Position(33359, 31339, 9),
	[3255] = Position(3347, 31345, 8)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local teleport = config[item.actionid]
	if teleport then
		player:teleportTo(teleport)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		teleport:sendMagicEffect(CONST_ME_TELEPORT)
	end
end