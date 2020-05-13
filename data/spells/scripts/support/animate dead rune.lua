function onCastSpell(player, variant)
    local position = variant:getPosition()
    local tile = Tile(position)
    if tile and player:getSkull() ~= SKULL_BLACK then
        if #player:getSummons() >= 2 then
            player:sendCancelMessage("You cannot control more creatures.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false
        end

        local corpse = tile:getTopDownItem()
        if corpse then
            local itemType = corpse:getType()
            if itemType:isCorpse() and itemType:isMovable() then
                local summon = Game.createMonster("Skeleton", position, true, true, player)
                if summon then
                    corpse:remove()
                    player:addSummon(summon)
                    position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
                    return true
                end
            end
        end
    end

    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return false
end
