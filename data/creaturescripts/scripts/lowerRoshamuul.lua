local t = {
    ["Frazzlemaw"] = ROSHAMUUL_KILLED_FRAZZLEMAWS,
    ["Silencer"] = ROSHAMUUL_KILLED_SILENCERS
}

function onKill(creature, target)
    local v = t[target:getName()]
    if v then
        creature:setStorageValue(v, math.max(0, creature:getStorageValue(v)) + 1)
    end
    return true
end
