local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)

local maxsummons = 4

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 4 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Deathslicer", creature:getPosition())
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end

spell:name("ghazbaran summon")
spell:words("###142")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()