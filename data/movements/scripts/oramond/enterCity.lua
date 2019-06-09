function onStepIn(cid, item, pos, fromPosition)
	if item.actionid == 42630 then
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doTeleportThing(cid, {x = 33636, y = 31891, z = 6}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doCreatureSay(cid, "Slrrp!", TALKTYPE_ORANGE_1)
	elseif item.actionid == 42631 then
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doTeleportThing(cid, {x = 33486, y = 31982, z = 7}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 9)
		doCreatureSay(cid, "Slrrp!", TALKTYPE_ORANGE_1)
	end
	return TRUE
end
