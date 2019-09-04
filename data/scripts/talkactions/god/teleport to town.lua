talk = TalkAction("/town")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local town = Town(param) or Town(tonumber(param))
	if town then
		player:teleportTo(town:getTemplePosition())
	else
		player:sendCancelMessage("Town not found.")
	end
	return false
end

talk:separator(" ")
talk:register()
