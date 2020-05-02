local config = {
	[12140]  = {destination = Position(32527, 31842, 9)},
	[12141]  = {destination = Position(32559, 31852, 7)},
	[12142]  = {destination = Position(32498, 31828, 9)},
	[12143]  = {destination = Position(32517, 31806, 9)},
	[12144]  = {destination = Position(32517, 31830, 9)},
	[12145]  = {destination = Position(32490, 31810, 9)},
	[12146]  = {destination = Position(32494, 31831, 9)},
	[12147]  = {destination = Position(32514, 31805, 9)},
	[12148]  = {destination = Position(32497, 31805, 9)},
	[12149]  = {destination = Position(32518, 31827, 9)}
}

function onUse(player, item, position, fromPosition)
	local teleport = config[item.uid]
	if not teleport then
		return true
	end

	player:teleportTo(teleport.destination)
	teleport.destination:sendMagicEffect(10)
	return true
end
