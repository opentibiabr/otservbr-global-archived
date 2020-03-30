local entertp = {x = 33446, y = 31288, z = 14}
local errotp = {x = 33478, y = 31314, z = 7}

local quickaccess = MoveEvent()

function quickaccess.onStepIn(player, item, frompos, item2, topos)
	if player:getStorageValue(Storage.LiquidBlackQuest.Visitor) >= 5 then
		player:sendTextMessage(MESSAGE_INFO_DESCR,"Welcome to Deeplings.")
		player:teleportTo(entertp)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(errotp)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

quickaccess:aid(57747)
quickaccess:register()