function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then return false end


	if player:getLevel() < 150 then
	local back = {x = 32075, y = 32250, z = 6}
	player:teleportTo(back)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You need level 150+ to enter in the Village.")
	return false
    end
	end
