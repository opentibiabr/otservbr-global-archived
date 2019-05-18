local amfora = Position(32988, 32397, 9)
local amfora2 = Position(32987, 32401, 9)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.actionid == 4530 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission05) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission06) < 1 then
		player:teleportTo(amfora2)
	else
		player:teleportTo(amfora)
	end

	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return true
end
