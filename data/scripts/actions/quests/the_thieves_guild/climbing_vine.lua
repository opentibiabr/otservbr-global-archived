local config = {
	[11545] = Position(32336, 31813, 6), -- to the room
	[11546] = Position(32337, 31815, 7) -- outside the room
}

local theThievesVine = Action()
function theThievesVine.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end
	if player:isPzLocked() then
		player:sendTextMessage(MESSAGE_FAILURE, "You can not enter a protection zone after attacking another player.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
		player:teleportTo(targetPosition)

	return true
end

theThievesVine:aid(12501,11546)
theThievesVine:register()