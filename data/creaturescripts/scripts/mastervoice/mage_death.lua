-- Register in XML as "Mage_Death"

dofile('data/lib/quests/their_masters_voice.lua')

function onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
    return Mage_onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
end
