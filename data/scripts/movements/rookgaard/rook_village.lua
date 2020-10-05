local rookVillage = MoveEvent()

function rookVillage.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getLevel() < 150 then
		player:teleportTo(Position(32075, 32250, 6))
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You need level 150+ to enter in the Village.")
		return true
	end
	return true
end

rookVillage:type("stepin")
rookVillage:aid(50999)
rookVillage:register()
