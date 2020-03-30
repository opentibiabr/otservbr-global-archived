local entertp = {x = 33543, y = 31263, z = 11}
local errotp = {x = 33558, y = 31283, z = 11}

local jaulstp = MoveEvent()

function jaulstp.onStepIn(player, item, frompos, item2, topos)
	if player:getStorageValue(Storage.DeeplingsWorldChange.Crystal) == 13 then
		player:teleportTo(entertp)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	else
		player:teleportTo(errotp)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	end
	return true
end

jaulstp:uid(28576)
jaulstp:register()