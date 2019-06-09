function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item.itemid == 3542 or item.itemid == 1223 then
        if player:getStorageValue(Storage.ExplorerSociety.TheSpectralStone) >= 53 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 53 then
            player:teleportTo(toPosition, true)
            item:transform(item.itemid + 1)
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
        end
    elseif item.itemid == 1255 or item.itemid == 6907 then
        if player:getStorageValue(Storage.ExplorerSociety.TheIceMusic) >= 62 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 62 then
            player:teleportTo(toPosition, true)
            item:transform(item.itemid + 1)
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
        end
    end
    return true
end
