local exittp = {x = 33478, y = 31314, z = 7}
local errotp = {x = 33446, y = 31273, z = 14}

local shortcut = MoveEvent()

function shortcut.onStepIn(player, item, frompos, item2, topos)
	if player:getStorageValue(Storage.LiquidBlackQuest.Visitor) >= 4 then
		player:setStorageValue(Storage.LiquidBlackQuest.Visitor, 5)
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Exit.")
		player:teleportTo(exittp)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(errotp)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

shortcut:aid(57746)
shortcut:register()