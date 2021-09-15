local config = {
	[5717] = {flamePosition = Position(33097, 32816, 13), toPosition = Position(33093, 32824, 13)},
	[5718] = {flamePosition = Position(33293, 32742, 13), toPosition = Position(33299, 32742, 13)},
	[5719] = {flamePosition = Position(33073, 32590, 13), toPosition = Position(33080, 32588, 13)},
	[5720] = {flamePosition = Position(33240, 32856, 13), toPosition = Position(33246, 32850, 13)},
	[5721] = {flamePosition = Position(33276, 32553, 14), toPosition = Position(33271, 32553, 14)},
	[5722] = {flamePosition = Position(33234, 32692, 13), toPosition = Position(33234, 32687, 13)},
	[5723] = {flamePosition = Position(33135, 32683, 12), toPosition = Position(33130, 32683, 12)},
	[5724] = {flamePosition = Position(33162, 32831, 10), toPosition = Position(33158, 32832, 10)}
}

local tombCoalBasin = MoveEvent()

function tombCoalBasin.onAddItem(moveitem, tileitem, position)
	local targetCoalBasin = config[tileitem.uid]
	if not targetCoalBasin then
		return true
	end

	if moveitem.itemid ~= 3042 then
		position:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	moveitem:remove()
	position:sendMagicEffect(CONST_ME_HITBYFIRE)

	Tile(targetCoalBasin.flamePosition):relocateTo(targetCoalBasin.toPosition)
	targetCoalBasin.toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

tombCoalBasin:type("additem")
tombCoalBasin:id(2114)
tombCoalBasin:register()
