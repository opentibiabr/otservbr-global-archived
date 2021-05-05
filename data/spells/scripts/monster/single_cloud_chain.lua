local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STORM)

function onCastSpell(creature, var)
	local target = Creature(var.number)
	if not target then return false end
	local creaturePos = creature:getPosition()
	local path = creaturePos:getPathTo(target:getPosition(), 0, 0, true, true, 8)
	if not path or #path == 0 then return false end
	for i=1, #path do
		creaturePos:getNextPosition(path[i], 1)
		creaturePos:sendMagicEffect(CONST_ME_STORM)
	end
	return combat:execute(creature, var)
end