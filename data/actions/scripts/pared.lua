function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32677, y = 31609, z = 8} -- where to tp to 33672, 31884, 5

	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
	
end
