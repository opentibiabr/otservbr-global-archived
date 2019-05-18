function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32370, y = 31058, z = 7} -- 32370, 31058, 7
if(getPlayerStorageValue(cid, 10050) < 100) then
	doTeleportThing(cid,p)
	--setPlayerStorageValue(cid, 10050, 18)
	doSendMagicEffect(p,10)
	--else doCreatureSay(cid, "You already used the sign, go to north and use the teleport to go back.", TALKTYPE_ORANGE_1)
return true
end

end