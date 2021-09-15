local fires = {
	[2910] = {vocationId = VOCATION.BASE_ID.SORCERER, damage = 300},
	[2911] = {vocationId = VOCATION.BASE_ID.SORCERER, damage = 600},
	[2912] = {vocationId = VOCATION.BASE_ID.SORCERER, damage = 1200},
	[2913] = {vocationId = VOCATION.BASE_ID.SORCERER, damage = 2400},
	[2914] = {vocationId = VOCATION.BASE_ID.SORCERER, damage = 3600},
	[2915] = {vocationId = VOCATION.BASE_ID.SORCERER, damage = 7200},
	[2916] = {vocationId = VOCATION.BASE_ID.DRUID, damage = 300},
	[2917] = {vocationId = VOCATION.BASE_ID.DRUID, damage = 600},
	[2918] = {vocationId = VOCATION.BASE_ID.DRUID, damage = 1200},
	[2919] = {vocationId = VOCATION.BASE_ID.DRUID, damage = 2400},
	[2920] = {vocationId = VOCATION.BASE_ID.DRUID, damage = 3600},
	[2921] = {vocationId = VOCATION.BASE_ID.DRUID, damage = 7200},
	[2922] = {vocationId = VOCATION.BASE_ID.PALADIN, damage = 300},
	[2923] = {vocationId = VOCATION.BASE_ID.PALADIN, damage = 600},
	[2924] = {vocationId = VOCATION.BASE_ID.PALADIN, damage = 1200},
	[2925] = {vocationId = VOCATION.BASE_ID.PALADIN, damage = 2400},
	[2926] = {vocationId = VOCATION.BASE_ID.PALADIN, damage = 3600},
	[2927] = {vocationId = VOCATION.BASE_ID.PALADIN, damage = 7200},
	[2928] = {vocationId = VOCATION.BASE_ID.KNIGHT, damage = 300},
	[2929] = {vocationId = VOCATION.BASE_ID.KNIGHT, damage = 600},
	[2930] = {vocationId = VOCATION.BASE_ID.KNIGHT, damage = 1200},
	[2931] = {vocationId = VOCATION.BASE_ID.KNIGHT, damage = 2400},
	[2932] = {vocationId = VOCATION.BASE_ID.KNIGHT, damage = 3600},
	[2933] = {vocationId = VOCATION.BASE_ID.KNIGHT, damage = 7200}
}

local fireTile = MoveEvent()

function fireTile.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local fire = fires[item.actionid]
	if not fire then
		return true
	end

	if player:getVocation():getBaseId() == fire.vocationId then
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

fireTile:type("stepin")

for index, value in pairs(fires) do
	fireTile:aid(index)
end

fireTile:register()
