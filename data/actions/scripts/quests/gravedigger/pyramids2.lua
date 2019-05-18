function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray({4663, 4664, 4665, 4666, 4667}, target.actionid) then
		return false
	end

	if player:getStorageValue(Storage.GravediggerOfDrefia.Mission61) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission62) < 1 then
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission62, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
	elseif player:getStorageValue(Storage.GravediggerOfDrefia.Mission62) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission63) < 1 then
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission63, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
	elseif player:getStorageValue(Storage.GravediggerOfDrefia.Mission63) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission64) < 1 then
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission64, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
	elseif player:getStorageValue(Storage.GravediggerOfDrefia.Mission64) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission65) < 1 then
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission65, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
	elseif player:getStorageValue(Storage.GravediggerOfDrefia.Mission65) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission66) < 1 then
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission66, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		else player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Mission already completed here!')
	end
	return true
end