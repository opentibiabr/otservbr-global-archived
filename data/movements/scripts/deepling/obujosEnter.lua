function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local TEMPO_RESTANTE = getPlayerStorageValue(cid, 22001) - os.time() -- dont change
local UID_TELEPORT = 8001 -- uid from teleport, dont change

    if item.uid == UID_TELEPORT and item.actionid == 8000 then
          if TEMPO_RESTANTE <= 0 then
            doTeleportThing(cid, {x = 33420, y = 31256, z = 11}) -- enter coord
            doSendMagicEffect({x = 33420, y = 31256, z = 11}, CONST_ME_TELEPORT)
          else
            doTeleportThing(cid, {x = 33440, y = 31249, z = 11}) -- exit coord
            doSendMagicEffect({x = 33440, y = 31249, z = 11}, CONST_ME_TELEPORT)
              doCreatureSay(cid, "Do You still need to wait " .. TEMPO_RESTANTE .. " seconds to enter.", TALKTYPE_ORANGE_1)
        end
        end
     
        if item.uid == UID_TELEPORT and item.actionid == 8001 then
                doTeleportThing(cid, {x = 33440, y = 31249, z = 11}) -- exit coord
        doSendMagicEffect({x = 33440, y = 31249, z = 11}, CONST_ME_TELEPORT)
        doCreatureSay(cid, "You cannot enter because have other team inside there.", TALKTYPE_ORANGE_1)
    end

    return true
end 