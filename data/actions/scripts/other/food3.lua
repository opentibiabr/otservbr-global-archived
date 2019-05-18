local conditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY,
CONDITION_PARALYZE, CONDITION_DRUNK, CONDITION_DROWN,
CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED
}


local config = {
    storage = 19031, --use empty storage
    exhaust = 60 --Exhaust is in seconds 600 equals 10min
}


local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))


function onUse(cid, item, fromPosition, itemEx, toPosition)
if (item.itemid == 9993) then
if (getPlayerStorageValue(cid, config.storage) <= os.time()) then 
  setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
if(not doAddCondition(cid, exhaust)) then
return true
end


for _, condition in ipairs(conditions) do
if(getCreatureCondition(cid, condition)) then
doRemoveCondition(cid, condition)
doPlayerSendCancel(cid, "You Removed all the negative conditions.")

end
end


doRemoveItem(item.uid, 1)

        doSendMagicEffect(getPlayerPosition(cid),14)
end
end
return true
end