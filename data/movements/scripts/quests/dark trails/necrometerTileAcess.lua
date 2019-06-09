function onStepIn(cid, item, position, fromPosition)
local player = Player(cid)
if getPlayerStorageValue(cid, 10050) == 4 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A strange ritual has taken place here. Report about it to the Gloot Brothers.')
setPlayerStorageValue(cid, 20054, 1)
setPlayerStorageValue(cid, 20055, 0)
setPlayerStorageValue(cid, 10050, 5)
elseif getPlayerStorageValue(cid, 10050) == 10 and getPlayerItemCount(cid, 23488) > 0 then
doTeleportThing(cid, fromPosition, true)
doTeleportThing(cid, {x = 33419, y = 32106, z = 10})
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The necrometer reveals a hidden passage!')
end
return true
end