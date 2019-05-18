function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 50083 then
		if player:getItemCount(8710) < 3 then
			player:sendTutorial(39)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You still need to kill at least 3 cockroaches and bring their legs to Santiago. Don't give up!")
			return true
		end

		fromPosition.y = fromPosition.y + 1
		fromPosition.z = fromPosition.z - 1
		player:teleportTo(fromPosition, false)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "If your torch is still lit when you leave the cellar, you can turn it off again to save its power for darker regions.")
		return true
	end

	fromPosition.y = fromPosition.y + 1
	fromPosition.z = fromPosition.z - 1
	player:teleportTo(fromPosition, false)
	return true
end
