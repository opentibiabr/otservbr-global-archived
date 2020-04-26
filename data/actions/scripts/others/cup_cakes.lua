local config = {
    storage = 19043, --use empty storage
    exhaust = 600 --Exhaust is in seconds 600 equals 10min
}

local lemon = Condition(CONDITION_ATTRIBUTES)
lemon:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
lemon:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)

function onUse(cid, item, fromPos, itemEx, toPos)
    if (getPlayerStorageValue(cid, config.storage) <= os.time()) then
        if (item.itemid == 31719) then
            doPlayerAddMana(cid, getPlayerMaxMana(cid))
            doCreatureSay(cid, "Mmmm.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 31720) then
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureSay(cid, "Mmmm.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 31721) then
            doCreatureSay(cid, "Mmmm.",TALKTYPE_ORANGE_1)
            cid:addCondition(lemon)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        end
    else
         doPlayerSendCancel(cid, "You are full or you've already eaten a dish within 10 minutes.")
    end
    return true
end