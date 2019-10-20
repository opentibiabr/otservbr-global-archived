function sendToPlayerLuaCallResult(player, ...)
    local n = select('#', ...)
    local result = setmetatable({ ... }, {
        __len = function()
            return n
        end,
    })

    local t = {}
    for i = 2, #result do
        local v = tostring(result[i])
        if v:len() > 0 then
            table.insert(t, v)
        end
    end

    if #t > 0 then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, table.concat(t, ', '))
    end
end

function onSay(player, words, param)
    if not player:getGroup():getAccess() then
        return false
    end

    if player:getAccountType() < ACCOUNT_TYPE_GOD then
        return false
    end

    sendToPlayerLuaCallResult(player, pcall(load(
'local cid = ' .. player:getId() .. ' ' ..
        'local player = Player(cid) ' ..
        'local pos = player:getPosition() ' ..
        'local position = pos ' ..
        param
    )))

    return false
end
