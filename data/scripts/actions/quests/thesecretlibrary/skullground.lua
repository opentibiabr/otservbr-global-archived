local strandhair = Action()

function strandhair.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.TheLament) == 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found an old letter.")
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have discovered a skeleton. It seems to hold an old letter and its skull is missing.")
		player:addItem(33294, 1)
        player:setStorageValue(Storage.TheSecretLibrary.TheLament, 3)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

strandhair:uid(26690)
strandhair:register()