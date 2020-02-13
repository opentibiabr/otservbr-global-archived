local paper = Action()

function paper.onUse(player, item, frompos, item2, topos)
    if player:getStorageValue(Storage.KilmareshQuest.Second.Investigating) == 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Documents were burnt here recently. Only the part of one scroll still lies in front of the chimney but it's too sooted to read.")
        player:setStorageValue(Storage.KilmareshQuest.Second.Investigating, 3)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Empty.")
    end
    return true
end

paper:uid(57502)
paper:register()