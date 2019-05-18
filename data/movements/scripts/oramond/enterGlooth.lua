function onStepIn(cid, item, pos, fromPosition)
	if item.actionid == 36489 then
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doTeleportThing(cid, {x = 33559, y = 31970, z = 12}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doCreatureSay(cid, "Slrrp!", TALKTYPE_ORANGE_1)
	elseif item.actionid == 50389 then
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doTeleportThing(cid, {x = 33651, y = 31942, z = 7}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doCreatureSay(cid, "Slrrp!", TALKTYPE_ORANGE_1)
	end
	return TRUE
end