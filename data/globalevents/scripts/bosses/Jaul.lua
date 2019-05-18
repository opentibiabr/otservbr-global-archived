local BOSSgg = "Jaul" -- boss name
local BOSS_POSgg = {x = 33547, y = 31272, z = 11} -- boss spawn coord  
local roomgg = {fromx = 33526, tox = 33555, fromy = 31258, toy = 31280, z = 11} -- boss room
local BOSS_GLOBAL_STORAGEgg = 80512 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONgg = 25003 -- dont change
local TEMPO_RESPgg = 10 * 60 -- em segundos -- respawn time

function onTime()

local bossgg = 0
for x = roomgg.fromx, roomgg.tox do
for y = roomgg.fromy, roomgg.toy do
for z = roomgg.z, roomgg.z do

creaturegg = {x = x, y = y, z = z}
mobgg = getTopCreature(creaturegg).uid

    if getCreatureName(mobgg) == BOSSgg then
        bossgg = 1
    end
end
end
end

if bossgg == 1 then
end

if bossgg == 0 then
---addEvent(Game.broadcastMessage, 150, 'Beware! Jaul!', MESSAGE_EVENT_ADVANCE)
 local monster = 
   Game.createMonster("Jaul", Position(33547, 31272, 11), true, true)
 monster:setReward(true)
end
return true
end


