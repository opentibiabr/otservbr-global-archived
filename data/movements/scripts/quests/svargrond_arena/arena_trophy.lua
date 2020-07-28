function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local arenaId = ARENA[item.uid]
	if not arenaId then
		return true
	end

	local storage = arenaId.reward.trophyStorage
	if player:getStorageValue(storage) == 1 then
		return true
	end

	local rewardPosition = player:getPosition()
	rewardPosition.y = rewardPosition.y - 1

	local rewardItem = Game.createItem(arenaId.reward.trophy, 1, rewardPosition)
	if rewardItem then
		rewardItem:setDescription(string.format(arenaId.reward.desc, player:getName()))
	end

	player:setStorageValue(storage, 1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	return true
end
