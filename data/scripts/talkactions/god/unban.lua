local talk = TalkAction("/unban")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() then 
		return false
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local resultId = db.storeQuery("SELECT `account_id`, `lastip` FROM `players` WHERE `name` = " .. db.escapeString(param))
	if resultId == false then
		return false
	end

	db.asyncQuery("DELETE FROM `account_bans` WHERE `account_id` = " .. result.getDataInt(resultId, "account_id"))
	db.asyncQuery("DELETE FROM `ip_bans` WHERE `ip` = " .. result.getDataInt(resultId, "lastip"))
	result.free(resultId)
	player:sendTextMessage(MESSAGE_INFO_DESCR, param .. " has been unbanned.")
	return false
end

talk:separator(" ")
talk:register()