local snow = MoveEvent()

function snow.onStepOut(creature, item, position, fromPosition)
	if creature:isPlayer() and creature:isInGhostMode() then
		return true
	end

	if item:getId() == 799 then
		item:transform(6594)
	else
		item:transform(item.itemid + 15)
	end
	item:decay()
	return true
end

for ids = 6580,6593 do
snow:id(ids)
end
snow:id(799)
snow:register()