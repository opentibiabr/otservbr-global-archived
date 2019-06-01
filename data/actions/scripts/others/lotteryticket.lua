function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if math.random(50) == 1 then
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		player:say("Congratulations! You won a prize! Go to npc Addoner to take your addon", TALKTYPE_MONSTER_SAY)
		item:transform(5958)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:say("Sorry, but you drew a blank.", TALKTYPE_MONSTER_SAY)
		item:remove(1)
	end
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end
