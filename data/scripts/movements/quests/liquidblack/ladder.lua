local errotp = {x = 33511, y = 31331, z = 8}

local ladder = MoveEvent()

function ladder.onStepIn(player, item, frompos, item2, topos)
	if player:getStorageValue(Storage.LiquidBlackQuest.Visitor) >= 4 then
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Welcome to Deeplings.")
	else
		player:teleportTo(errotp)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	end
	return true
end

ladder:aid(57745)
ladder:register()