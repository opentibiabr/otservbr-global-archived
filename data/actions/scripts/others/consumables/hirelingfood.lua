local config = {
    storage = 19042, --use empty storage
    exhaust = 600 --Exhaust is in seconds 600 equals 10min
}

local chilliConCarniphila = Condition(CONDITION_HASTE)
chilliConCarniphila:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
chilliConCarniphila:setParameter(CONDITION_PARAM_SPEED, 80)

local svargrondSalmonFilet = Condition(CONDITION_ATTRIBUTES)
svargrondSalmonFilet:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
svargrondSalmonFilet:setParameter(CONDITION_PARAM_SKILL_FISHING, 30)

local tropicalMarinatedTiger = Condition(CONDITION_ATTRIBUTES)
tropicalMarinatedTiger:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
tropicalMarinatedTiger:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)

local delicatessenSalad = Condition(CONDITION_ATTRIBUTES)
delicatessenSalad:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
delicatessenSalad:setParameter(CONDITION_PARAM_SKILL_MELEE, 3)

local roastedWyvernWings = Condition(CONDITION_ATTRIBUTES)
roastedWyvernWings:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
roastedWyvernWings:setParameter(CONDITION_PARAM_SKILL_SHIELD, 7)

local carrotPie = Condition(CONDITION_ATTRIBUTES)
carrotPie:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
carrotPie:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 7)

function onUse(cid, item, fromPos, itemEx, toPos)
    if (getPlayerStorageValue(cid, config.storage) <= os.time()) then
        if (item.itemid == 35172) then
            doCreatureSay(cid, "Chomp.",TALKTYPE_ORANGE_1)
            cid:addCondition(roastedWyvernWings)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35173) then
            doCreatureSay(cid, "Yummm.",TALKTYPE_ORANGE_1)
            cid:addCondition(carrotPie)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35174) then
            doCreatureSay(cid, "Munch.",TALKTYPE_ORANGE_1)
            cid:addCondition(tropicalMarinatedTiger)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35175) then
            doCreatureSay(cid, "Munch.",TALKTYPE_ORANGE_1)
            cid:addCondition(delicatessenSalad)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35176) then
            doCreatureSay(cid, "Yummm.",TALKTYPE_ORANGE_1)
            cid:addCondition(chilliConCarniphila)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35177) then
            doCreatureSay(cid, "Mmmmm.",TALKTYPE_ORANGE_1)
            cid:addCondition(svargrondSalmonFilet)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35178) then
            doCreatureAddHealth(cid, (getCreatureMaxHealth(cid) * 0.3))
            doCreatureSay(cid, "Munch.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35179) then
            doPlayerAddMana(cid, (getPlayerMaxMana(cid) * 0.3))
            doCreatureSay(cid, "Chomp.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 35180) then
            doCreatureSay(cid, "Blurg.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        end
    else
         doPlayerSendCancel(cid, "You are full or you've already eaten a dish within 10 minutes.")
    end
    return true
end