function onUse(player, item, fromPosition, itemEx, toPosition)
	DailyReward.loadDailyReward(player:getId(), 0)
	return true
end
