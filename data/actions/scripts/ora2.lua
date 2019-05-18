function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 33665, y = 31922, z = 7} -- where to tp to
if(getPlayerStorageValue(cid, 10050) == 17) then
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
return true
end

end