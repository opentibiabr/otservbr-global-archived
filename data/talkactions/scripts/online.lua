function onSay(player, words, param)
	local hasAccess = player:getGroup():getAccess()
	local players = Game.getPlayers()
	local playerCount = Game.getPlayerCount()--+69 -- spoofing

	player:sendTextMessage(MESSAGE_INFO_DESCR, playerCount .. " players online.")

	--local i = 0
--	local msg = ""
	--for k, targetPlayer in ipairs(players) do
	--	if hasAccess or not targetPlayer:isInGhostMode() then
	--		if i > 0 then
	--	--		msg = msg .. ", "
	--		end
	--		msg = msg .. targetPlayer:getName() .. " [" .. targetPlayer:getLevel() .. "]"
	--		i = i + 1
	--	end

	--	if i == 10 then
			--if k == playerCount then
		--		msg = msg .. "."
		--	else
		--		msg = msg .. ","
		--	end
		--	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, msg)
		----	msg = ""
		--	i = 0
		--end
	--end

	--if i > 0 then
	--	msg = msg .. "."
	--	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, msg)
	--end
	return false
end
