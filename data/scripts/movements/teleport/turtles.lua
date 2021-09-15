local setting = {
	[553] = Position(32359, 32901, 7),
	[554] = Position(32340, 32538, 7),
	[555] = Position(32472, 32869, 7),
	[556] = Position(32415, 32916, 7),
	[557] = Position(32490, 32979, 7),
	[558] = Position(32440, 32971, 7),
	[559] = Position(32527, 32951, 7),
	[560] = Position(32523, 32923, 7)
}

local turtles = MoveEvent()

function turtles.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.TheShatteredIsles.AccessToLagunaIsland) ~= 1 and item.uid == 553 then
		local accessPosition = Position(32340, 32540, 7)
		player:teleportTo(accessPosition)
		position:sendMagicEffect(CONST_ME_TELEPORT)
		accessPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	local toPosition = setting[item.uid]
	if not toPosition then
		return true
	end

	player:teleportTo(toPosition)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

turtles:type("stepin")

for index, value in pairs(setting) do
	turtles:uid(index)
end

turtles:register()
