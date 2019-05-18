function onStepIn(cid, item, position, fromPosition)
if getPlayerStorageValue(cid, 10050) < 19 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid,19,"you don't have bussiness here")
elseif getPlayerStorageValue(cid, 10050) >= 19 then
setPlayerStorageValue(cid, 10050, 20)
setPlayerStorageValue(cid, 30057, 1)
setPlayerStorageValue(cid, 30058, 0)
end
return TRUE
end