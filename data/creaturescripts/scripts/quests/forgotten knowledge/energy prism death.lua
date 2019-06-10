local cosmic = {'cosmic energy prism a', 'cosmic energy prism b', 'cosmic energy prism c', 'cosmic energy prism d'}
function onKill(creature, target)
	local targetMonster = target:getMonster()
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if not targetMonster or targetMonster:getMaster() then
		return true
	end
	local bossConfig = cosmic[targetMonster:getName():lower()]
	if not bossConfig then
		return true
	end
	stopEvent(revertLloyd)
	local lloyd = Tile(Position(32799, 32826, 14)):getTopCreature()
	if lloyd then
		lloyd:teleportTo(Position(32799, 32828, 14))
		lloyd:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
