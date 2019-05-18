function onSay(player, words, param)
	
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
		
	if words == "/addach" then
		local p = param:split(",")

		if not p[2] then
			return player:sendCancelMessage("Insufficient parameters.")
		end

		local target = Player(p[1])
		local action = p[2]

		if not target then
			return player:sendCancelMessage("A player with that name is not online.")
		end

		if action == "all" then
			return target:addAllAchievements(true)
		end --add all achievements

		local ach = (isNumber(action) and tonumber(action) or action)
		target:addAchievement(ach, true)

		return true
	end		
	if words == "/removeach" then	
		local p = param:split(",")

		if not p[2] then
			return player:sendCancelMessage("Insufficient parameters.")
		end

		local target = Player(p[1])
		local action = p[2]

		if not target then
			return player:sendCancelMessage("A player with that name is not online.")
		end

		if action == "all" then
			return target:removeAllAchievements()
		
			end --remove all achievements

		local ach = (isNumber(action) and tonumber(action) or action)
		target:removeAchievement(ach)
		return true
	end
	return false
end
