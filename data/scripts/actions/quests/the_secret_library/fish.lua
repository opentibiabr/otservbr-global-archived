local sealedbook = Action()

function sealedbook.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.HighDry) == 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You have found a hawser.")
		player:addItem(32407, 1)
        player:setStorageValue(Storage.TheSecretLibrary.HighDry, 3)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

sealedbook:uid(26702)
sealedbook:register()