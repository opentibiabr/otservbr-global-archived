local config = {
    [57602] = Position(33329, 31333, 9),
    [57699] = Position(33308, 31325, 8),
    [3255] = Position(3347, 31345, 8)
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if player == nil then
        return false
    end

    for actionId, destination in pairs(config) do
        if item.actionid == actionId then
            player:teleportTo(destination)
            destination:sendMagicEffect(CONST_ME_POFF)
            fromPosition:sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end
end