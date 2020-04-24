local enterPosition = {x = 33421, y = 31255, z = 11}

local obujos = MoveEvent()

function obujos.onStepIn(creature, item, fromPosition, toPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.DeeplingsWorldChange.Crystal) == 13 then
		player:teleportTo(enterPosition)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	end
	return true
end

obujos:uid(28575)
obujos:register()
