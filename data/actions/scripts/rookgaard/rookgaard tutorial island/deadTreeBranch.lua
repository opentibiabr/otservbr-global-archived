local playerexhaust = Condition(CONDITION_EXHAUST_WEAPON)
	playerexhaust:setParameter(CONDITION_PARAM_TICKS, 5000)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local player= player
	if player:getCondition(CONDITION_EXHAUST_WEAPON) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait a few seconds until this tree can be used again.")
		return true
	end
	if player:getStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage) > 5 and player:getStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage) < 7 then
		player:addCondition(playerexhaust)
		player:sendTutorial(24)
		local branch = player:addItem(8582, 1)
		branch:decay()
		if player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 15 then
			player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 15)
		end
	end
	return true
end