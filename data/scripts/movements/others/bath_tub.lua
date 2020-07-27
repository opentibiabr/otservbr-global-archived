local bathtubEnter = MoveEvent()
local filledBathTub = 29313
local playerBathTub = 29323


function bathtubEnter.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
    end

    local bathTile = Tile(fromPosition)
    if bathTile and bathTile:getTopCreature() then
        return false
    end

    local condition = Condition(CONDITION_OUTFIT)
    condition:setOutfit({lookTypeEx = playerBathTub})
    condition:setTicks(-1)

	creature:addCondition(condition)
	return true
end

bathtubEnter:id(filledBathTub)
bathtubEnter:register()

local bathtubExit = MoveEvent()
function bathtubExit.onStepOut(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
    end

    creature:removeCondition(CONDITION_OUTFIT)
    return true
end

bathtubExit:id(filledBathTub)
bathtubExit:register()
