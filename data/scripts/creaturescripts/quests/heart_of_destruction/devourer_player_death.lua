local devourerStorage = CreatureEvent("DevourerStorage")
function devourerStorage.onDeath(player)
	player:setStorageValue(3208, -1)
	player:setStorageValue(3506, -1)
	player:setStorageValue(4846, -1)
	player:unregisterEvent("DevourerStorage")
	return true
end
devourerStorage:register()
