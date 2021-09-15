local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = Tile(Position({ x = 32780 , y = 32231 , z = 8}))
	if item.itemid == 2772 then
		if tile:getItemById(389) then
			tile:getItemById(389):remove()
			item:transform(2773)
		else
			Game.createItem(387, 1, { x = 32780 , y = 32231 , z = 8})
		end
	else
		Game.createItem(387, 1, { x = 32780 , y = 32231 , z = 8})
		item:transform(2772)
	end
	return true
end

lever:uid(30024)
lever:register()
