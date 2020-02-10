local memory3 = Action()

function memory3.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.KilmareshQuest.Fifth.Memories) == 3 then
	
    if table.contains({36192}, target.itemid) and target.uid == 57507 then
            player:sendTextMessage(MESSAGE_INFO_DESCR,"Through a dimensional gate you can see how the Ambassador of Rathleton is talking to Fafnar cultists in a quite familiar way. The proof is absolutely substantive. The Ambassador is a betrayer!")
            player:setStorageValue(Storage.KilmareshQuest.Fifth.Memories, 3)
			player:removeItem(36191, 1)
    end
	
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Empty.")
		
	end
	
    return true
end

memory3:id(36191)
memory3:register()