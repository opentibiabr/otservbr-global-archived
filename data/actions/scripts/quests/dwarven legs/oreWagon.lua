function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32624, y = 31514, z = 9} -- 32694, 31495, 11
if(getPlayerStorageValue(cid, 10050) < 1000) then
	doTeleportThing(cid,p)

	doSendMagicEffect(p,10)
	else doCreatureSay(cid, "Zzz Dont working.", TALKTYPE_ORANGE_1)
return true
end

end
