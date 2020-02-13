local tpgolem = MoveEvent()

function tpgolem.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.TheSecretLibrary.Peacock) == 2 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"teleported")
		player:teleportTo(Position(32880, 32828, 11))
	end
	
	return true
end

tpgolem:aid(26698)
tpgolem:register()