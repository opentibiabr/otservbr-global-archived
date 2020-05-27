local positions = {
	{x = 32106, y = 31903, z = 7},
	{x = 32106, y = 31904, z = 7},
	{x = 32105, y = 31903, z = 7},
	{x = 32105, y = 31904, z = 7}
}

local lever = Action()

function lever.onUse(player, item, target, position, fromPosition)
	if item.itemid == 10044 then
		for i = 1, #positions do
			local tile = Tile(positions[i])
			local createBridge = tile:getItemById(4665)
			if createBridge then
				createBridge:transform(5769)
			end
		end
		item:transform(10045)
	elseif item.itemid == 10045 then
		for i = 1, #positions do
			local tile = Tile(positions[i])
			if tile then
				local creatures = tile:getCreatures()
				if creatures and #creatures > 0 then
					return player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
				end
				local removeBridge = tile:getItemById(5769)
				if removeBridge then
					removeBridge:transform(4665)
					item:transform(10045)
				end
			end
		end
		item:transform(10044)
	end
	return true
end

lever:aid(40014)
lever:register()