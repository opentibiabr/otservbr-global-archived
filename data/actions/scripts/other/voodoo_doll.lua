function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if target.itemid ~= 1 or target.type ~= THING_TYPE_PLAYER then
		return false
	end

	local text = ""
	if math.random(100) <= 5 then
		text = "You concentrate on your victim and hit the needle in the doll."
		player:addAchievement("Dark Voodoo Priest")
		toPosition:sendMagicEffect(CONST_ME_DRAWBLOOD, player)
	else
		text = "You concentrate on your victim, hit the needle in the doll.......but nothing happens."
	end

	player:say(text, TALKTYPE_MONSTER_SAY, false, player)
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	return true
end
