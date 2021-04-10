local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)

combat:setArea(createCombatArea({
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}))

function spellCallback(param)
	local tile = Tile(Position(param.pos))
	if tile then
		if tile:getTopCreature() and tile:getTopCreature():isMonster() then
			if tile:getTopCreature():getName():lower() == "the count of the core" then
				tile:getTopCreature():addHealth(math.random(0, 1500))
			end
		end
	end
end

function onTargetTile(cid, pos)
	local param = {}
	param.cid = cid
	param.pos = pos
	param.count = 0
	spellCallback(param)
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end
<instant name="" words=""  selftarget="1" exhaustion="2000" needlearn="1"  script="monster/emberBeastArea.lua" />


spell:name("emberBeastArea")
spell:words("###462")
spell:selfTarget(true)
spell:exhaustion(2000)
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:register()