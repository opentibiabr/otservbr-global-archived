local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	item:transform(item.itemid + 1)
	item:moveevent()
	return true
end
	
moveevent:id(293,475,1066)
moveevent:register()