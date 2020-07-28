local pickenchanted = Action()

function pickenchanted.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.Kilmaresh.Eighth.Yonan) == 2 then
		if table.contains({35273}, target.itemid) then
            player:sendTextMessage(MESSAGE_INFO_DESCR,"You are quarrying some tagralt.")
			player:addItem(36168, 1)
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Sorry.")
	end
	
    return true
end

pickenchanted:id(36448)
pickenchanted:register()