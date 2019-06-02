function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if item.itemid == 25425 then
		player:addItem('ultimate mana potion', 10)
		item:transform(25426)
		item:decay()
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Magical sparks whirl around the keg as you open the spigot and you fill ten empty vials with mana fluid.')
		return true
	elseif item.itemid == 25426 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are tired of the last use of the mana keg, rest your arms for a moment.')
	end
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end
