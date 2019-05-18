function onUse(cid, item, fromPosition, itemEx, toPosition)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Quandon has been murdered! You should report to Sholley about it!")
setPlayerStorageValue(cid, 10050, 15)
return TRUE
end