function onUse(player)
if player:getStorageValue(10050) == 14 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Quandon has been murdered! You should report to Sholley about it!.')
player:setStorageValue(30053, 1)
player:setStorageValue(30054, 0)
player:setStorageValue(10050, 15)
elseif player:getStorageValue(10050) > 14 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Mission Complete!')
end
return true
end
