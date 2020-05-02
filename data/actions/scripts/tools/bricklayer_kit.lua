function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid ~= 50113 then
		return false
	end

	player:removeItem(5901, 3)
	player:removeItem(8309, 3)
	Game.createItem(1027, 1, Position(32617, 31513, 9))
	Game.createItem(1205, 1, Position(32617, 31514, 9))
	player:removeItem(8613, 1)
	return true
end
