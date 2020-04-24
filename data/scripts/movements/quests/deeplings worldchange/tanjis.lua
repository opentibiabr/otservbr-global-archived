local enterPosition = {x = 33641, y = 31236, z = 11}

local tanjis = MoveEvent()

function tanjis.onStepIn(creature, item, fromPosition, toPosition)
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

tanjis:uid(28574)
tanjis:register()
