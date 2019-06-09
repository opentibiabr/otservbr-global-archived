local config = {
	centerRoom = Position(33422, 32467, 14),
	BossPosition = Position(33422, 32467, 14),
	newPosition = Position(33419, 32467, 14)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(33386, 32455, 14) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		if player:getStorageValue(Storage.FerumbrasAscension.RazzagornTimer) >= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge Razzagorn.")
			return true
		end
		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with Razzagorn.")
				return true
			end
		end
		Game.createMonster("Razzagorn", config.BossPosition, true, true)
		for x = 33386, 33390 do
			local playerTile = Tile(Position(x, 32455, 14)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
				playerTile:teleportTo(config.newPosition)
				playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				playerTile:setExhaustion(Storage.FerumbrasAscension.RazzagornTimer, 60 * 60 * 2 * 24)
			end
		end
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.RazzagornTimer, 1)
		addEvent(clearForgotten, 30 * 60 * 1000, Position(33408, 32454, 14), Position(33440, 32480, 14), Position(33319, 32318, 13), GlobalStorage.FerumbrasAscendantQuest.RazzagornTimer)
		item:transform(9826)
	elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
