function onKill(player, target, lastHit)
    if not player:isPlayer() then
        return false
    end
    if target:getMaster() ~= nil then
        return false
    end
    -- Triggering bestiary kill
    bestiary:onKill(player, target)
    return true
end