local UniqueTable = {
	[30010] = {
		position = Position(32259, 31891, 10),
		revert = true
	},
	[30011] = {
		position = Position(32259, 31890, 10),
		revert = true
	},
	[30012] = {
		position = Position(32266, 31860, 11),
		revert = true
	}
}

local leverFirstSeal = Action()

function leverFirstSeal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local wall = UniqueTable[item.uid]
	if not wall then
		return true
	end

	if item.uid == 30012 then
		if item.itemid == 1946 then
			return false
		end
	end

	if item.itemid == 1945 then
		Position.removeItem(wall.position, 1498)
		if wall.revert == true then
			addEvent(Position.revertItem, 100 * 1000, wall.position, 1498)
		end
		item:transform(1946)
	elseif item.itemid == 1946 then
		if Position.createItem(wall.position, 1498) then
			stopEvent(Position.revertItem)
			item:transform(1945)
			return true
		end
		item:transform(1945)
	end
	return true
end

for index, value in pairs(UniqueTable) do
	leverFirstSeal:uid(index)
end

leverFirstSeal:register()
