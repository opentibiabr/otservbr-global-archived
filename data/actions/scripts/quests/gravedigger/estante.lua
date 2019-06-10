function onUse(cid, item, fromPosition, itemEx, toPosition)

if(getPlayerStorageValue(cid, 157443) < 1) then
	setPlayerStorageValue(cid, 157443, 1)
	doPlayerAddItem(cid,21474,1)
	doCreatureSay(cid, "You have found a crumpled paper.", TALKTYPE_ORANGE_1)
	else

	doCreatureSay(cid, "You've picked up here.", TALKTYPE_ORANGE_1)
return true
end

end
