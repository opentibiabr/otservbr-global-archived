local config = {
	centerRoom = Position(33392, 31473, 14),
	BossPosition = Position(33392, 31473, 14),
	playerPositions = {
		Position(33269, 31477, 14),
		Position(33269, 31478, 14),
		Position(33269, 31479, 14),
		Position(33269, 31480, 14),
		Position(33269, 31481, 14),
		Position(33270, 31477, 14),
		Position(33270, 31478, 14),
		Position(33270, 31479, 14),
		Position(33270, 31480, 14),
		Position(33270, 31481, 14),
		Position(33271, 31477, 14),
		Position(33271, 31478, 14),
		Position(33271, 31479, 14),
		Position(33271, 31480, 14),
		Position(33271, 31481, 14)
	},
	newPosition = Position(33392, 31479, 14)
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(33270, 31477, 14) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with Ferumbras.")
				return true
			end
		end
		Game.createMonster("Ascending Ferumbras", config.BossPosition, true, true)
		for b = 1,10 do
			local xrand = math.random(-10, 10)
			local yrand = math.random(-10, 10)
			local position = Position(33392 + xrand, 31473 + yrand, 14)
			if Game.createMonster("rift invader", position) then
			end
		end
		for x = 33269, 33271 do
			for y = 31477, 31481 do
				local playerTile = Tile(Position(x, y, 14)):getTopCreature()
				if playerTile and playerTile:isPlayer() then
					playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
					playerTile:teleportTo(config.newPosition)
					playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
			end
		end
		addEvent(clearForgotten, 30 * 60 * 1000, Position(33379, 31460, 14), Position(33405, 31485, 14), Position(33319, 32318, 13))
		item:transform(9826)
	elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
