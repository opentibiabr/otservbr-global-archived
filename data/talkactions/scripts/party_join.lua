function onSay(player, words, param)
    if player:getParty() ~= nil then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You are already in a party.")
        return false
    end

    local leader = Player(param)
    if not leader then
        player:sendCancelMessage('Player not found.')
        return false
    end

    local party = leader:getParty()
    if party == nil or party:getLeader() ~= leader then
        player:sendCancelMessage('You have not been invited to ' .. leader:getName() .. '\'s party.');
        return false
    end

    if not isInArray(party:getInvitees(), player) then
        player:sendCancelMessage('You have not been invited to ' .. leader:getName() .. '\'s party.');
        return false
    end

    party:addMember(player)
    return false
end
