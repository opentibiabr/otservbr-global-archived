function onUse(player, item)
	if (getPlayerStorageValue(Storage.TheNewFrontier.Questline) < 26) then
		player:addOutfit(335, 0)
		player:addOutfit(336, 0)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have gained your new outfit and my leave the reward room now!")
		player:setStorageValue(Storage.TheNewFrontier.Questline, 26)
		player:setStorageValue(Storage.TheNewFrontier.Questline, 26)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You already take the outfit, ask about mission for Chrak.")
	end
	return true
end
