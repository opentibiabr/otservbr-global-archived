local blessings = {1, 2, 3, 4, 5, 6, 7, 8}
function getCost(level)
    if level <= 30 then
        return 10000 * 3
    elseif level >= 120 then
        return 10000 * 8
    else
        return ((level - 20) * 200 * 7)
    end
end

local talk = TalkAction("!bless")

function talk.onSay(player, words, param)

	if player:hasBlessing(#blessings) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You already have all blessings.')
		return false
	end

	local cost = getCost(player:getLevel())
	if player:getMoney() >= cost then
		for i = 1, 8 do
			player:addBlessing(i, 1)
		end
		player:removeMoney(cost)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You have bought all blessings for ' .. cost .. ' gold coins!')
		player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You do not have '.. cost .. ' gold coins for buy all blessings.')
	end
	return true
end

talk:register()