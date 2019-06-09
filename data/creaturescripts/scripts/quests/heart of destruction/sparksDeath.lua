local function setStorage()
	local upConer = {x = 32126, y = 31296, z = 14}       -- upLeftCorner
	local downConer = {x = 32162, y = 31322, z = 14}     -- downRightCorner

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
								if c:getStorageValue(14324) < 1 then
									c:setStorageValue(14324, 1) -- Acess to boss Realityquake
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

	if unstableSparksCount < 10 then
		unstableSparksCount = unstableSparksCount + 1
		creature:say("The death of the spark charges the room!", TALKTYPE_MONSTER_YELL, isInGhostMode, pid, {x = 32143, y = 31308, z = 14})
	elseif unstableSparksCount == 10 then
		setStorage()
		creature:say("The room is fully charged up! You are permeated with its power and can venture deeper into the heart of destruction now!", TALKTYPE_MONSTER_YELL, isInGhostMode, pid, {x = 32143, y = 31308, z = 14})
		unstableSparksCount = 11
	end

	return true
end
