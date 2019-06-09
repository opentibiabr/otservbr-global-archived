local function bossTransformBack(creatureid, itemid)
	local creature = Creature(creatureid)
	if not creature then
		return false
	end
	local vidaAtual = creature:getHealth()
	local position = creature:getPosition()
	if Tile(position):getItemCountById(itemid) > 0 then
		addEvent(bossTransformBack, 4*1000, creature:getId(), itemid)
		return false
	end
	local bossTransformBack = Game.createMonster("The Sinister Hermit SUJO", position, true, true)
	if bossTransformBack then
		bossTransformBack:registerEvent("spawnBoss")
		creature:remove()
		local subtrair = bossTransformBack:getHealth() - vidaAtual
		bossTransformBack:addHealth(-subtrair)
	end
return true
end

function onStepIn(creature, item, position, fromPosition)
if not creature:isMonster() then
	return true
end

local monstro1 = "The Sinister Hermit"
local monstro2 = "The Souldespoiler"
	if creature:getType():getName():lower() == monstro1:lower() and creature:getOutfit().lookBody == 63 then
		local vidaAtual = creature:getHealth()
		local position = creature:getPosition()
		local bossTransform = Game.createMonster("The Sinister Hermit LIMPO", position, true, true)
		if bossTransform then
			creature:remove()
			item:remove()
			local subtrair = bossTransform:getHealth() - vidaAtual
			bossTransform:addHealth(-subtrair)
			bossTransform:registerEvent("spawnBoss")
			addEvent(bossTransformBack, 4*1000, bossTransform:getId(), item:getId())
			return false
		end
	end
	return true
end
