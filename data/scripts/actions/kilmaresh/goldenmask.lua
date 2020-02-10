local goldenmask = Action()

function goldenmask.onUse(player, item, frompos, item2, topos)


    if player:getStorageValue(Storage.KilmareshQuest.Sixth.Favor) == 4 then
		player:addItem(36204, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"The cryphon nest.")
        player:setStorageValue(Storage.KilmareshQuest.Sixth.Favor, 5)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The cryphon nest is empty.")
    end
	
	
    return true
end

goldenmask:uid(57511)
goldenmask:register()