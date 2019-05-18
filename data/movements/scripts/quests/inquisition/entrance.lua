local throneStorages = {
	Storage.PitsOfInferno.ThroneInfernatil,
	Storage.PitsOfInferno.ThroneTafariel,
	Storage.PitsOfInferno.ThroneVerminor,
	Storage.PitsOfInferno.ThroneApocalypse,
	Storage.PitsOfInferno.ThroneBazir,
	Storage.PitsOfInferno.ThroneAshfalor,
	Storage.PitsOfInferno.ThronePumin
}

local function hasTouchedOneThrone(player)
	for i = 1, #throneStorages do
		if player:getStorageValue(throneStorages[i]) == 1 then
			return true
		end
	end
	return false
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if not hasTouchedOneThrone(player) or player:getLevel() < 100 or player:getStorageValue(Storage.TheInquisition.Questline) < 20 then
	if player:getLevel() < 100 then
		player:teleportTo(fromPosition)
		position:sendMagicEffect(CONST_ME_TELEPORT)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	local destination = Position(33168, 31683, 15)
	player:teleportTo(destination)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
	end
end
