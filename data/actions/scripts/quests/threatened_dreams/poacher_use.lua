function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if target.itemid == 2160 then
        target:decay()
        item:remove(1)
        player:say("You are placing the book on the table, hopefully the poachers will discover it soon.", TALKTYPE_ORANGE_1)
        toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
        return true
    end
end
