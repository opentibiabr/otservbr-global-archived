local positions = {
	Position(32243, 31893, 14),
	Position(32242, 31891, 14),
	Position(32242, 31893, 14),
	Position(32243, 31891, 14)
}

function onAddItem(moveitem, tileitem, position)
	if moveitem.itemid ~= 2006 or moveitem.type ~= 2 then
		return true
	end

	moveitem:transform(2016, 2)
	for i = 1, #positions do
		positions[i]:sendMagicEffect(CONST_ME_DRAWBLOOD)
	end
	return true
end
