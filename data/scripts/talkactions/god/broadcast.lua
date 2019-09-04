local talk = TalkAction("/b")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end
	
	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	print("> " .. player:getName() .. " broadcasted: \"" .. param .. "\".")
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendPrivateMessage(player, param, TALKTYPE_BROADCAST)
	end
	return false
end

talk:separator(" ")
talk:register()
