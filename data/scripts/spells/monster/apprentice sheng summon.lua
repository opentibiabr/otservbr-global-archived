local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)

	local creatures = {"Hyaena"}
	local monster = creatures[math.random(#creatures)]

	if apShengSummon < 2 then
		Game.createMonster(monster, {x=creature:getPosition().x+math.random(-1, 1), y=creature:getPosition().y+math.random(-1, 1), z=creature:getPosition().z}, false, true)
		apShengSummon = apShengSummon + 1
	end

	return combat:execute(creature, var)
end

spell:name("apprentice sheng summon")
spell:words("###127")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:register()
