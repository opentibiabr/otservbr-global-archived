function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 19900 then
		if player:getStorageValue(Storage.OutfitQuest.BeggarFirstAddon) == 1 then
			if item.itemid == 5114 then

			Item(item.uid):transform(item.itemid + 1)
				player:teleportTo(toPosition, true)

			elseif item.itemid == 5115 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 33164, y = 31600, z = 15}, true)
			end
		else
			player:sendTextMessage(19, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end
