if not globalStorageTable then
	globalStorageTable = {}
end

function getGlobalStorageValueDB(key)
    local resultId = db.storeQuery("SELECT `value` FROM `global_storage` WHERE `key` = " .. key)
    if resultId ~= false then
        local val = result.getString(resultId, "value")
        result.free(resultId)
        return val
    end
    return -1
end
 
function setGlobalStorageValueDB(key, value)
    db.query("INSERT INTO `global_storage` (`key`, `value`) VALUES (".. key ..", ".. value ..") ON DUPLICATE KEY UPDATE `value` = ".. value)
end

function Game.broadcastMessage(message, messageType)
	if messageType == nil then
		messageType = MESSAGE_STATUS_WARNING
	end

	local players = Game.getPlayers()
	for i = 1, #players do
		players[i]:sendTextMessage(messageType, message)
	end
end

function Game.convertIpToString(ip)
	local band = bit.band
	local rshift = bit.rshift
	return string.format("%d.%d.%d.%d",
		band(ip, 0xFF),
		band(rshift(ip, 8), 0xFF),
		band(rshift(ip, 16), 0xFF),
		rshift(ip, 24)
	)
end

function Game.getHouseByPlayerGUID(playerGUID)
	local houses, house = Game.getHouses()
	for i = 1, #houses do
		house = houses[i]
		if house:getOwnerGuid() == playerGUID then
			return house
		end
	end
	return nil
end

function Game.getPlayersByAccountNumber(accountNumber)
	local result = {}
	local players, player = Game.getPlayers()
	for i = 1, #players do
		player = players[i]
		if player:getAccountId() == accountNumber then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getPlayersByIPAddress(ip, mask)
	if not mask then mask = 0xFFFFFFFF end
	local masked = bit.band(ip, mask)
	local result = {}
	local players, player = Game.getPlayers()
	for i = 1, #players do
		player = players[i]
		if bit.band(player:getIp(), mask) == masked then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getSkillType(weaponType)
	if weaponType == WEAPON_CLUB then
		return SKILL_CLUB
	elseif weaponType == WEAPON_SWORD then
		return SKILL_SWORD
	elseif weaponType == WEAPON_AXE then
		return SKILL_AXE
	elseif weaponType == WEAPON_DISTANCE then
		return SKILL_DISTANCE
	elseif weaponType == WEAPON_SHIELD then
		return SKILL_SHIELD
	end
	return SKILL_FIST
end

function Game.getStorageValue(key)
	return globalStorageTable[key] or -1
end

function Game.getReverseDirection(direction)
	if direction == DIRECTION_WEST then
		return DIRECTION_EAST
	elseif direction == DIRECTION_EAST then
		return DIRECTION_WEST
	elseif direction == DIRECTION_NORTH then
		return DIRECTION_SOUTH
	elseif direction == DIRECTION_SOUTH then
		return DIRECTION_NORTH
	elseif direction == DIRECTION_NORTHWEST then
		return DIRECTION_SOUTHEAST
	elseif direction == DIRECTION_NORTHEAST then
		return DIRECTION_SOUTHWEST
	elseif direction == DIRECTION_SOUTHWEST then
		return DIRECTION_NORTHEAST
	elseif direction == DIRECTION_SOUTHEAST then
		return DIRECTION_NORTHWEST
	end
	return DIRECTION_NORTH
end

function Game.setStorageValue(key, value)
	globalStorageTable[key] = value
end
