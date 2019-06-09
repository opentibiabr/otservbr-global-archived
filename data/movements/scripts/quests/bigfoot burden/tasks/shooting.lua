local function doCreateDummy(cid, position, storv)
	local player = Player(cid)
	if not player then
		return true
	end

	local tile = Tile(position)
	if tile then
		local thing = tile:getTopVisibleThing()
		if thing and isInArray({18226, 18227}, thing.itemid) then
			thing:remove()
		end
	end

	if Game.getStorageValue(storv) == 0 then -- only spawn the target if the storage corresponds that someone is there shooting
		return true
	end

	position:sendMagicEffect(CONST_ME_POFF)
	Game.createItem(math.random(18226, 18227), 1, position)
	addEvent(doCreateDummy, 4 * 1000, cid, position, storv)
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.BigfootBurden.QuestLine) ~= 13 then
		player:teleportTo(fromPosition)
		return true
	end

	Game.setStorageValue(position.x, 1) -- set global storage for the script to know if someone is there shooting
	local playerPosition = player:getPosition()
	position:sendMagicEffect(CONST_ME_POFF)
	doCreateDummy(player.uid, Position(playerPosition.x, playerPosition.y - 5, 10), position.x)
	return true
end

function onStepOut(creature, item, position, fromPosition)
	Game.setStorageValue(fromPosition.x, 0)

	-- remove the target if it remains there
	thingpos = Position(position.x, position.y - 5, position.z)
	local tile = Tile(thingpos)
	if tile then
		local thing = tile:getTopVisibleThing()
		if thing and isInArray({18226, 18227}, thing.itemid) then
			thing:remove()
		end
	end
end
