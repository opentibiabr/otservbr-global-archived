local boattp = Action()

function boattp.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.TheSecretLibrary.HighDry) == 4 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"The raft was not that solid in the end, its parts are floating in the ocean now. But at least you reached dry land.")
		player:removeItem(32407, 1)
		player:teleportTo(Position(32187, 32474, 7))
        player:setStorageValue(Storage.TheSecretLibrary.HighDry, 5)
		player:setStorageValue(Storage.TheSecretLibrary.PinkTel, 3)
		player:setStorageValue(Storage.TheSecretLibrary.Mota, 13)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "empty")
    end
	
    return true
end

boattp:uid(26704)
boattp:register()