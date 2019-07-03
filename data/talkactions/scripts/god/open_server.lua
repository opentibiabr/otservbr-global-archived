function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	Game.setGameState(GAME_STATE_NORMAL)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Server is now open.")
	return false
end
