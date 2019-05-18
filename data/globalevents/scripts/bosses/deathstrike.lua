local BOSScc = "Deathstrike" -- boss name
local BOSS_POScc = {x = 33114, y = 31970, z = 10} -- boss spawn  
local roomcc = {fromx = 33089, tox = 33128, fromy = 31946, toy = 31984, z = 10} -- boss room
local BOSS_GLOBAL_STORAGEcc = 80614 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONcc = 25105 -- dont change
local TEMPO_RESPcc = 10 * 60 -- em segundos -- respawn time

function onTime()
--function onThink(interval, lastExecution)

local bosscc = 0
for x = roomcc.fromx, roomcc.tox do
for y = roomcc.fromy, roomcc.toy do
for z = roomcc.z, roomcc.z do

creaturecc = {x = x, y = y, z = z}
mobcc = getTopCreature(creaturecc).uid

    if getCreatureName(mobcc) == BOSScc then
        bosscc = 1
    end
end
end
end

if bosscc == 1 then
end

if bosscc == 0 then
   -- if getGlobalStorageValue(BOSS_GLOBAL_STORAGE) == -1 and getGlobalStorageValue(BOSS_GLOBAL_STORAGE_SUMMON) == 1 then
     --   setGlobalStorageValue(BOSS_GLOBAL_STORAGE, 1)
        Game.createMonster(BOSScc, BOSS_POScc)
   -- end
end

return true
end
