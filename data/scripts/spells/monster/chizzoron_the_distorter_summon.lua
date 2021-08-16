local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

local maxsummons = 2

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 2 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Lizard Dragon Priest2", creature:getPosition())
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end

spell:name("chizzoron the distorter summon")
spell:words("###136")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()