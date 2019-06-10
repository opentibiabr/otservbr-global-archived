function onModalWindow(player, modalWindowId, buttonId, choiceId)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'you are exaust.')
	return true
    end

    if(modalWindowId ~= 4597 or buttonId == 2) then
        return false
    end

    local positions = {
        [1] = {x = 1116, y = 1094, z = 7}, -- Treiners
        [2] = {x = 990, y = 1033, z = 6}, -- NPCs Beach
		[3] = {x = 32209, y = 32300, z = 6}, -- Adventurer Island
		[4] = {x = 1062, y = 1030, z = 7}, -- Event Room
		[5] = {x = 31880, y = 33083, z = 7} -- Trade Insland

    }

    player:teleportTo(positions[choiceId])
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(Storage.Exaust.tempo, os.time())
    return true
end
