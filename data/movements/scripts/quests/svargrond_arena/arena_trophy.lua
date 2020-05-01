function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local arenaId = item.uid - 23200
	if arenaId >= player:getStorageValue(Storage.SvargrondArena.Arena) then
		return true
	end

	local storage = ARENA[arenaId].reward.trophyStorage
	if player:getStorageValue(storage) ~= 1 then
		local rewardPosition = player:getPosition()
		rewardPosition.y = rewardPosition.y - 1

		local rewardItem = Game.createItem(ARENA[arenaId].reward.trophy, 1, rewardPosition)
		if rewardItem then
			rewardItem:setDescription(string.format(ARENA[arenaId].reward.desc, player:getName()))
		end

		player:setStorageValue(storage, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	end
	return true
end
