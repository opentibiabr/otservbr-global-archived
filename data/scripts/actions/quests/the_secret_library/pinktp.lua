local blacktp = Action()

function blacktp.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.PinkTel) == -1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You discovered an old writing desk that contains an ancient map.")
		player:addItem(27615, 1)
        player:setStorageValue(Storage.TheSecretLibrary.PinkTel, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

blacktp:uid(26699)
blacktp:register()