local scimitarPos = Position(33205, 32537, 6)

local function removeScimitar(position)
	local scimitarItem = Tile(position):getItemById(5858)
	if scimitarItem then
		scimitarItem:remove()
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid ~= 13029 then
		return false
	end

	if player:getStorageValue(Storage.TibiaTales.AritosTask) >= 0 then
		player:removeItem(2419, 1)
		Game.createItem(5858, 1, scimitarPos)
		addEvent(removeScimitar, 1 * 60 * 1000, scimitarPos)
	end
	return true
end
