local greentp = Action()

function greentp.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.BlueTel) == -1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a piece of ebony.")
		player:addItem(33274, 1)
        player:setStorageValue(Storage.TheSecretLibrary.BlueTel, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

greentp:uid(26695)
greentp:register()