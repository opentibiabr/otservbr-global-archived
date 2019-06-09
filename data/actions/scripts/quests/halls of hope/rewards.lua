local rewardItemId = 26654
local config = {
    [17391] = Storage.HallsOfHope.Reward1,
    [17392] = Storage.HallsOfHope.Reward2,
    [17393] = Storage.HallsOfHope.Reward3,
    [17394] = Storage.HallsOfHope.Reward4,
    [17395] = Storage.HallsOfHope.Reward5
}

function onUse(player, item, itemEx)

    for uid, storage in pairs(config) do
        if item.uid == uid then
            if player:getStorageValue(storage) < 1 then
                local newItem = Game.createItem(rewardItemId, 1)
                player:addItemEx(newItem)
                player:setStorageValue(storage, 1)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy old Tome, but you have no room to take it.")
            end

            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already took a beginner reward.")
        end
    end
    return true
end
