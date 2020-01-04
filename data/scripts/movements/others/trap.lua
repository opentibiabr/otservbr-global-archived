local moveevent = MoveEvent()

local traps = {
	[2145] = {transformTo = 2146, damage = {-50, -100}},
	[2147] = {transformTo = 2148, damage = {-50, -100}},
	[3481] = {transformTo = 3482, damage = {-15, -30}},
	[3944] = {transformTo = 3945, damage = {-15, -30}, type = COMBAT_EARTHDAMAGE}
}

function moveevent.onStepIn(creature, item, position, fromPosition)
	local trap = traps[item.itemid]
	if not trap then
		return true
	end

	if creature:isMonster() or creature:isPlayer() then
		doTargetCombatHealth(0, creature, trap.type or COMBAT_PHYSICALDAMAGE, trap.damage[1], trap.damage[2], CONST_ME_NONE)
	end

	if trap.transformTo then
		item:transform(trap.transformTo)
	end
	return true
end

moveevent:id(2145,2147,3481,3944)
moveevent:register()

local moveevent = MoveEvent()

function moveevent.onStepOut(creature, item, position, fromPosition)
	item:transform(item.itemid - 1)
	return true
end

moveevent:id(2146,2148,3482,3945)
moveevent:register()
