local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onCastSpell(creature, var)
        creature:say("THE POWER OF HIS INTERNAL FIRE RENEWS OMRAFIR!", TALKTYPE_ORANGE_2)
	return combat:execute(creature, var)
end
