function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32217, y = 32151, z = 7} -- where to tp to 32217, 32151, 7
--if(getPlayerStorageValue(cid, 10050) < 18) then
	if getPlayerStorageValue(cid, 72328, 3) < 30 then
	doTeleportThing(cid,p)
	--setPlayerStorageValue(cid, 72328, 3)
	--(getPlayerStorageValue(cid, 72328) == 3)
	doSendMagicEffect(p,10)
	--doCreatureSay(cid, "Congratulations, you have completed the quest, report your mission to the NPC to win the outfit.", TALKTYPE_ORANGE_1)
	--else 
	--doTeleportThing(cid,p)
	--doSendMagicEffect(p,10)	
	doCreatureSay(cid, "Bora lixeira.", TALKTYPE_ORANGE_1)
	else doCreatureSay(cid, "You cannot use again.", TALKTYPE_ORANGE_1)
	end
return true
--end

end