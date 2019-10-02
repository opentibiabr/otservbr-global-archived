local config = {
	firstboss = "grand master oberon",
	bossPosition = Position(33364, 31317, 9),
    centerPosition = Position(33364, 31318, 9), -- Center Room  
	exitPosition = Position(33297, 31285, 9), -- Exit Position
	newPosition = Position(33364, 31321, 9),
	rangeX = 10,
	rangeY = 10,
	time = 30, -- time in minutes to remove the player	
}	

local monsters = {
	{pillar = "oberons ire", pos = Position(33367, 31320, 9)},
	{pillar = "oberons spite", pos = Position(33361, 31320, 9)},
	{pillar = "oberons hate", pos = Position( 33367, 31316, 9)},
	{pillar = "oberons bile", pos = Position(33361, 31316, 9)}
}

local function OberonIsOccupied(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(config.centerPosition, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
	if #spectators ~= 0 then
		return true
	end

	return false
end

local function clearOberonRoom(playerId, centerPosition, rangeX, rangeY, exitPosition)
	local spectators, spectator = Game.getSpectators(config.centerPosition, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isPlayer() and spectator.uid == playerId then
			spectator:teleportTo(config.exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end

		if spectator:isMonster() then
			spectator:remove()
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		if player:getPosition() ~= Position(33363, 31344, 9) and player:getPosition() ~= Position(33364, 31344, 9) and player:getPosition() ~= Position(33365, 31344, 9) then
			item:transform(1946)
			return true
		end
	end
	
	if item.itemid == 1945 then
        if player:getStorageValue(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer) >= 1 then
	       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can face Grand Master Oberon every 20 hours.")
	   return true
	    end
	end

	if item.itemid == 1945 then
		if OberonIsOccupied(config.centerPosition, config.rangeX, config.rangeY) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There's someone fighting with Grand Master Oberon.")
		return true
	end
	    for n = 1, #monsters do
			Game.createMonster(monsters[n].pillar, monsters[n].pos, true, true)
		end
		local monster = Game.createMonster(config.firstboss, config.bossPosition)
	if not monster then
		return true
	end
	
	
		for x = 33362, 33366 do
			local playerTile = Tile(Position(x, 31344, 9)):getTopCreature()
			   if playerTile and playerTile:isPlayer() then 					
				playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
				playerTile:teleportTo(config.newPosition)
				playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
				playerTile:setExhaustion(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer, 20 * 60 * 60)
			end
		end
		addEvent(clearOberonRoom, 60 * config.time * 1000, player:getId(), config.centerPosition, config.rangeX, config.rangeY, config.exitPosition)
		item:transform(1946)
	elseif item.itemid == 1946 then
		item:transform(1945)
	end
	return true
end
