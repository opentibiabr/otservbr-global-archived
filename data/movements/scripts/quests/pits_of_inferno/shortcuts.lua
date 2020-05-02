local setting = {
	[8816] = Storage.PitsOfInferno.ShortcutHub,
	[8817] = Storage.PitsOfInferno.ShortcutLevers
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local storage = setting[item.actionid]
	if player:getStorageValue(storage) ~= 1 then
		player:setStorageValue(storage, 1)
	end
	return true
end
