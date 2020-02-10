local mirror2 = Action()

function mirror2.onUse(player, item, frompos, item2, topos)
		
	if player:isPlayer() then
		
		player:teleportTo({x = 33899, y = 31644, z = 9})
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Voce foi teleportado.")
	
	else
	
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Erro ao teleportar")
	
	end
	
    return true
end

mirror2:uid(57506)
mirror2:register()