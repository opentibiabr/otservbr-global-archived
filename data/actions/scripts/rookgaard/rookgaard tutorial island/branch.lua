local playerexhaust = Condition(CONDITION_EXHAUST_WEAPON)
	playerexhaust:setParameter(CONDITION_PARAM_TICKS, 3000)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 8600 then
		return false
	end

	item:remove(1)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Well done! You successfully used a branch on Zirella's cart. Talk to her and tell her you did it!")
	player:setStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage, 7)
	player:setStorageValue(Storage.RookgaardTutorialIsland.ZirellaQuestLog, 7)
	return true
end