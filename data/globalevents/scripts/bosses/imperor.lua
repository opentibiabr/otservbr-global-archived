local BOSSff = "The Imperor" -- boss name
local BOSS_POSff = {x = 32907, y = 32215, z = 15} -- boss spawn coord   
local roomff = {fromx = 32899, tox = 32919, fromy = 32207, toy = 32221, z = 15} -- boss room  

function onTime()  


local bossff = 0
for x = roomff.fromx, roomff.tox do
for y = roomff.fromy, roomff.toy do
for z = roomff.z, roomff.z do

creatureff = {x = x, y = y, z = z}
mobff = getTopCreature(creatureff).uid

    if getCreatureName(mobff) == BOSSff then
        bossff = 1
    end
end
end
end

if bossff == 1 then
end

if bossff == 0 then
     
        Game.createMonster(BOSSff, BOSS_POSff)
  
end

return true
end
