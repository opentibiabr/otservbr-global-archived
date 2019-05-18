local ladderPosition = Position(32854, 32321, 11)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local ladderItem = Tile(ladderPosition):getItemById(5543)
	if not ladderItem then
		Game.createItem(5543, 1, ladderPosition)
		player:say('You hear a rumbling from far away.', TALKTYPE_MONSTER_SAY, false, player)
	end
	return true
end

function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local ladderItem = Tile(ladderPosition):getItemById(5543)
	if ladderItem then
		ladderItem:remove()
		player:say('You hear a rumbling from far away.', TALKTYPE_MONSTER_SAY, false, player)
	end
	return true
end
