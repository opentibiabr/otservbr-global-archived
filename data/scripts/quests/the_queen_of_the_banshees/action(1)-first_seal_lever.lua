local UniqueTable = {
	[30010] = {
		position = {x = 32259, y = 31891, z = 10},
		revert = true
	},
	[30011] = {
		position = {x = 32259, y = 31890, z = 10},
		revert = true
	},
	[30012] = {
		position = {x = 32266, y = 31860, z = 11},
		revert = true
	}
}

local leverFirstSeal = Action()

function leverFirstSeal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local wall = UniqueTable[item.uid]
	if not wall then
		return false
	end

	if item.uid == 30012 then
		if item.itemid == 32400 then
			Position.removeItem(wall.position, 1498)
			Position.createItem(wall.position, 369)
			item:transform(1946)
			return true
		elseif item.itemid == 1946 then
			Position.removeItem(wall.position, 369)
			Position.createItem(wall.position, 1498)
			item:transform(32400)
			return true
		end
		return false
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
