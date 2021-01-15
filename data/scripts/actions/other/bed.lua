local beds = Action()

function beds.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local kit = constructionKits[item.itemid]
    if not kit then
        return false
    end
    
    local tile = fromPosition:getTile() 
    if not tile or not tile:getHouse() then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You may construct this only inside a house.")
        return false
    end
    
    if tile:getHouse():getMaxBeds() < tile:getHouse():getBedsCount() + 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You may only put ".. tile:getHouse():getMaxBeds() .." beds in this house")
        return false        
    end
    tile:getHouse():setBedsCount(tile:getHouse():getBedsCount() + 1)
    if fromPosition.x == CONTAINER_POSITION then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Put the bed kit on the floor first.")
    elseif not fromPosition:getTile():getHouse() then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You may construct this only inside a house.")
    else
        item:transform(kit)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
    end
    return true
end
beds:id(?)
beds:register()
