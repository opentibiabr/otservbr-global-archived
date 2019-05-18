local positions = {
	Position(33385, 31139, 8),
	Position(33385, 31134, 8),
	Position(33385, 31126, 8),
	Position(33385, 31119, 8),
	Position(33385, 31118, 8),
	Position(33380, 31085, 8),
	Position(33380, 31093, 8)
}

function onThink(interval, lastExecution)
	if math.random(100) < 50 then
		return true
	end

	local item
	for i = 1, #positions do
		item = Tile(positions[i]):getThing(1)
		if item and isInArray({12213, 12214}, item.itemid) then
			item:transform(item.itemid == 12213 and 12214 or 12213)
		end
	end

	return true
end