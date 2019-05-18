local config = {
	centerRoom = Position(32912, 31599, 14),
	BossPosition = Position(32912, 31599, 14),
	newPosition = Position(32911, 31603, 14)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(32902, 31623, 14) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.TenebrisTimer) >= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge Lady Tenebris.")
			return true
		end
		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with Lady Tenebris.")
				return true
			end
		end
		for y = 31623, 31627 do
			local playerTile = Tile(Position(32902, y, 14)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
				playerTile:teleportTo(config.newPosition)
				playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				playerTile:setExhaustion(Storage.ForgottenKnowledge.LadyTenebrisTimer, 20 * 60 * 60)
			end
		end
		for d = 1, 6 do
			Game.createMonster('shadow tentacle', Position(math.random(32909, 32914), math.random(31596, 31601), 14), true, true)
		end
		Game.createMonster("lady tenebris", config.BossPosition, true, true)
		Game.setStorageValue(GlobalStorage.ForgottenKnowledge.TenebrisTimer, 1)
		addEvent(clearForgotten, 30 * 60 * 1000, Position(32895, 31584, 14), Position(32929, 31614, 14), Position(32925, 31617, 14), GlobalStorage.ForgottenKnowledge.TenebrisTimer)
		item:transform(9826)
		elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
		
		
		
		