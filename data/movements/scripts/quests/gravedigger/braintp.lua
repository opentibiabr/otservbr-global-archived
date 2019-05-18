local brain = Position(33022, 32338, 10)
local brain2 = Position(33022, 32334, 10)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.actionid == 4532 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission08) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission09) < 1 then
		player:teleportTo(brain2)
	else
		player:teleportTo(brain)
	end

	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return true
end
