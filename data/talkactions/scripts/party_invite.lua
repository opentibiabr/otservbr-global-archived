local function invitePlayer(leader, name)
    local invitee = Player(name)
    if not invitee then
        leader:sendCancelMessage('Player not found.')
        return false
    end

    local party = leader:getParty();
    party:addInvite(invitee)
    return false
end

function onSay(player, words, param)
    local party = player:getParty()

    if party then
        if party:getLeader() ~= player then
            player:sendCancelMessage("Only the party leader may invite members to the party.")
            return false
        end

        invitePlayer(player, param)
        return false
    end

    Party(player);
    invitePlayer(player, param);

    return false
end
