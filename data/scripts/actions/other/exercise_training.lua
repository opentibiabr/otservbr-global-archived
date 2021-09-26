local exerciseTraining = Action()

function exerciseTraining.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playerId = player:getId()
	local targetId = target:getId()

	if target:isItem() and (isInArray(houseDummies, targetId) or isInArray(freeDummies, targetId)) then
		if onExerciseTraining[playerId] then
			player:sendTextMessage(MESSAGE_FAILURE, "You are already training.")
			return true
		end

		local playerPos = player:getPosition()
		if not exerciseWeaponsTable[item.itemid].allowFarUse and (playerPos:getDistance(target:getPosition()) > 1) then
			player:sendTextMessage(MESSAGE_FAILURE, "Get closer to the dummy.")
			return true
		end

		if not getTilePzInfo(playerPos) then
			player:sendTextMessage(MESSAGE_FAILURE, "You need to be in a protection zone.")
			return true
		end

		local targePos = target:getPosition()

		if isInArray(houseDummies, targetId) then
			local playersOnDummy = 0
			for _, playerTraining in pairs(onExerciseTraining) do
				if playerTraining.dummyPos == targePos then
					playersOnDummy = playersOnDummy + 1
				end
	
				if playersOnDummy == maxAllowedOnADummy then
					player:sendTextMessage(MESSAGE_FAILURE, "That exercise dummy is busy.")
					return true
				end
			end
		end

		local vocation = player:getVocation()
		onExerciseTraining[playerId] = {}
		onExerciseTraining[playerId].event = addEvent(exerciseEvent, vocation:getAttackSpeed(), playerId, targePos, item.itemid, targetId)
		onExerciseTraining[playerId].dummyPos = targePos
		player:sendTextMessage(MESSAGE_FAILURE, "You started training.")
		player:setTraining(true)
		return true
	end
	return false
end

for weaponId, weapon in pairs(exerciseWeaponsTable) do
	exerciseTraining:id(weaponId)
	if weapon.allowFarUse then
		exerciseTraining:allowFarUse(true)
	end
end

exerciseTraining:register()
