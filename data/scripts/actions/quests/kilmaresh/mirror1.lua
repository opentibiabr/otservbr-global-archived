local mirror1 = Action()

function mirror1.onUse(player, item, frompos, item2, topos)
		
	if player:isPlayer() then
		
		player:teleportTo({x = 33936, y = 31648, z = 9})
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Voce foi teleportado.")
	
	else
	
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Erro ao teleportar")
	
	end
	
    return true
end

mirror1:uid(57505)
mirror1:register()