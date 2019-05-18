local config = {
	[50070] = {storageKey = Storage.RookgaardTutorialIsland.SantiagoNpcGreetStorage, storageValue = 12, text = 'You have no business in this part of the island anymore. Continue by solving Santiago\'s quest!', storageValue2 = 12, text2 = 'You have no business in this area of the island anymore. Talk to Santiago to learn how to continue.'},
	[50071] = {storageKey = Storage.RookgaardTutorialIsland.SantiagoNpcGreetStorage, storageValue = 12, text = 'Santiago really needs help, maybe you should have a look. Talk to him by typing \'Hi\' or \'Hello\'.'},
	[50072] = {storageKey = Storage.RookgaardTutorialIsland.SantiagoNpcGreetStorage, storageValue = 2, text = 'This is Santiago\'s room. Maybe you should talk to him before sniffing around in his house.'},
	[50073] = {storageKey = Storage.RookgaardTutorialIsland.SantiagoNpcGreetStorage, storageValue = 5, text = 'This is Santiago\'s cellar. You have no business there yet.', storageValue2 = 6, text2 = 'This is Santiago\'s cellar - and you wouldn\'t want to go back to this nasty place.'},
	[50074] = {storageKey = Storage.RookgaardTutorialIsland.SantiagoNpcGreetStorage, storageValue = 14, text = 'You don\'t have any business there anymore. Continue to the east!'},
	[50080] = {storageKey = Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage, storageValue = 1, text = 'Zirella really needs help, go talk to her.', storageValue3 = 7, text3 = 'This is not the way to the forest. You should head southwest first.'},
	[50088] = {storageKey = Storage.RookgaardTutorialIsland.tutorialHintsStorage, storageValue = 20, text = 'Before you head to the village, dig open that hole with your shovel and climb down. You will find something useful down there.'},
	[50089] = {storageKey = Storage.RookgaardTutorialIsland.CarlosQuestLog, storageValue = 7, text = 'You are not ready to enter the village of Rookgaard yet. You should talk to Carlos some more.', storageValue2 = 7, text2 = 'You have no business anymore on the other side of Rookgaard.'}
}

local allowPass = {}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	local targetTableAid = config[item.actionid]
	if not targetTableAid then
		if item.itemid == 8596 then
			local playerPos = player:getPosition()
			player:teleportTo(Position(playerPos.x + 1, playerPos.y, playerPos.z + 1), false)
		end
		return
	end

	local playerId = player.uid
	if item.actionid == 50070 then
		if player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) == 5 then
			return true
		end
	elseif item.actionid == 50071 then
		allowPass[playerId] = true
	elseif item.actionid == 50074 then
		if allowPass[playerId] then
			local playerPos = player:getPosition()
			player:teleportTo(Position(playerPos.x + 1, playerPos.y, playerPos.z), false)
			allowPass[playerId] = nil
			return true
		end
	end

	if player:getStorageValue(targetTableAid.storageKey) < targetTableAid.storageValue then
		player:teleportTo(fromPosition, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetTableAid.text)
		return
	end

	if targetTableAid.storageValue2 then
		if player:getStorageValue(targetTableAid.storageKey) > targetTableAid.storageValue2 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetTableAid.text2)
			player:teleportTo(fromPosition, true)
			return
		end
	end

	if targetTableAid.storageValue3 then
		if player:getStorageValue(targetTableAid.storageKey) < targetTableAid.storageValue3 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetTableAid.text3)
			player:teleportTo(fromPosition, true)
			return
		end
	end

	if item.actionid == 50089 then
		player:setTown(Town(6)) -- set rookgaard citizen
		player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 8)
		player:sendTutorial(14)
		local playerPos = player:getPosition()
		player:teleportTo(Position(playerPos.x, playerPos.y - 1, playerPos.z), true)
	end

	if item.itemid == 8595 then
		local playerPos = player:getPosition()
		player:teleportTo(Position(playerPos.x, playerPos.y, playerPos.z + 1), false)
	elseif item.itemid == 8709 then
		local playerPos = player:getPosition()
		player:teleportTo(Position(playerPos.x - 1, playerPos.y, playerPos.z - 1), false)
	end
	return true
end