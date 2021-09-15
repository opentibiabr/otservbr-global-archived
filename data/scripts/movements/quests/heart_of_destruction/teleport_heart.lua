local vortex = {
	[120] = Position(32149, 31359, 14), -- Charger TP 1
	[126] = Position(32092, 31330, 12), -- Charger Exit
	[5952] = Position(32104, 31329, 12), -- Anomaly Exit
	[348] = Position(32216, 31380, 14), -- Main Room
	[3241] = Position(32159, 31329, 11), -- Main Room Exit
	[7372] = Position(32078, 31320, 13), -- Cracklers Exit
	[7932] = Position(32088, 31321, 13), -- Rupture Exit
	[8020] = Position(32230, 31358, 11), -- Realityquake Exit
	[8764] = Position(32225, 31347, 11), -- Unstable Sparks Exit
	[8777] = Position(32218, 31375, 14), -- Eradicator Exit (Main Room)
	[9172] = Position(32208, 31372, 14), -- Outburst Exit (Main Room)
	[9238] = Position(32214, 31376, 14), -- World Devourer Exit (Main Room)
	[10184] = Position(32112, 31375, 14), -- World Devourer (Reward Room)
}

local accessVortex = {
	-- Anomaly enter
	[135] = {
		position = Position(32246, 31252, 14),
		storage = 14320,
		storageTime = 120
	},
	-- Rupture enter
	[7870] = {
		position = Position(32305, 31249, 14),
		storage = 14322,
		storageTime = 135
	},
	-- Realityquake enter
	[7934] = {
		position = Position(32181, 31240, 14),
		storage = 14324,
		storageTime = 348
	},
}

local finalBosses = {
	-- Eradicator enter
	[8117] = {
		position = Position(32336, 31293, 14),
		storage1 = 402,
		storage2 = 907,
		storage3 = 2783,
		storageTime = 2784
	},
	-- Outburst enter
	[9113] = {
		position = Position(32204, 31290, 14),
		storage1 = 402,
		storage2 = 907,
		storage3 = 2783,
		storageTime = 2952
	}
}

local teleportHeart = MoveEvent()

function teleportHeart.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local normalVortex = vortex[item.actionid]
	local bossVortex = accessVortex[item.actionid]
	local uBosses = finalBosses[item.actionid]
	if normalVortex then
		player:teleportTo(normalVortex)
	elseif bossVortex then
		if player:getStorageValue(bossVortex.storage) >= 1 then
			if player:getStorageValue(bossVortex.storageTime) < os.time() then
				player:teleportTo(bossVortex.position)
			else
				player:teleportTo(fromPosition)
				player:sendTextMessage(19, "It's too early for you to endure this challenge again.")
			end
		else
			player:teleportTo(fromPosition)
			player:sendTextMessage(19, "You don't have access to this portal.")
		end
	elseif uBosses then
		if player:getStorageValue(uBosses.storage1) >= 1
		and player:getStorageValue(uBosses.storage2) >= 1
		and player:getStorageValue(uBosses.storage3) >= 1 then
			if player:getStorageValue(uBosses.storageTime) < os.time() then
				player:teleportTo(uBosses.position)
			else
				player:teleportTo(fromPosition)
				player:sendTextMessage(19, "It's too early for you to endure this challenge again.")
			end
		else
			player:teleportTo(fromPosition)
			player:sendTextMessage(19, "You don't have access to this portal.")
		end
	elseif item.actionid == 14351 then
		if player:getStorageValue(11698) >= 1
		and player:getStorageValue(2957) >= 1 then
			if player:getStorageValue(9152) < os.time() then
				player:teleportTo(Position(32272, 31384, 14))
			else
				player:teleportTo(fromPosition)
				player:sendTextMessage(19, "It's too early for you to endure this challenge again.")
			end
		else
			player:teleportTo(fromPosition)
			player:sendTextMessage(19, "You don't have access to this portal.")
		end
	elseif item.actionid == 14353 then -- Remove storages from mini bosses
		player:teleportTo(Position(32214, 31376, 14))
		player:setStorageValue(3208, -1)
		player:setStorageValue(3506, -1)
		player:setStorageValue(4846, -1)
		player:unregisterEvent("DevourerStorage")
	end
	return true
end

teleportHeart:type("stepin")

for index, value in pairs(vortex) do
	teleportHeart:aid(index)
end

teleportHeart:register()
