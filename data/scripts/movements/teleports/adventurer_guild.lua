-- Adventurer guild moveevent for back to the temple.
-- You can also add other positions to use the function in another type of script, which has the same function as teleporting to the player's temple.
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local townId = player:getStorageValue(Storage.AdventurersGuild.Stone)
	local destination = townId ~= -1 and Town(townId):getTemplePosition() or player:getTown():getTemplePosition()

	player:setStorageValue(Storage.AdventurersGuild.Stone, -1)
	player:teleportTo(destination)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
	end
	
moveevent:position({x = 32209, y = 32292, z = 6})
moveevent:position({x = 32210, y = 32292, z = 6})
moveevent:register()