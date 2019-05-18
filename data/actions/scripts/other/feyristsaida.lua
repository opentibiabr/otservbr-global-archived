function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if item.actionid == 24999 then
		player:teleportTo(Position(32972, 32227, 7))
		player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
		player:setStorageValue(Storage.Exaust.tempo, os.time())
		return true
	end
	
	if item.actionid == 25000 then
		player:teleportTo(Position(32192, 31419, 2))
		player:getPosition():sendMagicEffect(CONST_ME_ICEATTACK)
		player:setStorageValue(Storage.Exaust.tempo, os.time())
		return true
	end
	if item.actionid == 25001 then
		player:teleportTo(Position(33059, 32716, 5))
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
		player:setStorageValue(Storage.Exaust.tempo, os.time())
		return true
	end
	if item.actionid == 25002 then
		player:teleportTo(Position(32911, 32336, 15))
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		player:setStorageValue(Storage.Exaust.tempo, os.time())
		return true
	end	
	end
	
