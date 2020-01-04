local doors = Action()

function doors.onUse(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end

	if creature:getStorageValue(item.actionid) == -1 then
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		creature:teleportTo(fromPosition, true)
		return false
	end
	return true
end

doors:id(1643,1645,1660,1662,1675,1677,1690,1699,5105,5114,5132,5288,5290,5292,5294,5746,5748,6202,6204,6259,6261,6899,6908,7041,7722,7724,8260,8262,8362,8364,9362,9364,9559,9568,9866,9875,11142,11149,11238,17568,17577,17708,17717,18001,18010)
doors:register()