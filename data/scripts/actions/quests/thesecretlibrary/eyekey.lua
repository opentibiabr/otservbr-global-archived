local lotuskey = Action()

function lotuskey.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.TheLament) == 4 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a eye key.")
		player:addItem(33265, 1)
        player:setStorageValue(Storage.TheSecretLibrary.TheLament, 5)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

lotuskey:uid(26692)
lotuskey:register()