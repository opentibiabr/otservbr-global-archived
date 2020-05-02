local mcCheck = TalkAction("/mc")

function mcCheck.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Multiclient Check List:")
	local ipList = {}
	local players = Game.getPlayers()
	for i = 1, #players do
		local tmpPlayer = players[i]
		local ip = tmpPlayer:getIp()
		if ip ~= 0 then
			local list = ipList[ip]
			if not list then
				ipList[ip] = {}
				list = ipList[ip]
			end
			list[#list + 1] = tmpPlayer
		end
	end

	for ip, list in pairs(ipList) do
		local listLength = #list
		if listLength > 1 then
			local tmpPlayer = list[1]
			local message = ("%s: %s [%d]"):format(Game.convertIpToString(ip), tmpPlayer:getName(), tmpPlayer:getLevel())
			for i = 2, listLength do
				tmpPlayer = list[i]
				message = ("%s, %s [%d]"):format(message, tmpPlayer:getName(), tmpPlayer:getLevel())
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message .. ".")
		end
	end
	return false
end

mcCheck:separator(" ")
mcCheck:register()
