function onSay(player, words, param)
	local spectators, anonymous = player:getSpectators()
	if spectators then
		local total = #spectators + anonymous
		local message = "Spectators: "
		message = message .. table.concat(spectators, ", ") .. " - and " .. anonymous .. " anonymous."
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, message)
	else
		player:sendCancelMessage("You're not casting your gameplay.")
	end
	return false
end
