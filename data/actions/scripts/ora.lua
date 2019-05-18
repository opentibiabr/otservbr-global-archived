function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 33462, y = 32081, z = 8} -- where to tp to 33672, 31884, 5
if(getPlayerStorageValue(cid, 10050) < 6) then
	doTeleportThing(cid,p)
	setPlayerStorageValue(cid, 10050, 6)
	doSendMagicEffect(p,10)
	doCreatureSay(cid, "There we go.", TALKTYPE_ORANGE_1)
	else 
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)	
	doCreatureSay(cid, "You've been teleported.", TALKTYPE_ORANGE_1)
return true
end

end