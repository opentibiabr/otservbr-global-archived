function onUse(player, item, fromPosition, target, toPosition, isHotkey)
 
    ----------------------------
    local destinationPos = Position(32118, 32709, 7)
    local bohcStorage = 60120    -- put unused storage here
    local levelReq = 100   -- level required to use
    local hasToBeEquipped = true  -- true/false, if has to be equipped in feet slot
    local cdInSec = 24*60*60    -- cooldown in seconds
    -----------------------------
   
    local item = item.uid
    local ppos = player:getPosition()
   
    if not Tile(ppos):hasFlag(TILESTATE_PROTECTIONZONE) then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(MESSAGE_EVENT_ORANGE, "Better find yourself some safe place first.")
        return true
        end
       
    if hasToBeEquipped == true then
        if player:getSlotItem(8) ~= Item(item) then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(MESSAGE_EVENT_ORANGE, "You must put the boots on first.")
        return true
        end
    end
   
    if player:getLevel() < levelReq then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendTextMessage(MESSAGE_EVENT_ORANGE, "You're not worthy yet!")
    return true
    end
   
        if player:getStorageValue(bohcStorage) > os.time() then
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:say("It does nothing. Try again later.", TALKTYPE_MONSTER_SAY, false, player)
        return true
        end
   
 
    ppos:sendDistanceEffect(Position(ppos.x-1, ppos.y-1, ppos.z), CONST_ANI_ICE)
    ppos:sendMagicEffect(CONST_ME_ENERGYHIT)
    player:teleportTo(destinationPos, false)
    player:say("Magical sparks whirl around the boots and suddenly you are somewhere else.", TALKTYPE_MONSTER_SAY, false, player)
    player:setStorageValue(bohcStorage, os.time() + cdInSec)
   
    return true
end
 