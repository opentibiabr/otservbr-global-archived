local bonecave = Action()

function bonecave.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.Mota) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Success")
        player:setStorageValue(Storage.TheSecretLibrary.Mota, 2)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

bonecave:uid(26680)
bonecave:register()