local mirrormask = Action()

function mirrormask.onUse(player, item, frompos, item2, topos)


    if player:getStorageValue(Storage.Kilmaresh.Sixth.Favor) == 2 then
		player:addItem(36207, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"The sarcophaqus.")
        player:setStorageValue(Storage.Kilmaresh.Sixth.Favor, 3)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Empty.")
    end
	
	
    return true
end

mirrormask:uid(57509)
mirrormask:register()