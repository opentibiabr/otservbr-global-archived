function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 13158) then
		if(itemEx.itemid == 13159) then
			if(getPlayerStorageValue(cid, 41600) == 1) then
			doRemoveItem(item.uid, 1)
			doRemoveItem(itemEx.uid, 1)
			doPlayerAddItem(cid, 13160, 1)
		   end
	      end
	end
	return true
end
