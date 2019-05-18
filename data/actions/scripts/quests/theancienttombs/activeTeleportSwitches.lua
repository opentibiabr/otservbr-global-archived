local config = {
	[50242] = GlobalStorage.TheAncientTombs.ThalasSwitchesGlobalStorage,
	[50243] = GlobalStorage.TheAncientTombs.DiprathSwitchesGlobalStorage,
	[50244] = GlobalStorage.TheAncientTombs.AshmunrahSwitchesGlobalStorage
}

local function resetScript(position, storage)
	local item = Tile(position):getItemById(1946)
	if item then
		item:transform(1945)
	end

	Game.setStorageValue(storage, Game.getStorageValue(storage) - 1)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local storage = config[item.actionid]
	if not storage then
		return true
	end

	if item.itemid ~= 1945 then
		return false
	end

	Game.setStorageValue(storage, Game.getStorageValue(storage) + 1)
	item:transform(1946)
	addEvent(resetScript, 20 * 60 * 1000, toPosition, storage)
	return true
end