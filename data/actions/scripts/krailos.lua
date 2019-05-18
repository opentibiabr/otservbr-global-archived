function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 33658, y = 31660, z = 8} -- where to tp to 33672, 31884, 5
if(getPlayerStorageValue(cid, 10050) < 80) then
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
	end
end
