local timeOnline = 60 * 60 * 1000
local pointPlayers = {}

function addPremiumPoint(PID, playerIP)
    local player = Player(PID)
    if player then
        db.query("UPDATE accounts SET coins = coins + 1 WHERE id = '" ..player:getAccountId().. "';")
        player:getPosition():sendMagicEffect(CONST_ME_STUN)
        player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You have been online for an hour and have earned 1 Store coin.")
        addEvent(addPremiumPoint, 60 * 60 * 1000, PID, playerIP)
        return true
    else
        pointPlayers[playerIP] = nil
    end
end

function onLogin(player)
    local PID = player:getId()
    local playerIP = player:getIp()
  
    if not pointPlayers[player:getIp()]  then
        pointPlayers[playerIP] = true
        addEvent(addPremiumPoint, 60 * 60 * 1000, PID, playerIP)
    end
    return true
end