function onStepIn(cid, item, position, fromPosition)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need more players to do this quest.")
	return true
end
