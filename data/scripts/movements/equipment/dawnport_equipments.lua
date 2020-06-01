-- the chiller rod
local dawnportEquipment = MoveEvent()

function dawnportEquipment.onEquip(player, item, slot, isCheck)
	local vocation = player:getVocation()
	if vocation and vocation:getClientId() == VOCATION.CLIENT_ID.DRUID then
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, [[
			It can only be wielded properly by druids.
			It is a little, well, chilly to the touch.
		]])
		item:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 1500)
		return true
	else
		return false
	end
end

dawnportEquipment:id(23721)
dawnportEquipment:register()

local dawnportEquipment = MoveEvent()

function dawnportEquipment.onDeEquip(player, item, slot, isCheck)
	return true
end

dawnportEquipment:id(23721)
dawnportEquipment:register()

-- the scorcher wand
local theScorcher = MoveEvent()

function theScorcher.onEquip(player, item, slot, isCheck)
	local vocation = player:getVocation()
	if vocation and vocation:getClientId() == VOCATION.CLIENT_ID.SORCERER then
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, [[
			It can only be wielded properly by sorcerers.
			It's warm to the touch.
		]])
		item:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 1500)
		return true
	else
		return false
	end
end

theScorcher:id(23719)
theScorcher:register()

local theScorcher = MoveEvent()

function theScorcher.onDeEquip(player, item, slot, isCheck)
	return true
end

theScorcher:id(23719)
theScorcher:register()

-- spellbook of the novice
local spellbookOfTheNovice = MoveEvent()

function spellbookOfTheNovice.onEquip(player, item, slot, isCheck)
	local vocation = player:getVocation()
	local sorcerer, druid = VOCATION.CLIENT_ID.SORCERER, VOCATION.CLIENT_ID.DRUID
	if vocation and vocation:getClientId() == sorcerer or vocation:getClientId() == druid then
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, [[
			It can only be wielded properly by sorcerers and druids.
			It shows your spells and can also shield against attacks when worn.
		]])
		item:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 1400)
		return true
	else
		return false
	end
end

spellbookOfTheNovice:id(23771)
spellbookOfTheNovice:register()

local spellbookOfTheNovice = MoveEvent()

function spellbookOfTheNovice.onDeEquip(player, item, slot, isCheck)
	return true
end

spellbookOfTheNovice:id(23771)
spellbookOfTheNovice:register()
