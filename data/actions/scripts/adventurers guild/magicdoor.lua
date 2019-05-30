function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local playerPos, destination = player:getPosition()
	if item.itemid == 19598 then
		player:setStorageValue(Storage.AdventurersGuild.MagicDoor, 1)
		destination = Position(32292, 32293, 7)

	else

		if player:getStorageValue(Storage.AdventurersGuild.MagicDoor) == 1 then
			player:setStorageValue(Storage.AdventurersGuild.MagicDoor, -1)
			destination = Position(32199, 32309, 7)

		elseif playerPos.x == 32293 then
			destination = Position(32297, 32293, 7)

		else
			destination = Position(32292, 32293, 7)
		end
	end

	player:teleportTo(destination)
	playerPos:sendMagicEffect(CONST_ME_TELEPORT)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end
