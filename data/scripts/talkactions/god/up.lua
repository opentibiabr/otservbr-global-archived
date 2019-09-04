local talk = TalkAction("/up")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	local position = player:getPosition()
	position.z = position.z - 1
	player:teleportTo(position)
	return false
end

talk:separator(" ")
talk:register()
