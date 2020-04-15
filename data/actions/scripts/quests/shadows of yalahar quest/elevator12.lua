local config = {
	[35605] = Position(32550, 31250, 11),
	[35606] = Position(32550, 31250, 9)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end
	if player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 18 and player:getStorageValue(Storage.ShadownofYalahar.Questline) == 39 then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(targetPosition)
		targetPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

