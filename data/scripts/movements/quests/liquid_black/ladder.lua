local ladder = MoveEvent()

function ladder.onStepIn(creature, item, fromPosition, toPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.LiquidBlackQuest.Visitor) >= 4 then
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	end
	return true
end

ladder:aid(57745)
ladder:register()
