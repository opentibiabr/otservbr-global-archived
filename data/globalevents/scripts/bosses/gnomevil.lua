local BOSSdd = "Gnomevil" -- boss name
local BOSS_POSdd = {x = 33120, y = 31957, z = 11} -- boss spawn   
local roomdd = {fromx = 33102, tox = 33130, fromy = 31943, toy = 31970, z = 11} -- boss room
local BOSS_GLOBAL_STORAGEdd = 80612 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONdd = 25103 -- dont change
local TEMPO_RESPdd = 10 * 60 -- em segundos -- respawn time

function onTime()
--function onThink(interval, lastExecution)

local bossdd = 0
for x = roomdd.fromx, roomdd.tox do
for y = roomdd.fromy, roomdd.toy do
for z = roomdd.z, roomdd.z do

creaturedd = {x = x, y = y, z = z}
mobdd = getTopCreature(creaturedd).uid

    if getCreatureName(mobdd) == BOSSdd then
        bossdd = 1
    end
end
end
end

if bossdd == 1 then
end

if bossdd == 0 then
   -- if getGlobalStorageValue(BOSS_GLOBAL_STORAGE) == -1 and getGlobalStorageValue(BOSS_GLOBAL_STORAGE_SUMMON) == 1 then
     --   setGlobalStorageValue(BOSS_GLOBAL_STORAGE, 1)
        Game.createMonster(BOSSdd, BOSS_POSdd)
   -- end
end

return true
end
