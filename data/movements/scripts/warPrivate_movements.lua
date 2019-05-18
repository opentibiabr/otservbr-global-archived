local tableCities = {
	[1] = warPrivate_city1,
	[2] = warPrivate_city2,
	[3] = warPrivate_city3,
	[4] = warPrivate_city4,
	[5] = warPrivate_city5
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(warPrivate_storage) > 0 then
	    player:setStorageValue(warPrivate_UE, 0)
		player:setStorageValue(44672, 0)
		player:setStorageValue(warPrivate_RUNES, 0)
		player:unregisterEvent("WarPrivateDeath")		
		if (tableCities[player:getStorageValue(warPrivate_storage)]) then
			local lib = tableCities[player:getStorageValue(warPrivate_storage)]			
			if (player:getStorageValue(warPrivate_Guild) == 1) then
				setGlobalStorageValue(lib.war.count1, getGlobalStorageValue(lib.war.count1) - 1)
				print("time 1: "..getGlobalStorageValue(lib.war.count1))
			elseif (player:getStorageValue(warPrivate_Guild) == 2) then
				setGlobalStorageValue(lib.war.count2, getGlobalStorageValue(lib.war.count2) - 1)
				print("time 2: "..getGlobalStorageValue(lib.war.count2))
			end
			player:setStorageValue(warPrivate_Guild, 0)
			player:setStorageValue(warPrivate_storage, 0)			
		end
		player:teleportTo(player:getTown():getTemplePosition())
	else 
		player:say('You no are in war.', TALKTYPE_MONSTER_SAY)
	end

	return true
end