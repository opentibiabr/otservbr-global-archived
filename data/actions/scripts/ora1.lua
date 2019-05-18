function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 33576, y = 31954, z = 7} -- where to tp to
	if(getPlayerStorageValue(cid, 10050) == 14) then
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
return true
end

end