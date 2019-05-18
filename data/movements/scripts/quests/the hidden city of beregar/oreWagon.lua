function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.hiddenCityOfBeregar.OreWagon) ~= 1 then
		player:setStorageValue(Storage.hiddenCityOfBeregar.OreWagon, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found the entrance to the hidden city of Beregar and may now use the ore wagon.')
	end
	return true
end
