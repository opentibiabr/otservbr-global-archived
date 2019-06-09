function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	doTargetCombatHealth(0, player, COMBAT_FIREDAMAGE, -1000, -1000, CONST_ME_HITBYFIRE)
	return true
end
