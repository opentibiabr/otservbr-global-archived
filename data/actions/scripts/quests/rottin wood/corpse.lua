function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 13176) then
			if(getPlayerStorageValue(cid, 41600) == 5) and getPlayerStorageValue(cid, 41660) < 4 then
			doCreatureSay(cid, "You take no more gold than you actually need and release the merchant who makes away the very second you remove the ropes.", TALKTYPE_ORANGE_1)
			doPlayerAddItem(cid, 2148, 100)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 41660, getPlayerStorageValue(cid, 41660) + 1)
	      end
	end
	return true
end