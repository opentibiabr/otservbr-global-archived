local config = {

    storage = 19030, --use empty storage
    exhaust = 60 --Exhaust is in seconds 600 equals 10min
}
 
function onUse(cid, item, fromPos, itemEx, toPos)
    if (getPlayerStorageValue(cid, config.storage) <= os.time()) then
        if (item.itemid == 9992) then
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureSay(cid, "Gulp.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9999) then
            doPlayerAddMana(cid, getPlayerMaxMana(cid))
            doCreatureSay(cid, "Chomp.",TALKTYPE_ORANGE_1)
            doSendMagicEffect(getPlayerPosition(cid),14)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        end
    else
         doPlayerSendCancel(cid, "You are full or need 1 min to use again.")
    end
    return true
end