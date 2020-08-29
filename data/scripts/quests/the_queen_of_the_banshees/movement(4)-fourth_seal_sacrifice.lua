local positions = {
	{x = 32242, y = 31891, z = 14},
	{x = 32243, y = 31891, z = 14},
	{x = 32242, y = 31893, z = 14},
	{x = 32243, y = 31893, z = 14}
}

local fourthSealSacrifice = MoveEvent()

function fourthSealSacrifice.onAddItem(moveitem, tileitem, position)
	if moveitem.itemid ~= 2016 or moveitem.type ~= 2 then
		return true
	end

	for i = 1, #positions do
		Position(positions[i]):sendMagicEffect(CONST_ME_DRAWBLOOD)
	end
	return true
end

fourthSealSacrifice:type("additem")
fourthSealSacrifice:id(2016)
fourthSealSacrifice:register()
