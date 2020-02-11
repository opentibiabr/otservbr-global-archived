local memory1 = Action()

function memory1.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.KilmareshQuest.Fifth.Memories) == 1 then
	
    if table.contains({36192}, target.itemid) and target.uid == 57507 then
            player:sendTextMessage(MESSAGE_INFO_DESCR,"The Ambassador tells another dignitary: Rathleton must never be surpassed! I will procure that the Empire falters!")
            player:setStorageValue(Storage.KilmareshQuest.Fifth.Memories, 2)
			player:removeItem(36189, 1)
    end
	
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Empty.")
		
	end
	
    return true
end

memory1:id(36189)
memory1:register()