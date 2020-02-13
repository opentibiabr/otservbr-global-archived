local ivorymask = Action()

function ivorymask.onUse(player, item, frompos, item2, topos)


    if player:getStorageValue(Storage.KilmareshQuest.Sixth.Favor) == 1 then
		player:addItem(36206, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You hear a click. You can now lift the floor tile and discover a secret compartment. But it is empty.")
        player:setStorageValue(Storage.KilmareshQuest.Sixth.Favor, 2)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Empty.")
    end
	
	
    return true
end

ivorymask:uid(57508)
ivorymask:register()