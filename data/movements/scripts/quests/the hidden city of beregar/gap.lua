function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(Position(32569, 31507, 9))
	player:say('Use the wagon to pass the gap.', TALKTYPE_MONSTER_SAY)
	return true
end
