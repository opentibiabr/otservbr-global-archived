local enterPosition = {x = 33543, y = 31263, z = 11}

local jaul = MoveEvent()

function jaul.onStepIn(creature, item, fromPosition, toPosition)
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

jaul:uid(28576)
jaul:register()
