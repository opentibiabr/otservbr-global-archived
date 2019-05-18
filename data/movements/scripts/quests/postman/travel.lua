local travel = {
	[7840] = {storage = Storage.postman.TravelCarlin, message = 'You visited Carlin. Now head to Edron.'},
	[7842] = {storage = Storage.postman.TravelEdron, message = 'You visited Edron. Now head to Venore.'},
	[7843] = {storage = Storage.postman.TravelVenore, message = 'You visited Venore. Now head to Cormaya.'},
	[7844] = {storage = Storage.postman.TravelCormaya, message = 'You visited Cormaya. Now head to the Kevin\'s Post Office.'},
}

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	local config = travel[item.actionid]
	local cStorage = config.storage
	if creature:getStorageValue(cStorage) ~= 1 then
		creature:setStorageValue(cStorage, 1)
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.message)
	end
	return true
end