function onThink(interval, lastExecution)

local BOSS_GLOBAL_STORAGEpp = 25002 -- dont change
local BOSSpp = "Tanjis" -- boss name
local BOSS_POSpp = {x = 33647, y = 31242, z = 11} -- spawn coord

    if getGlobalStorageValue(BOSS_GLOBAL_STORAGEpp) == -1 then
        Game.createMonster(BOSSpp, BOSS_POSpp)
            setGlobalStorageValue(BOSS_GLOBAL_STORAGEpp, 1)
        end
return TRUE
end