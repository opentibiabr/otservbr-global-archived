local fires = {
	[2040] = {vocationId = 1, damage = 300},
	[2041] = {vocationId = 1, damage = 600},
	[2042] = {vocationId = 1, damage = 1200},
	[2043] = {vocationId = 1, damage = 2400},
	[2044] = {vocationId = 1, damage = 3600},
	[2045] = {vocationId = 1, damage = 7200},

	[2046] = {vocationId = 2, damage = 300},
	[2047] = {vocationId = 2, damage = 600},
	[2048] = {vocationId = 2, damage = 1200},
	[2049] = {vocationId = 2, damage = 2400},
	[2050] = {vocationId = 2, damage = 3600},
	[2051] = {vocationId = 2, damage = 7200},

	[2052] = {vocationId = 3, damage = 300},
	[2053] = {vocationId = 3, damage = 600},
	[2054] = {vocationId = 3, damage = 1200},
	[2055] = {vocationId = 3, damage = 2400},
	[2056] = {vocationId = 3, damage = 3600},
	[2057] = {vocationId = 3, damage = 7200},

	[2058] = {vocationId = 4, damage = 300},
	[2059] = {vocationId = 4, damage = 600},
	[2060] = {vocationId = 4, damage = 1200},
	[2061] = {vocationId = 4, damage = 2400},
	[2062] = {vocationId = 4, damage = 3600},
	[2063] = {vocationId = 4, damage = 7200}
}



function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local fire = fires[item.actionid]
	if not fire then
		return true
	end

	if player:getVocation():getBase():getId() == fire.vocationId then
		doTargetCombatHealth(0, player, COMBAT_FIREDAMAGE, -300, -300, CONST_ME_HITBYFIRE)
	else
		local combatType = COMBAT_FIREDAMAGE
		if fire.damage > 300 then
			combatType = COMBAT_PHYSICALDAMAGE
		end
		doTargetCombatHealth(0, player, combatType, -fire.damage, -fire.damage, CONST_ME_FIREATTACK)
	end
	return true
end
