-- Register in XML as "Servant_Death"

dofile('data/lib/quests/their_masters_voice.lua')

function onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
    return Servant_onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
end
