local liquidContainers = {2524, 2873, 2874, 2875, 2876, 2877, 2879, 2880, 2881, 2882, 2885, 2893, 2901, 2902, 2903}
local millstones = {1943, 1944, 1945, 1946}
local dough = {6276, 8018}
local oven = {2535, 2537, 2539, 2541 }

local baking = Action()

function baking.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 3603 and isInArray(liquidContainers, target.itemid) then
		if target.type == 1 then
			item:transform(item.itemid, item.type - 1)
			player:addItem(3604, 1)
			target:transform(target.itemid, 0)
		elseif target.type == 6 then
			item:transform(item.itemid, item.type - 1)
			player:addItem(6276, 1)
			target:transform(target.itemid, 0)
		end
	elseif isInArray(dough, item.itemid) then
		if target.itemid == 2535 then
			item:transform(item.itemid + 1)
		elseif target.itemid == 6574 then
			item:transform(8018)
			target:remove()
		end
	elseif isInArray(oven, target.itemid) then
		item:transform(item.itemid, item.type - 1)
		player:addItem(3600, 1)
		elseif item.itemid == 5466 and target.itemid == 3605 then
		item:transform(12802)
		target:remove()
	elseif isInArray(millstones, target.itemid) then
		item:transform(item.itemid, item.type - 1)
		player:addItem(3603, 1)
	else
		return false
	end
	return true
end

baking:id(3603, 3604, 3605, 6276, 8018)
baking:register()
