dofile('data/lib/arenapvp.lua')

function onStatsChange(cid, attacker, type, combat, value)

    if isPlayer(cid) and getPlayerStorageValue(cid, arena.pstorage) == 1 and type == STATSCHANGE_HEALTHLOSS then
        if value >= getCreatureHealth(cid) then
            local killer = attacker
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureAddMana(cid, getCreatureMaxMana(cid))
            doCreatureAddHealth(killer, getCreatureMaxHealth(killer))
            doCreatureAddMana(killer, getCreatureMaxMana(killer))
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "[Arena]: you lost the duel!")
            doPlayerSendTextMessage(killer, MESSAGE_STATUS_WARNING, "[Arena]: you win the duel!")
            doTeleportThing(cid, arena.exitPos)
            doTeleportThing(killer, arena.exitPos)
            doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
            doSendMagicEffect(getThingPos(killer), CONST_ME_POFF)
            setPlayerStorageValue(cid, arena.pstorage, -1)
            setPlayerStorageValue(killer, arena.pstorage, -1)
            setGlobalStorageValue(arena.gstorage, -1)
            return false
        end
    end
    return true
end

function onLogin(cid)

	registerCreatureEvent(cid, "ArenaPVP")

	return true
end
