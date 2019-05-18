local BOSSmm = "The Plasmother" -- boss name
local BOSS_POSmm = {x = 32845, y = 32332, z = 15} -- boss spawn coord   
local roommm = {fromx = 32836, tox = 32855, fromy = 32326, toy = 32345, z = 15} -- boss room  

function onTime()  


local bossmm = 0
for x = roommm.fromx, roommm.tox do
for y = roommm.fromy, roommm.toy do
for z = roommm.z, roommm.z do

creaturemm = {x = x, y = y, z = z}
mobmm = getTopCreature(creaturemm).uid

    if getCreatureName(mobmm) == BOSSmm then
        bossmm = 1
    end
end
end
end

if bossmm == 1 then
end

if bossmm == 0 then
        Game.createMonster(BOSSmm, BOSS_POSmm)
  
end

return true
end
