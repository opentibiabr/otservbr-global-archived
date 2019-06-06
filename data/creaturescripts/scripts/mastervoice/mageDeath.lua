dofile('data/lib/quests/theirMastersVoice.lua')

function onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
    return Mage_onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
end
