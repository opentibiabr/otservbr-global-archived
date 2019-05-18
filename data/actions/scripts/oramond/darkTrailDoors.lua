function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(getPlayerStorageValue(cid, 10050) >= 14) then
			if(item.itemid == 22823) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 22824)
			end
		else
			 doPlayerSendCancel(cid, "You need of mission to enter here.")
		end
	return true
end