local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

combat:setArea(createCombatArea({
{0, 1, 1, 1, 0},
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
{0, 1, 1, 1, 0},
}))

function spellCallback(param)
	local tile = Tile(Position(param.pos))
	if tile then
		if tile:getTopCreature() and tile:getTopCreature():isMonster() then
			if tile:getTopCreature():getName():lower() == "the duke of the depths" or tile:getTopCreature():getName():lower() == "the duke of the depths immortal" then
				tile:getTopCreature():addHealth(math.random(0, 2000))
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

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
