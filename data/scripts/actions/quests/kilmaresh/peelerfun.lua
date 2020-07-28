local peelerfun = Action()

function peelerfun.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.Kilmaresh.Eighth.Tefrit) == 2 then
		if table.contains({36211}, target.itemid) then
            player:sendTextMessage(MESSAGE_INFO_DESCR,"You are peeling a piece of tark off the again tree.")
			player:addItem(36164, 1)
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Sorry.")
	end
	
    return true
end

peelerfun:id(36163)
peelerfun:register()