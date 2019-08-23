local stairsPosition = Position(32225, 32282, 9)

function onStepIn(creature, item, position, fromPosition)
	-- create stairs
	if item.actionid == 50025 then
		local stairsItem = Tile(stairsPosition):getItemById(429)
		if stairsItem then
			stairsItem:transform(7767)
		end
		item:transform(430)

	-- created portal (by lever)
	elseif item.actionid == 50026 then
		local player = creature:getPlayer()
		if not player then
			return true
		end

		player:teleportTo(Position(32225, 32274, 10))
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

	--stairs disappear if stepout stone tile
function onStepOut(creature, item, position, fromPosition)
	local stairsItem = Tile(stairsPosition):getItemById(7767)
	if stairsItem then
		stairsItem:transform(429)
	end

	item:transform(431)
	return true
end
