local talk = TalkAction("/kick")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	local target = Player(param)
	if not target then
		player:sendCancelMessage("Player not found.")
		return false
	end

	if target:getGroup():getAccess() then
		player:sendCancelMessage("You cannot kick this player.")
		return false
	end

	target:remove()
	return false
end

talk:separator(" ")
talk:register()
