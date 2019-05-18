local storages = {
	[8816] = Storage.PitsOfInferno.ShortcutHub,
	[8817] = Storage.PitsOfInferno.ShortcutLevers
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local cutoffStorage = storages[item.actionid]
	if player:getStorageValue(cutoffStorage) ~= 1 then
		player:setStorageValue(cutoffStorage, 1)
	end
	return true
end
