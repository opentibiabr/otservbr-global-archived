local present = Action()

function present.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.itemid == 12171) then
		if(itemEx.itemid == 12172) then
			if(getPlayerStorageValue(cid, Storage.RottinWoodQuest.Mission01) == 1) then
			doRemoveItem(item.uid, 1)
			doRemoveItem(itemEx.uid, 1)
			doPlayerAddItem(cid, 12173, 1)
		   end
	      end
	end
	return true
end

present:id(12171)
present:register()