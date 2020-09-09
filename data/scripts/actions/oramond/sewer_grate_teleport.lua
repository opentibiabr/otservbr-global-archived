local upFloorIds = {23668}

local sewergrateTeleport = Action()

function sewergrateTeleport.onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(upFloorIds, item.itemid) == TRUE then
		fromPosition.x = fromPosition.x + 1
		fromPosition.z = fromPosition.z - 2
	end
	doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end

sewergrateTeleport:id(23668)
sewergrateTeleport:register()
