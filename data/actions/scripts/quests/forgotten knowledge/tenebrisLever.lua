local config = {
			timer = Storage.ForgottenKnowledge.LadyTenebrisTimer,
			kicked = Storage.ForgottenKnowledge.LadyTenebrisKilled,
			range = 15, 
			newPos = Position(32911, 31603, 14),
			bossName = 'Lady Tenebris', 
			bossPos = Position(32912, 31599, 14)
}

local function clearTenebris()
	local spectators = Game.getSpectators(config.bossPos, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(Position(32902, 31629, 14))
			spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
		elseif spectator:isMonster() then
			spectator:remove()
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 and item.actionid == 24878 then
		if player:getPosition() ~= Position(32902, 31623, 14) then
			return true
		end
		
	for y = 31623, 31627 do
	local playerTile = Tile(Position(32902, y, 14)):getTopCreature()
		if playerTile and playerTile:isPlayer() and playerTile:getExhaustion(config.timer) > 0 then
			player:say('You or a member of your team have to wait 20 hours to challange Lady Tenebris again!', TALKTYPE_MONSTER_SAY)
			return true
		end
	end

	if roomIsOccupied(config.bossPos, config.range, config.range) then
		player:say('Someone is fighting against the boss! You need wait awhile.', TALKTYPE_MONSTER_SAY)
		return true
	end
		
	for y = 31623, 31627 do
	local playerTile = Tile(Position(32902, y, 14)):getTopCreature()
		if playerTile and playerTile:isPlayer() then
			playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
			playerTile:teleportTo(config.newPos)
			playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			playerTile:setExhaustion(config.timer, 20 * 60 * 60) -- 20 em horas o tempo de espera pra matar novamente
			playerTile:say('You have 20 minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
			addEvent(clearTenebris, 20 * 60 * 1000, Position(32902, 31589, 14), Position(32922, 31589, 14), Position(32924, 31610, 14), config.Kiked) -- 20 em minutos, tempo para ser kikado da sala
		end
	end	
	
	local spectators = Game.getSpectators(config.bossPos, false, false, 15, 15, 15, 15)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:isMonster() then
				spectator:remove()
			end
		end
		
		for d = 1, 6 do
			Game.createMonster('shadow tentacle', Position(math.random(32909, 32914), math.random(31596, 31601), 14), true, true)
		end
			Game.createMonster(config.bossName, config.bossPos, true, true)
			item:transform(9826)
		elseif item.itemid == 9826 then
			item:transform(9825)
	end	
		return true
end
