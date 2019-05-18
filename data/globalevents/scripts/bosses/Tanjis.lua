local BOSSoo = "Tanjis" -- boss name
local BOSS_POSoo = {x = 33647, y = 31242, z = 11} -- boss spawn coord 
local roomoo = {fromx = 33632, tox = 33659, fromy = 31231, toy = 31256, z = 11} -- boss room
local BOSS_GLOBAL_STORAGEoo = 80511 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONoo = 25002 -- dont change
local TEMPO_RESPoo = 10 * 60 -- em segundos -- respawn time

function onTime()
--function onThink(interval, lastExecution)

local bossoo = 0
for x = roomoo.fromx, roomoo.tox do
for y = roomoo.fromy, roomoo.toy do
for z = roomoo.z, roomoo.z do

creatureoo = {x = x, y = y, z = z}
moboo = getTopCreature(creatureoo).uid

    if getCreatureName(moboo) == BOSSoo then
        bossoo = 1
    end
end
end
end

if bossoo == 1 then
end

if bossoo == 0 then
 --- addEvent(Game.broadcastMessage, 150, 'Beware! Tanjis!', MESSAGE_EVENT_ADVANCE)
  local monster2 = 
  Game.createMonster("Tanjis", Position(33647, 31242, 11), true, true)
 monster2:setReward(true)
end

return true
end

