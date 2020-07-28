local glasshoneyfun = Action()

function glasshoneyfun.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.Kilmaresh.Eighth.Narsai) == 2 then
		if table.contains({36211}, target.itemid) then
            player:sendTextMessage(MESSAGE_INFO_DESCR,"You are gently squishing some of the honey palm blossoms and golden honey is depping into the jug.")
			player:removeItem(36166, 1)
			player:addItem(36167, 1)
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Sorry.")
	end

    return true
end

glasshoneyfun:id(36166)
glasshoneyfun:register()