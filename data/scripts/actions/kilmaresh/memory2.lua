local memory2 = Action()

function memory2.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.KilmareshQuest.Fifth.Memories) == 2 then
	
    if table.contains({36192}, target.itemid) and target.uid == 57507 then
            player:sendTextMessage(MESSAGE_INFO_DESCR,"Through a dimensional gate you can see the Ambassador of Rathleton wearing a cloak with a black sphinx on it.")
            player:setStorageValue(Storage.KilmareshQuest.Fifth.Memories, 3)
			player:removeItem(36190, 1)
    end
	
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Empty.")
		
	end
	
    return true
end

memory2:id(36190)
memory2:register()