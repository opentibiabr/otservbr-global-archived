 local shadowNexusPosition = Position(33115, 31702, 12)
local effectPositions = {
    Position(33113, 31702, 12),
    Position(33116, 31702, 12)
}

local function nexusMessage(player, message)
    local spectators = Game.getSpectators(shadowNexusPosition, false, true, 3, 3)
    for i = 1, #spectators do
        player:say(message, TALKTYPE_MONSTER_YELL, false, spectators, shadowNexusPosition)
    end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:teleportTo(Position(32319, 32248, 9))
   
    then
    end

    return true
end 
