dofile('data/lib/quests/their_masters_voice.lua')

function onStepIn(creature, item, toPosition, fromPosition)
    return Entrance_onStepIn(creature, item, toPosition, fromPosition)
end
