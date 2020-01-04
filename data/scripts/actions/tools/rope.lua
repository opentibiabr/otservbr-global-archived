local rope = Action()

function rope.onUse(player, item, fromPosition, target, toPosition, isHotkey)

local config = {
	holes = {294,369,370,385,394,411,412,413,432,433,435,482,483,594,595,609,610,615,868,874,1156,4824,7515,7516,7517,7518,7519,7520,7521,7522,7737,7755,7767,7768,8144,8690,8709,12203,12961,17239,19220,23364},
	spots = {386,421,12935,12936,14238,17238,21501,21965,21966,21967,21968,23363,},
	targetId = target.itemid,
}

	if toPosition.x == CONTAINER_POSITION then
		return false
	end

	local tile = Tile(toPosition)
	local ground = tile:getGround()
	if ground and isInArray(config.spots, ground.itemid) then
		player:teleportTo(toPosition:moveUpstairs())
		return true
	elseif isInArray(config.holes, config.targetId) then
		toPosition.z = toPosition.z + 1
		tile = Tile(toPosition)
		if tile then
			local thing = tile:getTopVisibleThing()
			if thing:isItem() and thing:getType():isMovable() then
				return thing:moveTo(toPosition:moveUpstairs())
			elseif thing:isCreature() and thing:isPlayer() then
				return thing:teleportTo(toPosition:moveUpstairs())
			end
		end

		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	return false
end

rope:id(3003, 646)
rope:register()
