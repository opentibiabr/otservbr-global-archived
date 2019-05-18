local BOSSbb = "Countess Sorrow" -- boss name
local BOSS_POSbb = {x = 32802, y = 32333, z = 15} -- boss spawn coord   
local roombb = {fromx = 32799, tox = 32813, fromy = 32331, toy = 32343, z = 15} -- boss room

function onTime()   


local bossbb = 0
for x = roombb.fromx, roombb.tox do
for y = roombb.fromy, roombb.toy do
for z = roombb.z, roombb.z do

creaturebb = {x = x, y = y, z = z}
mobbb = getTopCreature(creaturebb).uid

    if getCreatureName(mobbb) == BOSSbb then
        bossbb = 1
    end
end
end
end

if bossbb == 1 then
end

if bossbb == 0 then
         Game.createMonster(BOSSbb, BOSS_POSbb)
  
end

return true
end
