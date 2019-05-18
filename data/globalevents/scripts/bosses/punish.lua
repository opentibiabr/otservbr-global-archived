local BOSSnn = "Mr. Punish" -- boss name
local BOSS_POSnn = {x = 32763, y = 32243, z = 15} -- boss spawn coord   
local roomnn = {fromx = 32758, tox = 32778, fromy = 32236, toy = 32255, z = 15} -- boss room

function onTime()  


local bossnn = 0
for x = roomnn.fromx, roomnn.tox do
for y = roomnn.fromy, roomnn.toy do
for z = roomnn.z, roomnn.z do

creaturenn = {x = x, y = y, z = z}
mobnn = getTopCreature(creaturenn).uid

    if getCreatureName(mobnn) == BOSSnn then
        bossnn = 1
    end
end
end
end

if bossnn == 1 then
end

if bossnn == 0 then
 
        Game.createMonster(BOSSnn, BOSS_POSnn)
  
end

return true
end
