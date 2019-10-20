function onSay(player, words, param)
	if not player:hasFlag(PlayerFlag_CanBroadcast) then
		return true
	end

	print("> " .. player:getName() .. " broadcasted: \"" .. param .. "\".")
	local players = Game.getPlayers()
	for i = 1, #players do
		players[i]:sendPrivateMessage(player, param, TALKTYPE_BROADCAST)
	end
	return false
end
