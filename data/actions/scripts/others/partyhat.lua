function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local slot = player:getSlotItem(CONST_SLOT_HEAD)
	if slot and item.uid == slot.uid then
		player:addAchievementProgress('Party Animal', 200)
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		player:setStorageValue(Storage.Exaust.Time, os.time())
		return true
	end

	return false
end
