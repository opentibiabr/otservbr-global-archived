function onSay(cid, words, param, channel)
local storage = 6708 -- (You can change the storage if its already in use)
local delaytime = 300 -- (Exhaust In Seconds.)
local x = getPlayerPosition(cid).x -- (Do not edit this.)
local y = getPlayerPosition(cid).y -- (Do not edit this.)
local z =  getPlayerPosition(cid).z -- (Do not edit this.)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Command param required.")
return true
end
if (getPlayerStorageValue(cid, storage) <= os.time()) then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your report has been received successfully!")
db.query("INSERT INTO  `player_reports` (`id` ,`name` ,`posx` ,`posy` ,`posz` ,`report_description` ,`date`)VALUES (NULL ,  '" .. getPlayerName(cid) .. "',  '" .. x .. "',  '" .. y .. "',  '" .. z .. "',  '" .. param .. "',  '" .. os.date() .. "')")
setPlayerStorageValue(cid,storage,os.time()+delaytime)
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to wait 5 minutes to report again.")
end
return TRUE
end
