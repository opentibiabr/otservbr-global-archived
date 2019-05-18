local tileExceptions = {Position(33023, 32330, 10), Position(33023, 32331, 10), Position(33024, 32332, 10)}

function onAddItem(moveitem, tileitem, position)
	if isInArray(tileExceptions, position) then
		return true
	end
	
	moveitem:remove()
	position:sendMagicEffect(CONST_ME_DRAWBLOOD)
	return true
	end
