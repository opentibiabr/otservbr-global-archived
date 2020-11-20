local gates = {
	[9710] = {value = 1, position = Position(32834, 32082, 7)},
	[9711] = {value = 2, position = Position(32680, 31720, 7)},
	[9712] = {value = 3, position = Position(32268, 32162, 7)},
	[9713] = {value = 4, position = Position(32263, 31847, 7)},
	[9714] = {value = 5, position = Position(33221, 31921, 7)},
	[9716] = {value = 6, position = Position(32574, 31981, 7)}
}

local exitPositions = {
	[1] = Position(32834, 32082, 7),
	[2] = Position(32680, 31720, 7),
	[3] = Position(32268, 32162, 7),
	[4] = Position(32263, 31847, 7),
	[5] = Position(33221, 31921, 7),
	[6] = Position(32574, 31981, 7)
}

local teleport = MoveEvent()

function teleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if isInArray({9710, 9711, 9712, 9713, 9714, 9716}, item.actionid) then
		local gate = gates[item.actionid]
		if not gate then
			return true
		end

		position:sendMagicEffect(CONST_ME_TELEPORT)

		if Game.getStorageValue(GlobalStorage.FuryGates) ~= gate.value then
			player:teleportTo(gate.position)
			gate.position:sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end

		if player:getLevel() < 60 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			player:teleportTo(gate.position)
			gate.position:sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end

		local destination = Position(33290, 31786, 13)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_FIREAREA)
	else
		local destination = exitPositions[Game.getStorageValue(GlobalStorage.FuryGates)]
		if not destination then
			return true
		end

		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_FIREAREA)
	end
	return true
end

teleport:type("stepin")

for index, value in pairs(gates) do
	teleport:aid(index)
end

teleport:register()
