local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

local maxsummons = 2

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 2 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Zombie", creature:getPosition())
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end

spell:name("doctor perhaps summon")
spell:words("###270")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()