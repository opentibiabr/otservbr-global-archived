local talk = TalkAction("/t")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	player:teleportTo(player:getTown():getTemplePosition())
	return false
end
