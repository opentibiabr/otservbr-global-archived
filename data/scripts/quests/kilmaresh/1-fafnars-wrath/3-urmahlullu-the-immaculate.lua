-- lever to urmahlullu room

local config = {
	requiredLevel = 100,
	daily = true,
	centerUrmahlulluRoomPosition = Position(33918, 31649, 8),
	playerPositions = {
		Position(33918, 31626, 8),
		Position(33919, 31626, 8),
		Position(33920, 31626, 8),
		Position(33921, 31626, 8),
		Position(33922, 31626, 8),
	},
	newPositions = {
		Position(33919, 31657, 8),
	},
	urmahlulluPosition = {
		Position(33919, 31648, 8),
	},
	firstPlayer = {
		Position(33918, 31626, 8),
	}
}

local leverboss = Action()

function leverboss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		local storePlayers, playerTile = {}

		for i = 1, #config.playerPositions do
			playerTile = Tile(config.firstPlayer[i]):getTopCreature()
			if not playerTile or not playerTile:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 5 players.")
				return true
			end

			if playerTile:getLevel() < config.requiredLevel then
				player:sendTextMessage(MESSAGE_STATUS_SMALL,
					"All the players need to be level ".. config.requiredLevel .." or higher.")
				return true
			end

			if config.daily and playerTile:getStorageValue(Storage.Kilmaresh.UrmahlulluTimer) > os.time() then
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				player:sendCancelMessage('All players are not still ready from last battle yet.')
				return true
			end

			storePlayers[#storePlayers + 1] = playerTile
		end

		local specs, spec = Game.getSpectators(config.centerUrmahlulluRoomPosition, false, false, 14, 14, 13, 13)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "A team is already inside the quest room.")
				return true
			end

			spec:remove()
		end

		if player:getPosition()~=config.firstPlayer[1] then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You can't start a battle.")
			return true
		end

		for i = 1, #config.urmahlulluPosition do
			Game.createMonster("Urmahlullu the Immaculate", config.urmahlulluPosition[i])
		end

		local players
		for i = 1, #storePlayers do
			players = storePlayers[i]
			config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
			players:teleportTo(config.newPositions[1])
			config.newPositions[1]:sendMagicEffect(CONST_ME_ENERGYAREA)
			players:setDirection(DIRECTION_EAST)
		end
		player:setStorageValue(Storage.Kilmaresh.UrmahlulluTimer, os.time()+20*60*60) -- 20 hours
	end

	item:transform(9825)
	return true
end

leverboss:uid(9545)
leverboss:register()
