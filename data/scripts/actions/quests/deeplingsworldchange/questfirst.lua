local questfirst = Action()

function questfirst.onUse(player, item, frompos, item2, topos)

    if player:getStorageValue(Storage.DeeplingsWorldChange.Crystal) == 7 then
		player:addItem(2152, 10)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Success.")
        player:setStorageValue(Storage.DeeplingsWorldChange.Crystal, 8)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Empty.")
    end
	
    return true
end

questfirst:uid(28571)
questfirst:register()