local config = {
	[50389] = Position(33651, 31942, 7),
	[50390] = Position(32172, 32439, 8),
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = config[item.actionid]
	if teleport then
		player:teleportTo(teleport)
		fromPosition:sendMagicEffect(CONST_ME_STONES)
		teleport:sendMagicEffect(CONST_ME_STONES)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end

	return true
end