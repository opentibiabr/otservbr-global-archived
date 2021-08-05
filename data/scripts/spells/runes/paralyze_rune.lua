local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_UNDEFINEDDAMAGE)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setFormula(-1, 45, -1, 45)
combat:addCondition(condition)

local rune = Spell("rune")

function rune.onCastSpell(creature, var)
	if not combat:execute(creature, var) then
		return false
	end

	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end

rune:group("support")
rune:id(54)
rune:name("Paralyze")
rune:runeId(2278)
rune:allowFarUse(true)
rune:charges(1)
rune:setPzLocked(true)
rune:level(54)
rune:magicLevel(18)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:mana(1400)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:vocation("druid;true", "elder druid;true")
rune:register()
