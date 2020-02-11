local entertp = {x = 33641, y = 31236, z = 11}
local errotp = {x = 33647, y = 31262, z = 11}

local tanjistp = MoveEvent()

function tanjistp.onStepIn(player, item, frompos, item2, topos)
	if player:getStorageValue(Storage.DeeplingsWorldChange.Crystal) == 13 then
		player:teleportTo(entertp)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	else
		player:teleportTo(errotp)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	end
	return true
end

tanjistp:uid(28574)
tanjistp:register()