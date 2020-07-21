function onKill(player, creature, lastHit)
	if not player:isPlayer() or not creature:isMonster() or creature:getMaster() or creature:isPlayer() then
		return true
	end
	
	local players = {}
	for playerid, damage in pairs(creature:getDamageMap()) do
		if (not players[playerid]) then
			players[playerid] = true
		end
	end

	for id,v in pairs(players) do
		local player = Player(id)
		if player then
			player:addBestiaryKill(creature:getName())
		end
	end

	return true
end