local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

local maxsummons = 8

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 8 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Slime Summon", { x=creature:getPosition().x+math.random(-2, 2), y=creature:getPosition().y+math.random(-2, 2), z=creature:getPosition().z })
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end

spell:name("thalas summon")
spell:words("###287")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()