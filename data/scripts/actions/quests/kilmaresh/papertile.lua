local papertile = Action()

function papertile.onUse(player, item, frompos, item2, topos)
    if player:getStorageValue(Storage.KilmareshQuest.Second.Investigating) == 3 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Paper scraps lie scattered on the floor. It takes some time to put them back together. But it's only a badly written poem.")
        player:setStorageValue(Storage.KilmareshQuest.Second.Investigating, 4)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Empty.")
    end
    return true
end

papertile:uid(57503)
papertile:register()