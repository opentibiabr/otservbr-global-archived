local config = {

    storage = 19030, --use empty storage
    exhaust = 60 --Exhaust is in seconds 600 equals 10min
}

local hydraTongueSalad = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY,
CONDITION_PARALYZE, CONDITION_DRUNK, CONDITION_DROWN,
CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED
}

local roastedDragonWings = Condition(CONDITION_ATTRIBUTES)
roastedDragonWings:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
roastedDragonWings:setParameter(CONDITION_PARAM_SKILL_SHIELD, 10)

local tropicalFriedTerrorbird = Condition(CONDITION_ATTRIBUTES)
tropicalFriedTerrorbird:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
tropicalFriedTerrorbird:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 5)

local veggieCasserole = Condition(CONDITION_ATTRIBUTES)
veggieCasserole:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
veggieCasserole:setParameter(CONDITION_PARAM_SKILL_MELEE, 10)

local filledJalapenoPeppers = Condition(CONDITION_HASTE)
filledJalapenoPeppers:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
filledJalapenoPeppers:setParameter(CONDITION_PARAM_SPEED, 100)

local carrotCake = Condition(CONDITION_ATTRIBUTES)
carrotCake:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
carrotCake:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)

local northernFishburger = Condition(CONDITION_ATTRIBUTES)
northernFishburger:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
northernFishburger:setParameter(CONDITION_PARAM_SKILL_FISHING, 50)

function onUse(cid, item, fromPos, itemEx, toPos)
    if (getPlayerStorageValue(cid, config.storage) <= os.time()) then
        if (item.itemid == 9992) then
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureSay(cid, "Gulp.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9993) then
            cid:addCondition(hydraTongueSalad)
            doCreatureSay(cid, "Crunch.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9994) then
            cid:addCondition(roastedDragonWings)
            doCreatureSay(cid, "Chomp.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9995) then
            cid:addCondition(tropicalFriedTerrorbird)
            doCreatureSay(cid, "Chomp.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9996) then
-- "You don't really know what this did to you, but suddenly you feel very happy."
-- [TO ADD] Above text (Not sure what colour it has to be)
            doCreatureSay(cid, "Slurp.",TALKTYPE_ORANGE_1)
            cid:getPosition():sendMagicEffect(CONST_ME_HEARTS)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9997) then
            cid:addCondition(veggieCasserole)
            doCreatureSay(cid, "Yum.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9998) then
            cid:addCondition(filledJalapenoPeppers)
            doCreatureSay(cid, "Munch.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 9999) then
            doPlayerAddMana(cid, getPlayerMaxMana(cid))
            doCreatureSay(cid, "Chomp.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 10000) then
            cid:addCondition(carrotCake)
            doCreatureSay(cid, "Mmmm.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
        elseif (item.itemid == 10001) then
            cid:addCondition(northernFishburger)
            doCreatureSay(cid, "Smack.",TALKTYPE_ORANGE_1)
            doRemoveItem(item.uid, 1)
            setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
-- [TO ADD] Coconut Shrimp Bake, Pot of Blackjack, Demonic Candy Balls and Sweet Mangonaise Elixer.
        end
    else
         doPlayerSendCancel(cid, "You are full or you've already eaten a dish within 1 minute.")
    end
    return true
end
