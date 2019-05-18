local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_INVISIBLE)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)

local condition2 = Condition(CONDITION_OUTFIT)
condition2:setTicks(-1)
condition2:setOutfit({lookTypeEx = 1548})

function onCastSpell(creature, var)
local hp, cpos = (creature:getHealth()/creature:getMaxHealth())*100, creature:getPosition()

	if getCreatureName(cid) == "Zavarash" and (hp < 100) then
		creature:addCondition(condition)
		creature:addCondition(condition2)
		creature:setHiddenHealth(creature)
	end
	local t = Tile(cpos)
	if t == nil then 
		return 
	end
	if t:getItemById(1490) or t:getItemById(1496) or t:getItemById(1503) then
		creature:setOutfit({lookType=12,lookHead=0,lookAddons=0,lookLegs=57,lookBody=15,lookFeet=85}, -1)
		creature:removeCondition(CONDITION_INVISIBLE)
		creature:removeCondition(CONDITION_OUTFIT)
		creature:setHiddenHealth(false)
		return false
	end
	return combat:execute(creature, var)
end