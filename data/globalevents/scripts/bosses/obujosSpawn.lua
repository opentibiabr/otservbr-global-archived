function onThink(interval, lastExecution)

local BOSS_GLOBAL_STORAGEll = 25001 -- dont change
local BOSSll = "Obujos" -- boss name
local BOSS_POSll = {x = 33434, y = 31262, z = 11} -- spawn coord

    if getGlobalStorageValue(BOSS_GLOBAL_STORAGEll) == -1 then
        Game.createMonster(BOSSll, BOSS_POSll)
            setGlobalStorageValue(BOSS_GLOBAL_STORAGEll, 1)
        end
return TRUE
end