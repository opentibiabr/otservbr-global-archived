function onSay(player, words, param)
	if (player:getAccountType() < ACCOUNT_TYPE_GOD) then
		return false
	end

	if (param) then
		local p = param:split(",")
		if (p[1] == "close") then
			if (p[2]) then
				p[2] = p[2]:trim()
				db.asyncQuery("UPDATE `support` SET `status`=" ..db.escapeString("INVALIDO").." WHERE `id`=" ..tonumber(p[2]))
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[REPORT] Report {" ..p[2].. "} fechado.")
			end
		elseif (p[1] == "pay") then
			p[2] = p[2]:trim()
			local resultId = db.storeQuery("SELECT * FROM `support` WHERE `id` = " .. tonumber(p[2]))
			if (resultId) then
				local name = result.getDataString(resultId, "name")
				local playerTarget = Player(name)
				if (not playerTarget) then
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[REPORT] Erro: nome não encontrado.")
					return false
				end

				db.asyncQuery("UPDATE `support` SET `status`=" ..db.escapeString("RESOLVIDO").." WHERE `id`=" ..tonumber(p[2]))
				db.asyncQuery("UPDATE `accounts` SET `coins` = coins + 1 WHERE `id` = " .. playerTarget:getAccountId())
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[REPORT] Report {" ..p[2].. " - " ..name.. "} recompensado.")
			end
		end
	end
	return false
end
