-- tomb coal basin
local moveevent = MoveEvent()

function moveevent.onAddItem(moveitem, tileitem, position)
	local setting = Uniques.TombCoalBasin[tileitem.uid]
	if not setting then
		return true
	end

	if moveitem.itemid ~= 3042 then
		position:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	moveitem:remove()
	position:sendMagicEffect(CONST_ME_HITBYFIRE)

	Tile(setting.flamePosition):relocateTo(setting.toPosition)
	setting.toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

moveevent:id(1485)
moveevent:register()