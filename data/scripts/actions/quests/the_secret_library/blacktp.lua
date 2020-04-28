local blacktp = Action()

function blacktp.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.BlackTel) == -1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a skull.")
		player:addItem(33272, 1)
        player:setStorageValue(Storage.TheSecretLibrary.BlackTel, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

blacktp:uid(26696)
blacktp:register()