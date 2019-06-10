local stairsPosition = Position(32225, 32282, 9)

function onStepIn(creature, item, position, fromPosition)
	-- create stairs
	if item.actionid == 50025 then
		local stairsItem = Tile(stairsPosition):getItemById(424)
		if stairsItem then
			stairsItem:transform(8280)
		end
		item:transform(425)

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
	local stairsItem = Tile(stairsPosition):getItemById(8280)
	if stairsItem then
		stairsItem:transform(424)
	end

	item:transform(426)
	return true
end
