function onKill(player, creature, lastHit)
	if not player:isPlayer() or not creature:isMonster() or creature:getMaster() or creature:isPlayer() then
		return true
	end
	player:addBestiaryKill(creature:getName())
	
	return true
end