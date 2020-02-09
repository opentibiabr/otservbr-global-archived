local sangra = Action()

function sangra.onUse(player, item, frompos, item2, topos)
    if player:getStorageValue(Storage.KilmareshQuest.Nove.Coruja) == 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"The arrow is still sticking in the tree. Fresh blood keeps trickling from the spot where the arrow hit the trunk.")
        player:setStorageValue(Storage.KilmareshQuest.Dez.Sangra, 1)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry")
    end
    return true
end

sangra:uid(57526)
sangra:register()