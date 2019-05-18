function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then return false end
	
	
	if player:getLevel() < 150 then
	local vazarook = {x = 32075, y = 32250, z = 6}
	player:teleportTo(vazarook)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 150+ TO ENTER IN VILLAGE.")
	return false
    end	
	end 
	