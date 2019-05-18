function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32559, y = 31852, z = 7} -- 32694, 31495, 11
if(getPlayerStorageValue(cid, 10050) < 1000) then
	doTeleportThing(cid,p)
	
	doSendMagicEffect(p,10)
	else doCreatureSay(cid, "Zzz Dont working.", TALKTYPE_ORANGE_1)
return true
end

end