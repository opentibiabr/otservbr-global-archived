local DragonsPositions = {
	{position = Position(33574, 31013, 14)},
	{position = Position(33592, 31013, 14)},
	{position = Position(33583, 31022, 14)},
	{position = Position(33574, 31031, 14)},
	{position = Position(33592, 31031, 14)}
}

local Rooms = {
	{position = Position(33574, 31017, 14)},
	{position = Position(33592, 31017, 14)},
	{position = Position(33583, 31026, 14)},
	{position = Position(33574, 31035, 14)},
	{position = Position(33592, 31035, 14)}
}

local PlayerPositions = {
	{position = Position(33582,30993,14)},
	{position = Position(33583,30993,14)},
	{position = Position(33584,30993,14)},
	{position = Position(33582,30994,14)},
	{position = Position(33583,30994,14)},
	{position = Position(33584,30994,14)},
	{position = Position(33582,30995,14)},
	{position = Position(33583,30995,14)},
	{position = Position(33584,30995,14)},
	{position = Position(33582,30996,14)},
	{position = Position(33583,30996,14)},
	{position = Position(33584,30996,14)},
	{position = Position(33582,30997,14)},
	{position = Position(33583,30997,14)},
	{position = Position(33584,30997,14)}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		local check = Tile(Position(33583,30993,14)):getTopCreature()
		if player:getPosition() ~= Position(33583, 30993, 14) or not check or not check:isPlayer() then
			item:transform(9826)
			return true
		end

	end
	if item.itemid == 9825 then
		local specs, spec = Game.getSpectators(Position(33597, 31022, 14), false, false, 35, 35, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with The First Dragon.")
				return true
			end
		end
		for d = 1, 5 do
			Game.createMonster('Unbeatable Dragon', Position(math.random(33610, 33622), math.random(31016, 31030), 14), true, true)
		end
		for b = 1, #DragonsPositions do
			Game.createMonster('Fallen Challenger', DragonsPositions[b].position, true, true)
		end
		local roomIndex, storePlayers = 1, {}
		for i = 1, #PlayerPositions do
			local position = PlayerPositions[i].position
			local playerTile = Tile(PlayerPositions[i].position):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				storePlayers[#storePlayers + 1] = playerTile
			end
			if storePlayers[3] ~= nil then
				for p = 1, 3 do
					local players = storePlayers[p]
					if players then
						if players:getStorageValue(Storage.FirstDragon.FirstDragonTimer) < os.time() then
							players:teleportTo(Rooms[roomIndex].position)
							players:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
							players:setStorageValue(Storage.FirstDragon.FirstDragonTimer, os.time() + 20 * 60 * 60)
						else
							player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge this enemy.")
							return true
						end
					end
					if p == 3 then
						storePlayers = {}
						roomIndex = roomIndex + 1
					end
				end
			end
		end
		addEvent(clearForgotten, 30 * 60 * 1000, Position(33567, 31007, 14), Position(33628, 31037, 14), Position(33597, 30993, 14))
		item:transform(9826)
	elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
