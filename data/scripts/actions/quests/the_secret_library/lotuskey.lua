local lotuskey = Action()

function lotuskey.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.TheLament) == 3 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a lotus key.")
		player:addItem(33264, 1)
        player:setStorageValue(Storage.TheSecretLibrary.TheLament, 4)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

lotuskey:uid(26691)
lotuskey:register()