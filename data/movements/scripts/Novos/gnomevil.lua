local destination = {
    [3140] = {newPos = Position(32996, 31922, 10), storageTime = 124627, time = 1},
    [3141] = {newPos = Position(33011, 31943, 11), storageTime = 524628, time = (1 * 60)},
    [3142] = {newPos = Position(32989, 31909, 12), storageTime = 924629, time = 1}
}

local BUSS = "Gnomevil" -- boss name
local BUSS_POS = {x = 33643, y = 32756, z = 11} -- boss spawn
local ruum = {fromx = 33629, tox = 33657, fromy = 32746, toy = 32767, z = 11} -- boss room

function AddBuss()

local buss = 0
for x = ruum.fromx, ruum.tox do
for y = ruum.fromy, ruum.toy do
for z = ruum.z, ruum.z do

creaturu = {x = x, y = y, z = z}
mobu = getTopCreature(creaturu).uid

    if getCreatureName(mobu) == BUSS then
        buss = 1
    end
end
end
end

if buss == 1 then
end

if buss == 0 then
        Game.createMonster(BUSS, BUSS_POS)	
end

return true
end


function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return true end

    local v = destination[item.uid]

    if player:getStorageValue(v.storageTime) < os.time() then
        player:teleportTo(v.newPos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        player:setStorageValue(v.storageTime, os.time + (v.time ~= nil and v.time or 1) * 60)
		addEvent(AddBuss, 1 * 100)
    else
        player:teleportTo(fromPosition)
    end
    return true
end