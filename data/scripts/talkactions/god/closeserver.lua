local talk = TalkAction("/closeserver")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	if param == "shutdown" then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	else
		Game.setGameState(GAME_STATE_CLOSED)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Server is now closed.")
	end
	return false
end

talk:separator(" ")
talk:register()
