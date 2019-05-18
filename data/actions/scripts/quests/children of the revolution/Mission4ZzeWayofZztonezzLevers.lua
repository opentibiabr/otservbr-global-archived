function onUse(cid, item, fromPosition, itemEx, toPosition)

	if(item.itemid == 11106) then
			if(itemEx.actionid == 8013) then
			if(getPlayerStorageValue(cid, 12300) < 17) then			
			setPlayerStorageValue(cid, 12300, 17)
			setPlayerStorageValue(cid, 12305, 5)
			doCreatureSay(cid, "You found the right combination. You should report to Zalamon.", TALKTYPE_ORANGE_1)
			doTransformItem(itemEx.uid, itemEx.itemid == 10044 and 10045 or 10044, 1)
			Item(item.uid):remove(1)
			end
		end
	end
	return true
end