local entertp = {x = 33421, y = 31255, z = 11}
local errotp = {x = 33438, y = 31249, z = 11}

local obujostp = MoveEvent()

function obujostp.onStepIn(player, item, frompos, item2, topos)
	if player:getStorageValue(Storage.DeeplingsWorldChange.Crystal) == 13 then
		player:teleportTo(entertp)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	else
		player:teleportTo(errotp)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	end
	return true
end

obujostp:uid(28575)
obujostp:register()