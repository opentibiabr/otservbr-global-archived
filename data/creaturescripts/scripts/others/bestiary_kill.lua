function onKill(player, creature, lastHit)
	if not player:isPlayer() or not creature:isMonster() or creature:getMaster() or creature:isPlayer() then
		return true
	end

	for cid, damage in pairs(creature:getDamageMap()) do
		local participant = Player(cid)
		if participant and participant:isPlayer() then
			participant:addBestiaryKill(creature:getName())
		end
	  end

	return true
end