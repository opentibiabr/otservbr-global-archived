function onSay(player, words, param)
	local house = Tile(player:getPosition()):getHouse()
	if not house then
		player:sendCancelMessage("You are not inside a house.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if house:getOwnerGuid() ~= player:getGuid() then
		player:sendCancelMessage("You are not the owner of this house.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	house:setOwnerGuid(0)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have successfully left your house.")
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
end
