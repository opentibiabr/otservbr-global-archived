function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) < os.time() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a tortoise egg from Nargor.")
        player:addItem(6125, 1)
        player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, os.time() + 24 * 60 * 60)
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tortoise's nest is empty.")
    return true
end
