local failDestination = Position(31919, 32596, 10)
local successDestination = Position(31916, 32607, 10)
local sacrificeTableItemId = 1485
local sacrifices = {
    [2787] = Tile(Position(31918, 32598, 10)), -- top left
    [2789] = Tile(Position(31918, 32599, 10)), -- bottom left
    [2796] = Tile(Position(31920, 32598, 10)), -- top right
    [2792] = Tile(Position(31920, 32599, 10))  -- bottom right
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local completedSacrifice = true
    for sacrificeItemId, sacrificeTile in pairs (sacrifices) do
        if sacrificeTile:getThing(1).itemId ~= sacrificeItemId then
            completedSacrifice = false
            break
        end
    end

    if not sacrifices then
        player:teleportTo(failDestination)
        position:sendMagicEffect(CONST_ME_ENERGYHIT)
        failDestination:sendMagicEffect(CONST_ME_ENERGYHIT)
        return true
    end

    for sacrificeItemId, sacrificeTile in pairs(sacrifices) do
        if sacrificeTile:getThing(1).itemId == sacrificeItemId then
            sacrificeTile:getThing(1):remove()
        end


        if sacrificeTile:getThing(0).itemId == sacrificeTableItemId then
            sacrificeTile:getThing(0):remove()
        end
    end

    player:teleportTo(successDestination)
    position:sendMagicEffect(CONST_ME_HITBYFIRE)
    successDestination:sendMagicEffect(CONST_ME_HITBYFIRE)
    return true
end
