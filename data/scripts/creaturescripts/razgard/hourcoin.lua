local timeOnline =  60 * 60 * 1000
local pointPlayers = {}

local function addPremiumPoint(PID, playerIP)
    local player = Player(PID)
    if player then
        local maxCoins = player:getStorageValue(MAX_STORAGE_HOURCOIN)
        db.query("UPDATE accounts SET coins = coins + 1 WHERE id = '" ..player:getAccountId().. "';")
        player:getPosition():sendMagicEffect(CONST_ME_PINK_BEAM)
        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
        player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You have been online for an hour and have earned 1 Coin.")
        player:setStorageValue(MAX_STORAGE_HOURCOIN, maxCoins+1)
        if maxCoins+1 <= MAX_COUNT_HOURCOIN then
            addEvent(addPremiumPoint, timeOnline, PID, playerIP)
        end
        return true
    else
        pointPlayers[playerIP] = nil
    end
end

local hourCoin = CreatureEvent("HourCoin")
function hourCoin.onLogin(player)

    if player:getLevel() < 20 then
        return true
    end

    local PID = player:getId()
    local playerIP = player:getIp()
    local geyDay = tonumber(os.date('%d', os.time()))

    if player:getStorageValue(GET_DAY_STORAGE_HOURCOIN) < geyDay then
        if pointPlayers[player:getIp()] then
            pointPlayers[playerIP] = nil
        end
        player:setStorageValue(GET_DAY_STORAGE_HOURCOIN, geyDay)
        player:setStorageValue(MAX_STORAGE_HOURCOIN, 1)
    end

    if player:getStorageValue(MAX_STORAGE_HOURCOIN) <= MAX_COUNT_HOURCOIN then
        if not pointPlayers[player:getIp()] then
            pointPlayers[playerIP] = true
            addEvent(addPremiumPoint, timeOnline, PID, playerIP)
        end
    end
    return true
end

hourCoin:register()
