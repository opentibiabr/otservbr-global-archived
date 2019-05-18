local BOSS_GLOBAL_STORAGE = 80512 -- to differentiate one from another boss
local TEMPO_SALA = 2 * 60 -- time to be kicked from the room (20 minutes)
local TEMPO_QUEST = 24 * 60 * 60 -- time to enter again on the boss room after killing one (24hours)
local STORAGE_TEMPO_ESPERAR = 25003 -- storage to count 24 hours
local BOSS = "Jaul" -- boss name 
local room = {fromx = 33526, tox = 33555, fromy = 31259, toy = 31280, z = 11} -- area boss room
local PLAYER_OUT = {x = 33559, y = 31283, z = 11} -- where will be kicked
local UID_TELEPORT = 8002 -- uid of entrance teleport

function onKill(cid, target)
    if getCreatureName(target) == BOSS then
        setPlayerStorageValue(cid, STORAGE_TEMPO_ESPERAR, os.time() + TEMPO_QUEST)
        doSetItemActionId(UID_TELEPORT, 8002)
        if(getGlobalStorageValue(BOSS_GLOBAL_STORAGE + 1000) < 1) then
            setGlobalStorageValue(BOSS_GLOBAL_STORAGE + 1000, 1)
            addEvent(removePlayerJaul, TEMPO_SALA * 1000)
        end
    end
    return true
end

-- REMOVE O JOGADOR SE EXCEDER O TEMPO
function removePlayerJaul()

for x = room.fromx, room.tox do
for y = room.fromy, room.toy do
for z = room.z, room.z do

creature = {x = x, y = y, z = z}
mob = getTopCreature(creature).uid

if isPlayer(mob) then
    doTeleportThing(mob, PLAYER_OUT)
    doSendMagicEffect(PLAYER_OUT, CONST_ME_TELEPORT)
end
addEvent(storageJaulDelay, 1000)
end
end
end
return TRUE
end

-- VOLTA O STORAGE AO NORMAL
function storageJaulDelay()
    setGlobalStorageValue(BOSS_GLOBAL_STORAGE + 1000, -1)
    doSetItemActionId(UID_TELEPORT, 8000)
end