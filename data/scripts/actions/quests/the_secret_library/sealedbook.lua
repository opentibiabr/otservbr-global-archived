local sealedbook = Action()

function sealedbook.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.PinkTel) == 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a scribbled notes.")
		player:addItem(33391, 1)
        player:setStorageValue(Storage.TheSecretLibrary.HighDry, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

sealedbook:uid(26700)
sealedbook:register()