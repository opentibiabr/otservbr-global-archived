local necrometer = MoveEvent()

function necrometer.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(Storage.DarkTrails.Mission04) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A strange ritual has taken place here. Report about it to the Gloot Brothers.')
		player:setStorageValue(Storage.DarkTrails.Mission05, 1) -- start mission 5
	elseif player:getStorageValue(Storage.DarkTrails.Mission10) >= 1 and player:getItemCount(23495) > 0 then
		player:teleportTo(Position(33419, 32106, 10))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The necrometer reveals a hidden passage!')
	end
	return true
end

necrometer:aid(9745)
necrometer:register()
