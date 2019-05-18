function onThink(interval, lastExecution)

local BOSS_GLOBAL_STORAGEhh = 25003 -- dont change
local BOSShh = "Jaul" -- boss name
local BOSS_POShh = {x = 33547, y = 31272, z = 11} -- spawn coord

    if getGlobalStorageValue(BOSS_GLOBAL_STORAGEhh) == -1 then
        Game.createMonster(BOSShh, BOSS_POShh)
            setGlobalStorageValue(BOSS_GLOBAL_STORAGEhh, 1)
        end
return TRUE
end