local juice_squeezer = Action()

function juice_squeezer.onUse(player, item, fromPosition, target, toPosition, isHotkey)

fruits = {3584,3585,3586,3587,3588,3589,3590,3591,3592,3593,3594,3591,5096,8011,8012,8013}

	if isInArray(fruits, target.itemid) and player:removeItem(2874, 1, 0) then
		target:remove(1)
		player:addItem(2874, target.itemid == 3589 and 14 or 21)
		return true
	end
end

juice_squeezer:id(5865)
juice_squeezer:register()
