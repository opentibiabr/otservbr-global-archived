local config = {
	[1287]  = {destination = Position(32527, 31842, 9)},
	[1288]  = {destination = Position(32559, 31852, 7)},
	[1289]  = {destination = Position(32498, 31828, 9)},
	[1290]  = {destination = Position(32517, 31806, 9)},
	[1291]  = {destination = Position(32517, 31830, 9)},
	[1292]  = {destination = Position(32490, 31810, 9)},
	[1293]  = {destination = Position(32494, 31831, 9)},
	[1294]  = {destination = Position(32514, 31805, 9)},
	[1295]  = {destination = Position(32497, 31805, 9)},
	[1296]  = {destination = Position(32518, 31827, 9)}
}

local oreWagon = Action()

function oreWagon.onUse(player, item, position, fromPosition)
	local teleport = config[item.uid]
	if not teleport then
		return true
	end

	player:teleportTo(teleport.destination)
	teleport.destination:sendMagicEffect(10)
	return true
end

for index, value in pairs(config) do
	oreWagon:uid(index)
end

oreWagon:register()
