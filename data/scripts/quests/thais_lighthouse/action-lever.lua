local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- First lever to open the ladder
	if item.uid == 30004 then
		local laddertile = Tile({x = 32225, y = 32276, z = 8})
			if item.itemid == 1945 then
				laddertile:getItemById(9021):transform(8280)
				item:transform(1946)
			else
				laddertile:getItemById(8280):transform(9021)
				item:transform(1945)
			end
	-- Second lever to open the teleport to cyclops
	elseif item.uid == 30005 then
		local tile = Tile({x = 32232, y = 32276, z = 9})
		if item.itemid == 1945 then
			if tile:getItemById(1387) then
				tile:getItemById(1387):remove()
			else
				local teleport = Game.createItem(1387, 1, {x = 32232, y = 32276, z = 9})
				if teleport then
					teleport:setDestination({x = 32225, y = 32274, z = 10})
				end
				item:transform(1946)
			end
		else
			if tile:getItemById(1387) then
				tile:getItemById(1387):remove()
				item:transform(1945)
			end
		end
	end
	return true
end

lever:uid(30004, 30005)
lever:register()
