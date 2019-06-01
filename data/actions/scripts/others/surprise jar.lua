local config = {
	[32014] = { -- surprise jar
		2158, 25377, 25172, 2153, 30888
	}
}

function onUse(player, item, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local jar = config[item.itemid]
	if not jar then
		return false
	end

	local gift = jar[math.random(1, #jar)]

	item:transform(gift)
	item:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end
