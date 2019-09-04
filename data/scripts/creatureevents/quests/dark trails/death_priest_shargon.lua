local t1ps = 
{
    ["Death Priest Shargon"] = {pos = {x= 33487, y= 32101, z= 9}, toPos = {x=33489, y=32088, z=9}, time = 60},
}
 
function removeT1ps(t1p)
    local t1 = getTileItemById({x= 33487, y= 32101, z= 9}, 1387)
    if t1 then
        doRemoveItem(t1.uid, 1)
    end
end

local death_priest = CreatureEvent("Death Priest Shargon onDeath")
 
function death_priest.onDeath(cid)
    local t1p = t1ps[getCreatureName(cid)]
    if t1p then
        dark = doCreateTeleport(1387, {x=33489, y=32088, z=9}, {x= 33487, y= 32101, z= 9})
		doSetItemActionId(dark, 53161)
        doCreatureSay(cid, "The teleport will disappear in "..t1p.time.." second.", TALKTYPE_ORANGE_1)
        addEvent(removeT1ps, 60*1000)
    end
    
	return true
end

death_priest:register()