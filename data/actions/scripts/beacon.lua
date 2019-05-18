local ITEM_IDS = {
[22614] = 22615,
[22615] = 22614
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
if(not ITEM_IDS[item.itemid]) then
return false
end


doTransformItem(item.uid, ITEM_IDS[item.itemid])
doDecayItem(item.uid)

return true
end
