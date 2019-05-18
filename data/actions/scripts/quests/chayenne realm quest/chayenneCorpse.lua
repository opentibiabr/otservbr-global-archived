function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 77649) < 1 then
		item:remove(1)
		setPlayerStorageValue(cid, 77649, 1)
		doPlayerSendTextMessage(cid, 19, "Happy birthday, Tibia!")
		doTeleportThing(cid, {x = 32715, y = 31634, z = 7}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 30)
	else
		doPlayerSendTextMessage(cid, 19, "You already got your reward.")
	end
end