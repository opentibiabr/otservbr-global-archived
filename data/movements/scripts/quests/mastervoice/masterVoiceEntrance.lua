dofile('data/lib/quests/theirMastersVoice.lua')

function onStepIn(creature, item, toPosition, fromPosition)
    return Entrance_onStepIn(creature, item, toPosition, fromPosition)
end
