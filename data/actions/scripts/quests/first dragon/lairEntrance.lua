local config = {
	[24886] = {pos = Position(31994, 32391, 9)},
	[24887] = {pos = Position(33047, 32713, 3)}
}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local config = config[item.actionid]
	if not config then
		return true
	end
	if item.actionid == 24886 then
		if player:getStorageValue(Storage.FirstDragon.AccessCave) < 3 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are not worthy to enter in The First Dragon\'s Lair yet.')
			return true
		end
	end
	player:teleportTo(config.pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
