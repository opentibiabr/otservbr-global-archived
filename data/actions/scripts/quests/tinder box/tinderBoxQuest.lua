-- <action uniqueid="6000" script="quests/tinderBoxQuest.lua"/>

local config = {
	storage = 12450,
	hours = 20,
	item_id = 22728,
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(config.storage) >= os.time() then
		return player:sendCancelMessage("The pile of bones is empty.")
	end

	player:addItem(config.item_id, 1)
	player:setStorageValue(config.storage, os.time() + config.hours * 3600)

	return player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a tinder box.")
end
