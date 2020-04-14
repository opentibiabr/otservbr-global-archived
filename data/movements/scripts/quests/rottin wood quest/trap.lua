local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_PERIODICDAMAGE, -250)
setConditionParam(condition, CONDITION_PARAM_TICKS, -3)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 2000)

function onStepIn(cid, item, position, fromPosition)

if not isPlayer(cid) then
doAddCondition(cid, condition)
doRemoveItem(getTileItemById(position, 13174).uid, 1)
end
end