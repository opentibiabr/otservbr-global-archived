local BOSSnnp = "Dracola" -- boss name
local BOSS_POSnnp = {x = 32837, y = 32309, z = 15} -- boss spawn coord   
local roomnnp = {fromx = 32830, tox = 32848, fromy = 32304, toy = 32316, z = 15} -- boss room 

function onTime()  


local bossnnp = 0
for x = roomnnp.fromx, roomnnp.tox do
for y = roomnnp.fromy, roomnnp.toy do
for z = roomnnp.z, roomnnp.z do

creaturennp = {x = x, y = y, z = z}
mobnnp = getTopCreature(creaturennp).uid

    if getCreatureName(mobnnp) == BOSSnnp then
        bossnnp = 1
    end
end
end
end

if bossnnp == 1 then
end

if bossnnp == 0 then
      
        Game.createMonster(BOSSnnp, BOSS_POSnnp)
  
end

return true
end
