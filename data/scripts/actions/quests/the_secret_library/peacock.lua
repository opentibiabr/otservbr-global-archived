local peacock = Action()

function peacock.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.Peacock) == -1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found the Peacock Ballad.")
		player:addItem(32410, 1)
        player:setStorageValue(Storage.TheSecretLibrary.Peacock, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

peacock:uid(26697)
peacock:register()