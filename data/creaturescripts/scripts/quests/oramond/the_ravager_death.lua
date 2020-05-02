local setting = {
    ["the ravager"] = {pos = {x= 33496, y= 32070, z= 8}, toPos = {x= 33459, y= 32083, z= 8}, time = 60},
}

function removeTeleport(teleport)
    local teleport = getTileItemById({x= 33496, y= 32070, z= 8}, 1387)
    if teleport then
        doRemoveItem(t.uid, 1)
    end
end

function onDeath(creature)
    local monster = monster[getCreatureName(creature):lower()]
    if monster then
        doCreateTeleport(1387, {x=33459, y=32083, z=8}, {x=33496, y=32070, z=8})
        doCreatureSay(cid, "The teleport will disappear in "..monster.time.." second.", TALKTYPE_ORANGE_1)
        addEvent(removeTeleport, 60*1000)
    end

    return true
end
