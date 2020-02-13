local strandhair = Action()

function strandhair.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.TheLament) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a strand of hair.")
		player:addItem(33273, 1)
        player:setStorageValue(Storage.TheSecretLibrary.TheLament, 2)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

strandhair:uid(26689)
strandhair:register()