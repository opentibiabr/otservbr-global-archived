local setting = {
	[50389] = {effectTeleport = CONST_ME_GREEN_RINGS, newPosition = Position(33651, 31942, 7)},
	[50390] = {effectTeleport = CONST_ME_STONES, newPosition = Position(32172, 32439, 8)},
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = setting[item.actionid]
	if teleport then
		local newPosition = teleport.newPosition
		player:teleportTo(newPosition)

		fromPosition:sendMagicEffect(teleport.effectTeleport)
		newPosition:sendMagicEffect(teleport.effectTeleport)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end
	return true
end