function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if math.random(6) == 1 then
		fromPosition:sendMagicEffect(CONST_ME_POFF)
		item:transform(2115)

		player:addItem(ITEM_GOLD_COIN, 1)
		player:addAchievementProgress('Allowance Collector', 50)
	else
		fromPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
		player:addItem(ITEM_PLATINUM_COIN, 1)
	end
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end