local BOSSjj = "Massacre" -- boss name
local BOSS_POSjj = {x = 32876, y = 32270, z = 15} -- boss spawn coord  
local roomjj = {fromx = 32864, tox = 32884, fromy = 32264, toy = 32283, z = 15} -- boss room

function onTime()


local bossjj = 0
for x = roomjj.fromx, roomjj.tox do
for y = roomjj.fromy, roomjj.toy do
for z = roomjj.z, roomjj.z do

creaturejj = {x = x, y = y, z = z}
mobjj = getTopCreature(creaturejj).uid

    if getCreatureName(mobjj) == BOSSjj then
        bossjj = 1
    end
end
end
end

if bossjj == 1 then
end

if bossjj == 0 then
 

        Game.createMonster(BOSSjj, BOSS_POSjj)
  
end

return true
end
