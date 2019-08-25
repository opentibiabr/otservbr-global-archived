function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(10050) == 4 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A strange ritual has taken place here. Report about it to the Gloot Brothers.')
		player:setStorageValue(20054, 1)
		player:setStorageValue(20055, 0)
		player:setStorageValue(10050, 5)
	elseif player:getStorageValue(10050) >= 10 and player:getItemCount(23495) > 0 then
		player:teleportTo(Position(33419, 32106, 10))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The necrometer reveals a hidden passage!')
	end
	
	return true
end
