function onKill(creature, target)
    if not target:isPlayer() then
        return true
    end

    local creatureId = creature.uid
    for id, damage in pairs(target:getDamageMap()) do
        local tmpPlayer = Player(id)
        if tmpPlayer and id ~= creatureId then
            tmpPlayer:setStorageValue(STORAGE_ASSISTS, math.max(0, tmpPlayer:getStorageValue(STORAGE_ASSISTS)) + 1)
        end
    end
    return true
end
