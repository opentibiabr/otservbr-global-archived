local urmahlulluStages = {
    ['urmahlullu the immaculate'] = {
        nextStage = 'wildness of urmahlullu'
    },
    ['wildness of urmahlullu'] = {
        nextStage = 'urmahlullu the tamed'
    },
    ['urmahlullu the tamed'] = {
        nextStage = 'wisdom of urmahlullu'
    },
    ['wisdom of urmahlullu'] = {
        nextStage = 'urmahlullu the weakened'
    }
}

function onKill(player, target)
    local targetMonster = target:getMonster()
    if not targetMonster then
        return true
    end

    if targetMonster:getName():lower() == 'urmahlullu the weakened' then
        Game.setStorageValue(Storage.Fafnar.UrmahlulluCompleted, -1)
        player:setStorageValue(Storage.Fafnar.UrmahlulluTimer, os.time() + 20 * 60 * 1000)        
        return true
    end

    local name = targetMonster:getName():lower()
    local bossConfig  = urmahlulluStages[name]
    if not bossConfig then
        return true
    end

    local found = false
    for k, v in ipairs(Game.getSpectators(targetMonster:getPosition())) do
        if v:getName():lower() == bossConfig.nextStage then
            found = true
            break
        end
    end

    if not found then
        Game.createMonster(bossConfig.nextStage, targetMonster:getPosition(), false, true)
    end
    return true
end
