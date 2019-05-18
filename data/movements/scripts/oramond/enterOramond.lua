function onStepIn(cid, item, pos, fromPosition)
	if item.actionid == 42626 then
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doTeleportThing(cid, {x = 33539, y = 32014, z = 6}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doCreatureSay(cid, "Slrrp!", TALKTYPE_ORANGE_1)
	elseif item.actionid == 42627 then
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doTeleportThing(cid, {x = 33491, y = 31985, z = 7}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doCreatureSay(cid, "Slrrp!", TALKTYPE_ORANGE_1)
	end
	return TRUE
end