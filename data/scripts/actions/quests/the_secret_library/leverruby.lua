local leverruby = Action()

function leverruby.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.Mota) == 7 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Success")
		player:addItem(32409, 1)
        player:setStorageValue(Storage.TheSecretLibrary.Mota, 8)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

leverruby:uid(26685)
leverruby:register()