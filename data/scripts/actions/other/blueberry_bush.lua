local blueberryBush = Action()

function blueberryBush.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(2786)
	item:decay()
	Game.createItem(2677, 3, fromPosition)
	player:addAchievementProgress('Bluebarian', 500)
	return true
end

blueberryBush:id(2785)
blueberryBush:register()
