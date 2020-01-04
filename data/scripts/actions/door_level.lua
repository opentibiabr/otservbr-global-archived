local doors = Action()

function doors.onUse(player, item, position, fromPosition)
	if isPlayer() then
		return false
	end

	if player:getLevel() < item.actionid - 1000 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Only the worthy may pass.")
		player:teleportTo(fromPosition, true)
		return false
	end
	return true
end

doors:id(1647,1649,1665,1667,1679,1681,1688,1697,5103,5112,5121,6206,6208,6263,6265,6897,6906,7039,7048,7726,7728,8264,8266,9366,9368,9557,9566,9864,9873,11140,11147,11240,11247,11249,17566,17575,17706,17715,17999,18008)
doors:register()
