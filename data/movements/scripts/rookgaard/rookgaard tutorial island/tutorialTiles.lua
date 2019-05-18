local config = {
	[50058] = {markPos = Position(32000, 32278, 7), markId = MAPMARK_REDEAST, markDesc = 'To the Village', tutorialId = 2, storageValue = 1},
	[50059] = {effPos = Position(32007, 32276, 7), text = 'To look at objects such as this sign, right-click on them and select \'Look\'. Sometimes you have to walk a bit closer to signs. Messages like this can be reviewed at a later time by using the \'Server Log\' window, located at the bottom of the screen.', storageValue = 2},
	[50060] = {markPos = Position(32023, 32273, 7), markId = MAPMARK_GREENNORTH, markDesc = 'Santiago\'s Hut', text = 'Now continue to the next mark on your automap to the east. You can point your mouse cursor on a mark to read its name.', storageValue = 3},
	[50061] = {tutorialId = 21, effPos = Position(32023, 32273, 7), text = 'To go up stairs or ramps like this one, simply walk on them.', storageValue = 4},
	[50062] = {markPos = Position(32034, 32275, 6), markId = MAPMARK_REDSOUTH, markDesc = 'Santiago\'s Hut', text = 'This is Santiago, a Non-Player-Character. You can chat with NPCs by typing \'Hi\' or \'Hello\'. Walk to Santiago and try it!', storageValue = 5},
	[50063] = {tutorialId = 22, storageValue = 6},
	[50064] = {tutorialId = 4, storageValue = 7},
	[50065] = {effPos = Position(32033, 32278, 8), text = 'You can\'t see any cockroaches here. \'Open\' this chest and see if you can find something to light the room better.', storageValue = 8},
	[50066] = {text = 'Maybe you shouldn\'t stay in this forest longer than necessary. Zirella is waiting for her firewood!', storageValue = 13},
	[50067] = {effPos = Position(32035, 32285, 8), text = 'Look at the metallic object on the floor - this is a sewer grate. Right-click on it and select \'Use\' to climb down.', storageValue = 10},
	[50068] = {tutorialId = 7, text = 'You smell stinky cockroaches around here. When you see one, walk to it and attack it by left-clicking it in your battle list!', storageValue = 11},
	[50069] = {tutorialId = 23, effPos = Position(32035, 32285, 9), text = 'Right-click on the lower right end of the ladder - anywhere in the red frame - and select \'Use\' to climb up.', storageValue = 12},
	[50075] = {text = 'Do you have trouble finding those dead trees? Here are some - just \'Use\' them to break a branch.', storageValue = 14, effPos = Position(32067, 32281, 7), effPos2 = Position(32073, 32276, 7)},
	[50078] = {text = 'This is a loose stone pile. Right-click your shovel, select \'Use with\' and then left-click on the stonepile to dig it open.', storageValue = 18, effPos = Position(32070, 32266, 7)},
	[50079] = {text = 'Caves like this one are common in Tibia. To climb out again, you need something which you can find in this chest.', storageValue = 20, effPos = Position(32067, 32264, 8)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local targetTableAid = config[item.actionid]
	if not targetTableAid then
		if item.actionid == 50069 then
			if player:getStorageValue(Storage.RookgaardTutorialIsland.cockroachLegsMsgStorage) < 1 then
				return
			end
		elseif item.actionid == 50076 then
			if player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) == 15 then
				player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 16)
				Position(32062, 32271, 7):sendMagicEffect(CONST_ME_TUTORIALARROW)
				Position(32062, 32271, 7):sendMagicEffect(CONST_ME_TUTORIALARROW)
				player:sendTutorial(24)
			end
		elseif item.actionid == 50077 then
			if player:getStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage) == 8 and player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 17  then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This is Zirella\'s door. Right-click on the lower part of the door and select \'Use\' to open it.')
				player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 17)
			end
			if player:getStorageValue(Storage.QuestChests.TutorialShovel) == 1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Good, now continue to the east to find a place to try out your shovel.')
				player:setStorageValue(Storage.QuestChests.TutorialShovel, 2)
			end
		elseif item.actionid == 50081 then
			if player:getStorageValue(Storage.QuestChests.TutorialRope) == 1 and player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 21 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'To climb out of this cave right-click your rope, select \'Use with\' then left-click on the dark spot on the floor, the ropespot.')
				Position(32070, 32266, 8):sendMagicEffect(CONST_ME_TUTORIALARROW)
				Position(32070, 32266, 8):sendMagicEffect(CONST_ME_TUTORIALSQUARE)
				player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 21)
			end
		end
		return
	end

	if item.actionid == 50078 then
		if player:getStorageValue(Storage.QuestChests.TutorialShovel) < 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have not claimed your reward from Zirella house.')
			player:teleportTo(fromPosition, true)
			return
		end
	elseif item.actionid == 50069 then
		if player:getStorageValue(Storage.RookgaardTutorialIsland.SantiagoNpcGreetStorage) < 6 then
			return true
		end
	end

	if player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < targetTableAid.storageValue then
		player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, targetTableAid.storageValue)

		if targetTableAid.tutorialId then
			player:sendTutorial(targetTableAid.tutorialId)
		end

		if item.actionid == 50075 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetTableAid.text)
		end

		if targetTableAid.text then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetTableAid.text)
		end

		if targetTableAid.effPos then
			targetTableAid.effPos:sendMagicEffect(CONST_ME_TUTORIALARROW)
			targetTableAid.effPos:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		end

		if targetTableAid.effPos2 then
			targetTableAid.effPos2:sendMagicEffect(CONST_ME_TUTORIALARROW)
			targetTableAid.effPos2:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		end

		if targetTableAid.markPos then
			player:addMapMark(targetTableAid.markPos, targetTableAid.markId, targetTableAid.markDesc)
		end
	end
	return true
end