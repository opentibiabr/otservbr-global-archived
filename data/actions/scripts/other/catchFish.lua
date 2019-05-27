function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if target.itemid ~= 5554 then
		return false
	end

	if math.random(10) ~= 1 then
		player:say("The golden fish escaped.", TALKTYPE_MONSTER_SAY)
		return true
	end
	player:setStorageValue(Storage.Exaust.Time, os.time())
	player:say("You catch a golden fish in the bowl.", TALKTYPE_MONSTER_SAY)
	item:transform(5929)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end
