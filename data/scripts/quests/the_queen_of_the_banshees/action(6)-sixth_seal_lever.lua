local UniqueTable = {
	[30013] = Position(32309, 31975, 13),
	[30014] = Position(32309, 31976, 13),
	[30015] = Position(32311, 31975, 13),
	[30016] = Position(32311, 31976, 13),
	[30017] = Position(32313, 31975, 13),
	[30018] = Position(32313, 31976, 13)
}

local sixthSeal = Action()

function sixthSeal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local lever = UniqueTable[item.uid]
	if not lever then
		return false
	end

	local tile = Tile(lever)
	if tile then
		if item.itemid == 1945 then
			local campfire = tile:getItemById(1423)
			if campfire then
				campfire:transform(1421)
			end
			item:transform(1946)
			return true
		elseif item.itemid == 1946 then
			local campfire = tile:getItemById(1421)
			if campfire then
				campfire:transform(1423)
			end
			item:transform(1945)
			return true
		end
	end
	return false
end

for index, value in pairs(UniqueTable) do
	sixthSeal:uid(index)
end

sixthSeal:register()
