local bananaQuest = Action()

function bananaQuest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.Rookgaard.BananaPalm) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The banana palm is empty.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a banana.')
		player:addItem(2676, 1)
		player:setStorageValue(Storage.Rookgaard.BananaPalm, 1)
	end
	return true
end

bananaQuest:uid(6016)
bananaQuest:register()
