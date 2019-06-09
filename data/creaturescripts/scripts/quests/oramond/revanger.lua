local tps =
{
-- [monster name] = {pos = {posição onde aparecerá o TP}, toPos = {posição para onde levara o TP}, time = tempo para o teleporte sumir},
    ["The Ravager"] = {pos = {x= 33496, y= 32070, z= 8}, toPos = {x= 33459, y= 32083, z= 8}, time = 60},
}

function removeTp(tp)
    local t = getTileItemById({x= 33496, y= 32070, z= 8}, 1387)
    if t then
        doRemoveItem(t.uid, 1)
    end
end

function onDeath(cid)
    local tp = tps[getCreatureName(cid)]
    if tp then
        doCreateTeleport(1387, {x=33459, y=32083, z=8}, {x=33496, y=32070, z=8})
        doCreatureSay(cid, "The teleport will disappear in "..tp.time.." second.", TALKTYPE_ORANGE_1)
        addEvent(removeTp, 60*1000)
    end

	return true
end
