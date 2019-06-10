function clearDevourer()
	local upConer = {x = 32260, y = 31336, z = 14}       -- upLeftCorner
	local downConer = {x = 32283, y = 31360, z = 14}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k = upConer.z, downConer.z do
				local tile = Tile(i, j, k)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaDevourer4)
	stopEvent(areaDevourer5)
	stopEvent(areaDevourer6)
end

local function setStorageDevourer()
	local upConer = {x = 32260, y = 31336, z = 14}       -- upLeftCorner
	local downConer = {x = 32283, y = 31360, z = 14}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k= upConer.z, downConer.z do
				local tile = Tile(i, j, k)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								c:setStorageValue(60835, 1)
								c:setStorageValue(60814, 1)
								c:setStorageValue(60828, 1)
							end
						end
					end
				end
			end
		end
	end
end

local function setStorage(fromPos, toPos, storage)
	local upConer = fromPos       -- upLeftCorner
	local downConer = toPos     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k= upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								if c:getStorageValue(storage) < 1 then
									c:setStorageValue(storage, 1) -- Acess to boss Anomaly
								end
							end
						end
					end
				end
			end
		end
	end
end

function onDeath(creature)

	local bosses = {
		["Anomaly"] = {
			tile = {x = 32261, y = 31250, z = 14},
			actionId = 14325,
			fromPos = {x = 32258, y = 31237, z = 14},
			toPos = {x = 32284, y = 31262, z = 14},
			storage = 14326
		},
		["Rupture"] = {
			tile = {x = 32326, y = 31250, z = 14},
			actionId = 14325,
			fromPos = {x = 32324, y = 31239, z = 14},
			toPos = {x = 32347, y = 31263, z = 14},
			storage = 14327
		},
		["Realityquake"] = {
			tile = {x = 32199, y = 31248, z = 14},
			actionId = 14325,
			fromPos = {x = 32197, y = 31236, z = 14},
			toPos = {x = 32220, y = 31260, z = 14},
			storage = 14328
		},
		["Eradicator"] = {
			tile = {x = 32318, y = 31284, z = 14},
			actionId = 14325,
			fromPos = {x = 32297, y = 31272, z = 14},
			toPos = {x = 32321, y = 31296, z = 14},
			storage = 14330
		},
		["Outburst"] = {
			tile = {x = 32225, y = 31285, z = 14},
			actionId = 14325,
			fromPos = {x = 32223, y = 31273, z = 14},
			toPos = {x = 32246, y = 31297, z = 14},
			storage = 14332
		},
	}

	local bossName = bosses[creature:getName()]

	if bossName then
		local vortex = Tile(bossName.tile):getItemById(26139)
		if vortex then
			vortex:transform(26138)
			vortex:setActionId(bossName.actionId)
		end
		setStorage(bossName.fromPos, bossName.toPos, bossName.storage)
	elseif creature:getName() == "World Devourer" then
		local vortex = Tile({x = 32281, y = 31348, z = 14}):getItemById(26139)
		if vortex then
			vortex:transform(26138)
			vortex:setActionId(14354)
		end
		setStorageDevourer()
		clearDevourer()
	end

    return true
end
