local moveevent = MoveEvent()

function moveevent.onAddItem(moveitem, tileitem, position)
	-- has to be a candle
	if moveitem.itemid ~= 2918 then
		return true
	end

	moveitem:remove()
	tileitem:transform(6279)
	position:sendMagicEffect(CONST_ME_MAGIC_RED)
	return true
end

moveevent:id(6278)
moveevent:register()
