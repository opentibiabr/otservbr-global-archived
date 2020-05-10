local theRareHerb = Action()

function theRareHerb.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if setting then
		if player:getStorageValue(setting.storage) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, setting.message)
			player:setStorageValue(setting.storage, 2)
		else
			return false
		end
	end
	return true
end

theRareHerb:uid(25026)
theRareHerb:register()
