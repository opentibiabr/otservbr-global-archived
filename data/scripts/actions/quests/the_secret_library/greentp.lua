local greentp = Action()

function greentp.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.GreenTel) == -1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You see silver chimes dangling on the dragon statue in this room.")
		player:addItem(33277, 1)
        player:setStorageValue(Storage.TheSecretLibrary.GreenTel, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

greentp:uid(26694)
greentp:register()