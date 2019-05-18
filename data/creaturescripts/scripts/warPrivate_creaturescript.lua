local tableCities = {
	[1] = warPrivate_city1,
	[2] = warPrivate_city2,
	[3] = warPrivate_city3,
	[4] = warPrivate_city4,
	[5] = warPrivate_city5
}

function onLogin(cid)
	local player = Player(cid)

	if player:getStorageValue(warPrivate_storage) > 0 then
		player:setStorageValue(warPrivate_UE, 0)
		player:setStorageValue(warPrivate_RUNES, 0)
		player:unregisterEvent("WarPrivateDeath")
		player:setStorageValue(44672, 0)
		player:teleportTo(player:getTown():getTemplePosition())
		if (tableCities[player:getStorageValue(warPrivate_storage)]) then
			local lib = tableCities[player:getStorageValue(warPrivate_storage)]
			if (player:getStorageValue(warPrivate_Guild) == 1) then
				setGlobalStorageValue(lib.war.count1, getGlobalStorageValue(lib.war.count1) - 1)
			elseif (player:getStorageValue(warPrivate_Guild) == 2) then
				setGlobalStorageValue(lib.war.count2, getGlobalStorageValue(lib.war.count2) - 1)
			end
			player:setStorageValue(warPrivate_Guild, 0)
			player:setStorageValue(warPrivate_storage, 0)
		end
	end

	return true
end

function onLogout(cid)
	local player = Player(cid)

	if player:getStorageValue(warPrivate_storage) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can not logout now.")
		return false
	end

	return true
end

function onDeath(cid, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local player = Player(cid)

	if player:getStorageValue(warPrivate_storage) > 0 then
	    player:setStorageValue(warPrivate_UE, 0)
		player:setStorageValue(44672, 0)
		player:setStorageValue(warPrivate_RUNES, 0)
		player:unregisterEvent("WarPrivateDeath")
		player:teleportTo(player:getTown():getTemplePosition())
		if (tableCities[player:getStorageValue(warPrivate_storage)]) then
			local lib = tableCities[player:getStorageValue(warPrivate_storage)]
			if (player:getStorageValue(warPrivate_Guild) == 1) then
				setGlobalStorageValue(lib.war.count1, getGlobalStorageValue(lib.war.count1) - 1)
			elseif (player:getStorageValue(warPrivate_Guild) == 2) then
				setGlobalStorageValue(lib.war.count2, getGlobalStorageValue(lib.war.count2) - 1)
			end
			player:setStorageValue(warPrivate_Guild, 0)
			player:setStorageValue(warPrivate_storage, 0)
		end
	end

	return true
end