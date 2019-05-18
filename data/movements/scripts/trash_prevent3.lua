local item_exceptions = {5792, 5793, 5794, 5795, 5796, 5797}

function onAddItem(item, tile, pos)
if not isInArray(item_exceptions, item.itemid) then
doTeleportThing(item.uid, {x = 32343, y = 32218, z = 7})
end 
return true
end