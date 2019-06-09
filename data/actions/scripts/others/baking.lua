local liquidContainers = {1775, 2005, 2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2015, 2023, 2031, 2032, 2033}
local millstones = {1381, 1382, 1383, 1384}
local dough = {6277, 8846}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2692 and isInArray(liquidContainers, target.itemid) then
		if target.type == 1 then
			item:transform(item.itemid, item.type - 1)
			player:addItem(2693, 1)
			target:transform(target.itemid, 0)
		elseif target.type == 6 then
			item:transform(item.itemid, item.type - 1)
			player:addItem(6277, 1)
			target:transform(target.itemid, 0)
		end
	elseif isInArray(dough, item.itemid) then
		if target.itemid == 1786 then
			item:transform(item.itemid + 1)
		elseif target.itemid == 6574 then
			item:transform(8846)
			target:remove()
		end
	elseif item.itemid == 2693 and target.itemid == 1786 then
		item:transform(2689)
		elseif item.itemid == 5467 and target.itemid == 2694 then
		item:transform(13939)
		target:remove()
	elseif isInArray(millstones, target.itemid) then
		item:transform(item.itemid, item.type - 1)
		player:addItem(2692, 1)
	else
		return false
	end
	return true
end
