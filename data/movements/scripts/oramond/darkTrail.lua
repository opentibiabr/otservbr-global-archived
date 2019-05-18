function onStepIn(cid, item, position, fromPosition)

if not isPlayer(cid) then
return false
end

local player = Player(cid)
if getPlayerStorageValue(cid, 10050) < 6 and getPlayerStorageValue(cid, 20054) < 1 then
doPlayerSendTextMessage(cid,19,"A strange ritual has taken place here. Report about it to the Gloot Brothers.")
--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A strange ritual has taken place here. Report about it to the Gloot Brothers.')
setPlayerStorageValue(cid, 20054, 1)
setPlayerStorageValue(cid, 20055, 0)

elseif getPlayerStorageValue(cid, 10050) >= 6 then 
doTeleportThing(cid, fromPosition, true)
doTeleportThing(cid, {x = 33419, y = 32106, z = 10})

doPlayerSendTextMessage(cid,19,"The necrometer reveals a hidden passage!")
--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The necrometer reveals a hidden passage!')
end
return true
end