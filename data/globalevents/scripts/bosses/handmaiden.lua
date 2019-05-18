local BOSSee = "The Handmaiden" -- boss name
local BOSS_POSee = {x = 32785, y = 32290, z = 15} -- boss spawn coord   
local roomee = {fromx = 32779, tox = 32791, fromy = 32284, toy = 32297, z = 15} -- boss room 

function onTime()  


local bossee = 0
for x = roomee.fromx, roomee.tox do
for y = roomee.fromy, roomee.toy do
for z = roomee.z, roomee.z do

creatureee = {x = x, y = y, z = z}
mobee = getTopCreature(creatureee).uid

    if getCreatureName(mobee) == BOSSee then
        bossee = 1
    end
end
end
end

if bossee == 1 then
end

if bossee == 0 then
   
        Game.createMonster(BOSSee, BOSS_POSee)
  
end

return true
end
