local config = {
	[1] = Position(33183, 32197, 13),
	[2] = Position(33331, 32076, 13),
	[3] = Position(33265, 32202, 13),
	[4] = Position(33087, 32096, 13)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if isInArray({7911, 7912}, item.itemid) then
		local gemCount = player:getStorageValue(Storage.ElementalSphere.MachineGemCount)
		if isInArray({33268, 33269}, toPosition.x) and toPosition.y == 31830 and toPosition.z == 10 and gemCount >= 20 then
			player:setStorageValue(Storage.ElementalSphere.MachineGemCount, gemCount - 20)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config[player:getVocation():getBase():getId()], false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
		toPosition.x = toPosition.x + (item.itemid == 7911 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7911 and 7912 or 7911)
			if thing then
				thing:transform(thing.itemid + 4)
			end
		end
		item:transform(item.itemid + 4)
	else
		toPosition.x = toPosition.x + (item.itemid == 7915 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7915 and 7916 or 7915)
			if thing then
				thing:transform(thing.itemid - 4)
			end
		end
		item:transform(item.itemid - 4)
	end
	return true
end