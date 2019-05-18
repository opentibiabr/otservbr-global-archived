--[[
File: ctf.lua (actions)
 
<action fromaid="1050" toaid="1051" script="ctf.lua" />
]]
 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local flag = captureTheFlag.getFlag(item)
    if flag then
        local info = captureTheFlag.players[player:getName()]
        if info.team ~= flag.team then
            flag:remove()
			item:remove()
            flag:setHolder(player)
            info.flag = flag
 
            for name, _ in pairs(captureTheFlag.players) do
                local player = Player(name)
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, info.name .. ' has captured the flag for team ' .. (info.team == 1 and 'A' or 'B') .. '!')
            end
        end
    end
    return true
end