local dawnportMaxLevel = CreatureEvent("DawnportMaxLevel")

function dawnportMaxLevel.onAdvance(player, skill, oldLevel, newLevel)
	local town = player:getTown()
	--Dawnport checks
	if town and town:getId() == TOWNS_LIST.DAWNPORT then
		-- Level vocation upgrade
		if skill == SKILL_LEVEL and newLevel == Dawnport.upgrade.level then
			local vocationId = Dawnport.upgrade.vocations[player:getVocation():getId()]
			if not vocationId then
				return true
			end
			player:setVocation(Vocation(vocationId))
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You may now choose your vocation and leave Dawnport. Talk to Oressa in the temple.")
		-- Level limit
		elseif skill == SKILL_LEVEL and newLevel == Dawnport.limit.level then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have reached the limit level and have to choose your vocation and leave Dawnport.")
			-- Adds the event that teleports the player to the temple in five minutes after reaching level 20
			addEvent(teleportToDawnportTemple, 5 * 60 * 1000, player:getId())
		-- Skills limit
		elseif skill ~= SKILL_LEVEL then
			-- Notify player reached skill limit
			if isSkillGrowthLimited(player, skill) then
				if skill == SKILL_MAGLEVEL then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot train your magic level any further. If you want to improve it further, you must go to the mainland.")
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot train your skill level any further. If you want to improve it further, you must go to the mainland.")
				end
			end
		end
	end
	
	return true
end

dawnportMaxLevel:register()
