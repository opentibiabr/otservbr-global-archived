local destinations = {
	[25451] = Position(32838, 32304, 9),
	[25452] = Position(32839, 32320, 9),
	[25453] = Position(32844, 32310, 9),
	[25454] = Position(32847, 32307, 9),
	[25455] = Position(32856, 32306, 9),
	[25456] = Position(32827, 32308, 9),
	[25457] = Position(32840, 32317, 9),
	[25458] = Position(32855, 32296, 9),
	[25459] = Position(32857, 32307, 9),
	[25460] = Position(32856, 32289, 9),
	[25461] = Position(32843, 32313, 9),
	[25462] = Position(32861, 32320, 9),
	[25463] = Position(32841, 32323, 9),
	[25464] = Position(32847, 32287, 9),
	[25465] = Position(32854, 32323, 9),
	[25466] = Position(32855, 32304, 9),
	[25467] = Position(32841, 32323, 9),
	[25468] = Position(32861, 32317, 9),
	[25469] = Position(32827, 32314, 9),
	[25470] = Position(32858, 32296, 9),
	[25471] = Position(32861, 32301, 9),
	[25472] = Position(32855, 32321, 9),
	[25473] = Position(32855, 32320, 9),
	[25474] = Position(32855, 32318, 9),
	[25475] = Position(32855, 32319, 9)
}

local tileTeleport = MoveEvent()

function tileTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(destinations[item.actionid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

tileTeleport:type("stepin")

for index, value in pairs(destinations) do
	tileTeleport:aid(index)
end

tileTeleport:register()
