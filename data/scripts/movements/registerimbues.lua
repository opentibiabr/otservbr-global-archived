local types = {
	["axe"] = "hand",
	["club"] = "hand",
	["sword"] = "hand",
	["rod"] = "hand",
	["wand"] = "hand",
	["bow"] = "hand",
	["crossbow"] = "hand",
	["especial"] = "hand",
	["boots"] = "feet",
	["helmet"] = "head",
	["helmetmage"] = "head",
	["spellbooks"] = "shield",
}

local function readFile(filename)
	local fp = io.open(filename, "r")
	local ct = fp:read("*a")
	fp:close()
	return ct
end

local mov = readFile("data/movements/movements.xml")
for tp, info in pairs(Imbuements_Weapons) do
	for _, id in pairs(info) do
		if not mov:find(string.format('itemid="%d"', id)) then
			local reg = types[tp]
			if not reg then
				reg = tp
			end
			-- Equip function
			local equip = MoveEvent()
			equip.onEquip = defaultEquip
			equip:type("equip")
			equip:id(id)
			equip:slot(reg)
			equip:register()

			-- DeEquip function
			local deequip = MoveEvent()
			deequip.onEquip = defaultDeEquip
			deequip:type("deequip")
			deequip:id(id)
			deequip:slot(reg)
			deequip:register()
		end
	end
end
mov = ''
