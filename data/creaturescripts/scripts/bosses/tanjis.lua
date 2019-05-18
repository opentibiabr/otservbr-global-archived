local BOSS_GLOBAL_STORAGE = 80513 -- to differentiate one from another boss
local TEMPO_SALA = 20 * 60 -- time to be kicked from the room (20 minutes)
local TEMPO_QUEST = 24 * 60 * 60 -- time to enter again on the boss room after killing one (24hours)
local STORAGE_TEMPO_ESPERAR = 25002 -- storage to count 24 hours
local BOSS = "Tanjis" -- boss name 
local room = {fromx = 33632, tox = 33659, fromy = 31230, toy = 31257, z = 11} -- area boss room
local PLAYER_OUT = {x = 33645, y = 31263, z = 11} -- where will be kicked
local UID_TELEPORT = 8003 -- uid of entrance teleport

function onKill(cid, target)
    if getCreatureName(target) == BOSS then
        setPlayerStorageValue(cid, STORAGE_TEMPO_ESPERAR, os.time() + TEMPO_QUEST)
        doSetItemActionId(UID_TELEPORT, 8003)
        if(getGlobalStorageValue(BOSS_GLOBAL_STORAGE + 1000) < 1) then
            setGlobalStorageValue(BOSS_GLOBAL_STORAGE + 1000, 1)
            addEvent(removePlayerTanjis, TEMPO_SALA * 1000)
        end
    end
    return true
end

-- REMOVE O JOGADOR SE EXCEDER O TEMPO
function removePlayerTanjis()

for x = room.fromx, room.tox do
for y = room.fromy, room.toy do
for z = room.z, room.z do

creature = {x = x, y = y, z = z}
mob = getTopCreature(creature).uid

if isPlayer(mob) then
    doTeleportThing(mob, PLAYER_OUT)
    doSendMagicEffect(PLAYER_OUT, CONST_ME_TELEPORT)
end
addEvent(storageTanjisDelay, 1000)
end
end
end
return TRUE
end

-- VOLTA O STORAGE AO NORMAL
function storageTanjisDelay()
    setGlobalStorageValue(BOSS_GLOBAL_STORAGE + 1000, -1)
    doSetItemActionId(UID_TELEPORT, 8000)
end