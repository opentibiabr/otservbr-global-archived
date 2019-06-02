function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	item:transform(2786)
	item:decay()
	Game.createItem(2677, 3, fromPosition)
	player:setStorageValue(Storage.Exaust.Time, os.time())
	player:addAchievementProgress('Bluebarian', 500)
	return true
end
