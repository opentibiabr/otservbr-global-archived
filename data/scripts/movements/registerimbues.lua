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
local ret = {}
for tp, info in pairs(Imbuements_Weapons) do
	for _, id in pairs(info) do
		if not mov:find(string.format('itemid="%d"', id)) then
			local reg = types[tp]
			if not reg then
				reg = tp
			end
			local equip = MoveEvent()
			local deequip = MoveEvent()
			deequip.onEquip = defaultDeEquip
			equip.onEquip = defaultEquip
			equip:type("equip")
			deequip:type("deequip")
			deequip:id(id)
			equip:id(id)
			equip:slot(reg)
			deequip:slot(reg)
			equip:register()
			deequip:register()
		end
	end
end