function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
if getPlayerStorageValue(cid, 10050) == 14 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Quandon has been murdered! You should report to Sholley about it!.')
setPlayerStorageValue(cid, 30053, 1)
setPlayerStorageValue(cid, 30054, 0)
setPlayerStorageValue(cid, 10050, 15)
elseif getPlayerStorageValue(cid, 10050) > 14 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Mission Complete!')
end
return true
end