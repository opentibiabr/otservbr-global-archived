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
		return true
	end

	local tile = Tile(lever)
	local campfire = tile:getItemById(item.itemid == 1945 and 1423 or 1421)
	if campfire then
		campfire:transform(item.itemid == 1945 and 1421 or 1423)
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end

for index, value in pairs(UniqueTable) do
	sixthSeal:uid(index)
end

sixthSeal:register()
