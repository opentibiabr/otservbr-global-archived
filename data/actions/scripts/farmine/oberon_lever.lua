local config = {
	bossName = "Grand Master Oberon",
	lockStorage = 5000105, -- globalstorage
	bossPos = Position(33364, 31317, 9),
	centerRoom = Position(33364, 31318, 9), -- Center Room  
	exitPosition = Position(33366, 31342, 9), -- Exit Position
	newPos = Position(33364, 31321, 9),
	range = 10,
	time = 10, -- time in minutes to remove the player	
}	

--[[local monsters = {
	{pillar = "oberons ire", pos = Position(33367, 31320, 9)},
	{pillar = "oberons spite", pos = Position(33361, 31320, 9)},
	{pillar = "oberons hate", pos = Position( 33367, 31316, 9)},
	{pillar = "oberons bile", pos = Position(33361, 31316, 9)}
}]]

local function clearOberonRoom()
	if Game.getStorageValue(config.lockStorage) == 1 then
		local spectators = Game.getSpectators(config.bossPos, false, false, 10, 10, 10, 10)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:isPlayer() then
				spectator:teleportTo(config.exitPosition)
				spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
			elseif spectator:isMonster() then
				spectator:remove()
			end
		end
		Game.setStorageValue(config.lockStorage, 0)
	end
end
-- Start Script
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 and item.actionid == 57605 then
		if player:getPosition() ~= Position(33364, 31344, 9) then
			return true
		end
			
	for x = 33362, 33366 do
	local playerTile = Tile(Position(x, 31344, 9)):getTopCreature()
		if playerTile and playerTile:isPlayer() then 
			if playerTile:getStorageValue(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer) > os.time() then
				playerTile:sendTextMessage(MESSAGE_STATUS_SMALL, "You or a member in your team have to wait 20 hours to challange Grand Master Oberon again!")
				item:transform(1946)
				return true
			end
		end
	end			
	
	local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "There's someone fighting with Grand Master Oberon.")
			item:transform(1946)
			return true
		end
	end	
			
	if Game.getStorageValue(config.lockStorage) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need wait 10 minutes to room cleaner!")
		return true
	end
	
	local spectators = Game.getSpectators(config.bossPos, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isMonster() then
			spectator:remove()
		end
	end
		--[[for n = 1, #monsters do
			Game.createMonster(monsters[n].pillar, monsters[n].pos, true, true)
		end]]	
	Game.createMonster(config.bossName, config.bossPos, true, true)	
	Game.setStorageValue(config.lockStorage, 1)
	for x = 33362, 33366 do
		local playerTile = Tile(Position(x, 31344, 9)):getTopCreature()
		if playerTile and playerTile:isPlayer() then 					
			playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
			playerTile:teleportTo(config.newPos)
			playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
			playerTile:setStorageValue(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer, os.time() + 20 * 60 * 3600) -- + 20 * 60 * 3600
			addEvent(clearOberonRoom, 60 * config.time * 1000, playerTile:getId(), config.centerRoom, config.range, config.range, config.exitPosition)
			playerTile:sendTextMessage(MESSAGE_STATUS_SMALL, "You have 10 minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.")
			item:transform(1946)
		end
	end
	
elseif item.itemid == 1946 then
		item:transform(1945)
	end
		return true
end
