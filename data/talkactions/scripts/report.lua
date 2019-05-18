function onSay(player, words, param)
	local posReport = player:getPosition()
	if (Player.getExhaustion(player, 5804783) <= 0) then
		local description = param
		if (string.len(description) == 0) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Por favor, especifique o seu problema. Ex: !report SQM BUGADO")
			return false
		end

		if (string.len(description) > 130) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Por favor, digite no máximo 130 letras na descrição!")
			return false
		end
		
		Player.setExhaustion(player, 5804783, 60)
		db.asyncQuery("INSERT INTO support (id, name, description, posx, posy, posz, status) VALUES (0, " ..db.escapeString(player:getName())..", " ..db.escapeString(description).. ", "..posReport.x.. ", " ..posReport.y.. ", " ..posReport.z..", " ..db.escapeString('PENDENTE')..")")
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Obrigado por reportar BUG, caso seja válido será recompensado com 25 coin.")
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Espere " ..(math.abs(Player.getExhaustion(player, 5804783))).. " segundos para reportar!")
	end
	return false
end
