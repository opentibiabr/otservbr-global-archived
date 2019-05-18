function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 53161) then
setPlayerStorageValue(cid, 10050, 20)
setPlayerStorageValue(cid, 30058, 1)
setPlayerStorageValue(cid, 30059, 0)
	end
	return true
end
