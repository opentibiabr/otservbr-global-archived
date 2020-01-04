local bricklayers_kit = Action()

function bricklayers_kit.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if target.actionid ~= 50113 then
		return false
	end

	player:removeItem(5901, 3)
	player:removeItem(953, 3)
	Game.createItem(1272, 1, Position(32617, 31513, 9))
	Game.createItem(1624, 1, Position(32617, 31514, 9))
	player:removeItem(7785, 1)
	return true
end

bricklayers_kit:id(7785)
bricklayers_kit:register()
