function canJoin(player)
	return player:getClient().version < 1200
end

function onSpeak()
	return false
end
