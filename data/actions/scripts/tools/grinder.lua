function onUse(player, item, frompos, item2, topos)
	if(item2.itemid == 23942)then
		return onGrindItem(player, item, frompos, item2, topos)
	end
end
