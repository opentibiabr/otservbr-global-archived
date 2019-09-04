local talk = TalkAction("/a")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local steps = tonumber(param)
	if not steps then
		return false
	end

	local position = player:getPosition()
	position:getNextPosition(player:getDirection(), steps)

	position = player:getClosestFreePosition(position, false)
	if position.x == 0 then
		player:sendCancelMessage("You cannot teleport there.")
		return false
	end

	player:teleportTo(position)
	return false
end

talk:separator(" ")
talk:register()
