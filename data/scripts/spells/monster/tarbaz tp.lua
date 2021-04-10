local function teleport(fromPosition, toPosition)
	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			for z = fromPosition.z, toPosition.z do
				local creature = Tile(Position(x, y, z)):getTopCreature()
				if creature then
					if creature:isPlayer() then
						creature:teleportTo(Position(33454, 32872, 12))
					end
				end
			end
		end
	end
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	teleport(Position(33449, 32834, 11), Position(33470, 32854, 11))
	return true
end

spell:name("tarbaz teleport")
spell:words("###157")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()
