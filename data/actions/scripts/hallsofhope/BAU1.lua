function onUse(player, item, itemEx)
    if player:getStorageValue(935481) < 1 then
        local newItem = Game.createItem(26654, 1)
        player:addItemEx(newItem)
        player:setStorageValue(935481, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy old Tome, but you have no room to take it.")
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already took a beginner reward.")
    end
end