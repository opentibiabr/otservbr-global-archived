local silvermask = Action()

function silvermask.onUse(player, item, frompos, item2, topos)


    if player:getStorageValue(Storage.KilmareshQuest.Sixth.Favor) == 3 then
		player:addItem(36205, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"The banana palm.")
        player:setStorageValue(Storage.KilmareshQuest.Sixth.Favor, 4)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The banana is empty.")
    end
	
	
    return true
end

silvermask:uid(57510)
silvermask:register()