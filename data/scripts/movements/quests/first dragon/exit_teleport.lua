local exitTeleport = MoveEvent()

function exitTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end
	player:teleportTo(setting.backPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

for value = 24886, 24889 do
	exitTeleport:uid(value)
end
exitTeleport:register()