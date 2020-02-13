local scrolls = Action()

function scrolls.onUse(player, item, frompos, item2, topos)
    if player:getStorageValue(Storage.KilmareshQuest.Second.Investigating) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You examine the scrolls carefully. Those are orders from Rathleton for the Ambassador. No sign of treason here.")
        player:setStorageValue(Storage.KilmareshQuest.Second.Investigating, 2)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Empty.")
    end
    return true
end

scrolls:uid(57501)
scrolls:register()