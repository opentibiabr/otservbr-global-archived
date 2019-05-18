local config = {
	requiredLevel = 100,
	daily = false,
	centerDemonRoomPosition = Position(33221, 31659, 13),
	playerPositions = {
		Position(33225, 31671, 13),
		Position(33224, 31671, 13),
		Position(33223, 31671, 13),
		Position(33222, 31671, 13)
	},
	newPositions = {
		Position(33222, 31659, 13),
		Position(33221, 31659, 13),
		Position(33220, 31659, 13),
		Position(33219, 31659, 13)
	},
	demonPositions = {
		Position(33219, 31657, 13),
		Position(33221, 31657, 13),
		Position(33223, 31659, 13),
		Position(33224, 31659, 13),
		Position(33220, 31661, 13),
		Position(33222, 31661, 13)
	}
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1946 then
		local storePlayers, playerTile = {}

		for i = 1, #config.playerPositions do
			playerTile = Tile(config.playerPositions[i]):getTopCreature()
			if not playerTile or not playerTile:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 4 players.")
				return true
			end

			if playerTile:getLevel() < config.requiredLevel then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "All the players need to be level ".. config.requiredLevel .." or higher.")
				return true
			end

			storePlayers[#storePlayers + 1] = playerTile
		end

		local specs, spec = Game.getSpectators(config.centerDemonRoomPosition, false, false, 3, 3, 2, 2)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "A team is already inside the quest room.")
				return true
			end

			spec:remove()
		end

		for i = 1, #config.demonPositions do
			Game.createMonster("Demon", config.demonPositions[i])
		end

		local players
		for i = 1, #storePlayers do
			players = storePlayers[i]
			config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
			players:teleportTo(config.newPositions[i])
			config.newPositions[i]:sendMagicEffect(CONST_ME_ENERGYAREA)
			players:setDirection(DIRECTION_EAST)
		end
	elseif item.itemid == 1945 then
		if config.daily then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
			return true
		end
	end

	item:transform(item.itemid == 1946 and 1945 or 1946)
	return true
end