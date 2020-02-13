local corpse = Action()

function corpse.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.TheLament) == 5 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a scribbled notes.")
		player:addItem(33292, 1)
        player:setStorageValue(Storage.TheSecretLibrary.TheLament, 6)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

corpse:uid(26693)
corpse:register()