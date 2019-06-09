function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getPosition() == Position(32870, 32723, 15) then
			player:teleportTo(Position(32870, 32724, 14))
			player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The mechanism takes you back in time.')
			return true
		end
		
	if player:getPosition() == Position(32870, 32723, 14) then
		if player:getExhaustion(Storage.ForgottenKnowledge.TimeGuardianTimer) <= 0 then
			player:teleportTo(Position(32870, 32724, 15))
			player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The mechanism takes you back in time.')
			return true
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait a while before travel in time!")
			return true
		end
	else
		return false
	end
end
