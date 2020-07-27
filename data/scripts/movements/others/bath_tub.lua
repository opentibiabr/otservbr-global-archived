local bathtubEnter = MoveEvent()
local playerBathTub = 29323

function bathtubEnter.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
    end

    local bathTile = Tile(position)
    if bathTile then
      local bottomCreature = bathTile:getBottomCreature()
      if bottomCreature ~= creature then
        creature:teleportTo(fromPosition, true)
        return true
      end
    end

    local condition = Condition(CONDITION_OUTFIT)
    condition:setOutfit({lookTypeEx = playerBathTub})
    condition:setTicks(-1)

    creature:addCondition(condition)
	return true
end

bathtubEnter:id(BATHTUB_FILLED)
bathtubEnter:register()

local bathtubExit = MoveEvent()
function bathtubExit.onStepOut(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
    end

    creature:removeCondition(CONDITION_OUTFIT)
    return true
end

bathtubExit:id(BATHTUB_FILLED)
bathtubExit:register()
