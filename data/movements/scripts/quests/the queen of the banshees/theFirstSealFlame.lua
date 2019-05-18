function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.FirstSeal) < 1 then
		player:setStorageValue(Storage.QueenOfBansheesQuest.FirstSeal, 1)
		player:teleportTo(Position(32266, 31849, 15), false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Game.createMonster('Ghost', Position(32276, 31902, 13), false, true)
		Game.createMonster('Ghost', Position(32274, 31902, 13), false, true)
		Game.createMonster('Demon Skeleton', Position(32276, 31904, 13), false, true)
	else
		player:teleportTo(fromPosition, true)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
