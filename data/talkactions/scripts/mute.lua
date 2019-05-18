function onSay(cid, words, param)

	local CHANNEL_HELP = 7
	local player = Player(cid)
	local storage = 456112

	if words == "/mute" then
		local mute = param:split(",")

		if mute[1] == nil or mute[1] == " " then
			player:sendCancelMessage("Invalid player specified.")
			return false
		end

		if mute[2] == nil or mute[2] == " " then
			player:sendCancelMessage("Invalid time specified.")
			return false
		end

		local target = Player(mute[1])
		local time = tonumber(mute[2])
		local condition = Condition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT)
		condition:setParameter(CONDITION_PARAM_SUBID, CHANNEL_HELP)
		condition:setParameter(CONDITION_PARAM_TICKS, time*60*1000)

		if player:getAccountType() < ACCOUNT_TYPE_TUTOR then
			return false
		end

		if target == nil then
			player:sendCancelMessage("A player with that name is not online.")
			return false
		end

		if target:getAccountType() >= ACCOUNT_TYPE_TUTOR then
			player:sendCancelMessage("Only player can be mutated")
			return false
		end

		target:addCondition(condition)
		sendChannelMessage(CHANNEL_HELP, TALKTYPE_CHANNEL_R1, target:getName() .. " has been muted for using Help Channel inappropriately.")
		target:setStorageValue(storage, 1)
		return false
	end

	if words == "/unmute" then

		local remove = Player(param)

		if player:getAccountType() < ACCOUNT_TYPE_TUTOR then
			return false
		end

		if remove == nil then
			player:sendCancelMessage("A player with that name is not online.")
			return false
		end

		if remove:getAccountType() >= ACCOUNT_TYPE_TUTOR then
			return false
		end

		if remove:getStorageValue(storage) == 1 then
			remove:removeCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, CHANNEL_HELP)
			sendChannelMessage(CHANNEL_HELP, TALKTYPE_CHANNEL_R1, remove:getName() .. " has been unmuted by " .. player:getName() .. ".")
			remove:setStorageValue(storage, -1)
		else
			player:sendCancelMessage("A player " .. remove:getName() .. "is not mutated")
		end
	end

	return false
end