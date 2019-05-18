local BOSSaa = "Abyssador" -- boss name
local BOSS_POSaa = {x = 33087, y = 31908, z = 12} -- boss spawn   
local roomaa = {fromx = 33076, tox = 33100, fromy = 31898, toy = 31924, z = 12} -- boss room
local BOSS_GLOBAL_STORAGEaa = 80613 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONaa = 25104 -- dont change
local TEMPO_RESPaa = 10 * 60 -- em segundos -- respawn time

function onTime()
local bossaa = 0
for x = roomaa.fromx, roomaa.tox do
for y = roomaa.fromy, roomaa.toy do
for z = roomaa.z, roomaa.z do

creatureaa = {x = x, y = y, z = z}
mobaa = getTopCreature(creatureaa).uid

    if getCreatureName(mobaa) == BOSSaa then
        bossaa = 1
    end
end
end
end

if bossaa == 1 then
end

if bossaa == 0 then
        Game.createMonster(BOSSaa, BOSS_POSaa)
end

return true
end
