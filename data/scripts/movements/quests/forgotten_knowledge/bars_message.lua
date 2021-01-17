local barsMessage = MoveEvent()

function barsMessage.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player or player:getStorageValue(Storage.ForgottenKnowledge.BarsEntrance) == 1 then
		return true
	end

	if player:getItemById(26402, true) or player:getItemById(26406, true) then
		player:setStorageValue(Storage.ForgottenKnowledge.BarsEntrance, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'As you enter the room you hear a moaning sound. It seemingly comes from an old desk nearby.')
	end
	return true
end

barsMessage:type("stepin")
barsMessage:aid(25024)
barsMessage:register()
