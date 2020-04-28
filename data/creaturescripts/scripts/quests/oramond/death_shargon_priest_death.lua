local setting = {
    ["death priest shargon"] = {pos = {x= 33487, y= 32101, z= 9}, toPos = {x=33489, y=32088, z=9}, time = 60},
}

function removeTeleport(teleport)
    local teleport = getTileItemById({x= 33487, y= 32101, z= 9}, 1387)
    if teleport then
        doRemoveItem(teleport.uid, 1)
    end
end

function onDeath(creature)
    local monster = setting[getCreatureName(creature):lower()]
    if monster then
        dark = doCreateTeleport(1387, {x=33489, y=32088, z=9}, {x= 33487, y= 32101, z= 9})
        doSetItemActionId(dark, 53161)
        doCreatureSay(cid, "The teleport will disappear in "..monster.time.." second.", TALKTYPE_ORANGE_1)
        addEvent(removeTeleport, 60*1000) --one minute
    end
    return true
end
