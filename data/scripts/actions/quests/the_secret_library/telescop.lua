local telescop = Action()

function telescop.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.HighDry) == 3 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"By using the telescope you observate the stellar constellations. This should help you to navigate your way back to mainland.")
        player:setStorageValue(Storage.TheSecretLibrary.HighDry, 4)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

telescop:uid(26703)
telescop:register()