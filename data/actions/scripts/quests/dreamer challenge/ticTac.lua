function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	item:transform(item.itemid == 1945 and 1946 or 1945)

	if item.itemid ~= 1945 then
		return true
	end

	local ticTacPosition = Position(32838, 32264, 14)
	local ticTacPosition1 = Position(32839, 32263, 14)

	if getPlayerStorageValue(cid, 91017) < 1 then
	setPlayerStorageValue(cid, 91017, 1)
	Game.createItem(2638, 8, ticTacPosition)
	Game.createItem(2639, 12, ticTacPosition1)
	ticTacPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)

	return true
	else

	doCreatureSay(cid, "You have used and can not use more.", TALKTYPE_ORANGE_1)

	end
	return true
end
