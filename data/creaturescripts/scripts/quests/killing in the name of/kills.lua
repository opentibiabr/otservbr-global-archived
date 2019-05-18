function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	local targetName, startedTasks, taskId = target:getName():lower(), player:getStartedTasks()
	for i = 1, #startedTasks do
		taskId = startedTasks[i]
		if isInArray(tasks[taskId].creatures, targetName) then
			local killAmount = player:getStorageValue(KILLSSTORAGE_BASE + taskId)
			if killAmount < tasks[taskId].killsRequired then
				-- set max kills to adm
				if (player:getAccountType() >= ACCOUNT_TYPE_GOD) then
					player:setStorageValue(KILLSSTORAGE_BASE + taskId, tasks[taskId].killsRequired)
					return true
				end

				player:setStorageValue(KILLSSTORAGE_BASE + taskId, killAmount + 1)
			end
		end
	end
	return true
end