local talk = TalkAction("/openserver")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	Game.setGameState(GAME_STATE_NORMAL)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Server is now open.")
	return false
end

talk:separator(" ")
talk:register()
