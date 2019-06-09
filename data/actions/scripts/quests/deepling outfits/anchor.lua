function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 33639, y = 31377, z = 9} -- where to tp to 33672, 31884, 5
if(getPlayerStorageValue(cid, 10050) < 18) then
	if getPlayerStorageValue(cid, 72328, 3) < 4 then
	doTeleportThing(cid,p)
	setPlayerStorageValue(cid, 72328, 3)
	doSendMagicEffect(p,10)
	doCreatureSay(cid, "Congratulations, you have completed the quest, report your mission to the NPC Navigator to win the outfit.", TALKTYPE_ORANGE_1)
	else
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
	doCreatureSay(cid, "You've been teleported.", TALKTYPE_ORANGE_1)
	end
	else
	doCreatureSay(cid, "You cannot use again.", TALKTYPE_ORANGE_1)
	end
return true
end
