-- <action itemid="23574" script="other/glooth_bag.lua"/>
local items = {
	{6569, 15},
	{2687, 20},
	{2688, 10},
	{2675, 10},
	{2674, 5},
	{6501, 1},
	{6502, 1},
	{6503, 1},
	{6505, 1},
	{6388, 1},
	{6511, 1},
	{6506, 1},
	{6507, 1}
}

local function tableContains(table, value)
	for i = 1, #table do
		if (table[i] == value) then
			return true
		end
	end

	return false
end

local function getItemsReward()
	local tmpTable = {count = 0}
	local newTable = {}
	while (tmpTable.count < 7) do
		local itemId = items[math.random(#items)][1]
		if (not tableContains(tmpTable, itemId)) then
			tmpTable[#tmpTable+1] = itemId
			tmpTable.count = tmpTable.count + 1
		end
	end

	for i = 1, #items do
		for j = 1, #tmpTable do
			if (tmpTable[j] == items[i][1]) then
				newTable[#newTable+1] = items[i]
			end
		end
	end

	return newTable
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rand = math.random(1, 100)
	local itemsSort = getItemsReward()

	for i = 1, #itemsSort do
		player:addItem(itemsSort[i][1], itemsSort[i][2])
	end

	item:remove(1)

	return true
end
