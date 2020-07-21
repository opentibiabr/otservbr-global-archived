function onKill(player, creature, lastHit)
	if not player:isPlayer() or not creature:isMonster() or creature:getMaster() or creature:isPlayer() then
		return true
	end

	for cid, damage in pairs(creature:getDamageMap()) do
		local player = Player(cid)
		if player and player:isPlayer() then
		  player:addBestiaryKill(creature:getName())
		end
	  end

	return true
end