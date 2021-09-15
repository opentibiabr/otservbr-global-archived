local internalNpcName = "Lynda"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 138,
	lookHead = 79,
	lookBody = 81,
	lookLegs = 67,
	lookFeet = 95,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)

	if msgcontains(message, "angelina") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) == 1 then
			npcHandler:say({
				"Angelina had been imprisoned? My, these are horrible news, but I am so glad to hear that she is safe now. ...",
				"I will happily carry out her wish and reward you, but I fear I need some important ingredients for my blessing spell first. ...",
				"Will you gather them for me?"
			}, npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, "wand") or msgcontains(message, "rod") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) == 2 then
			npcHandler:say("Did you bring a sample of each wand and each rod with you?", npc, creature)
			npcHandler.topic[playerId] = 3
		end
	elseif msgcontains(message, "sulphur") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) == 3 then
			npcHandler:say("Did you obtain 10 ounces of magic sulphur?", npc, creature)
			npcHandler.topic[playerId] = 4
		end
	elseif msgcontains(message, "soul stone") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) == 4 then
			npcHandler:say("Were you actually able to retrieve the Necromancer's soul stone?", npc, creature)
			npcHandler.topic[playerId] = 5
		end
	elseif msgcontains(message, "ankh") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) == 5 then
			npcHandler:say("Am I sensing enough holy energy from ankhs here?", npc, creature)
			npcHandler.topic[playerId] = 6
		end
	elseif msgcontains(message, "ritual") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) == 6 then
			if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWandTimer) < os.time() then
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand, 7)
				player:addOutfitAddon(141, 1)
				player:addOutfitAddon(130, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say('I\'m glad to tell you that I have finished the ritual, player. Here is your new wand. I hope you carry it proudly for everyone to see..', npc, creature)
				npcHandler.topic[playerId] = 0
			else
				npcHandler:say('Please let me focus for a while, |PLAYERNAME|.', npc, creature)
			end
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say({
				"Thank you, I promise that your efforts won't be in vain! Listen closely now: First, I need a sample of five druid rods and five sorcerer wands. ...",
				"I need a snakebite rod, a moonlight rod, a necrotic rod, a terra rod and a hailstorm rod. Then, I need a wand of vortex, a wand of dragonbreath ...",
				"... a wand of decay, a wand of cosmic energy and a wand of inferno. Please bring them all at once so that their energy will be balanced. ...",
				"Secondly, I need 10 ounces of magic sulphur. It can absorb the elemental energy of all the wands and rods and bind it to something else. ...",
				"Next, I will need a soul stone. These can be used as a vessel for energy, evil as well as good. They are rarely used nowaday though. ...",
				"Lastly, I need a lot of holy energy. I can extract it from ankhs, but only a small amount each time. I will need about 20 ankhs. ...",
				"Did you understand everything I told you and will help me with my blessing?"
			}, npc, creature)
			npcHandler.topic[playerId] = 2
		elseif npcHandler.topic[playerId] == 2 then
			npcHandler:say("Alright then. Come back to with a sample of all five wands and five rods, please.", npc, creature)
			player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand, 2)
			npcHandler.topic[playerId] = 0
		elseif npcHandler.topic[playerId] == 3 then
			if  player:getItemCount(2181) > 0 and player:getItemCount(2182) > 0 and player:getItemCount(2183) > 0 and player:getItemCount(2185) > 0 and player:getItemCount(2186) > 0 and player:getItemCount(2187) > 0 and player:getItemCount(2188) > 0 and player:getItemCount(2189) > 0 and player:getItemCount(2190) > 0 and player:getItemCount(2191) > 0 then
				npcHandler:say("Thank you, that must have been a lot to carry. Now, please bring me 10 ounces of magic sulphur.", npc, creature)
				player:removeItem(2181, 1)
				player:removeItem(2182, 1)
				player:removeItem(2183, 1)
				player:removeItem(2185, 1)
				player:removeItem(2186, 1)
				player:removeItem(2187, 1)
				player:removeItem(2188, 1)
				player:removeItem(2189, 1)
				player:removeItem(2190, 1)
				player:removeItem(2191, 1)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand, 3)
				npcHandler.topic[playerId] = 0
			end
		elseif npcHandler.topic[playerId] == 4 then
			if player:removeItem(5904, 10) then
				npcHandler:say("Very good. I will immediately start to prepare the ritual and extract the elemental energy from the wands and rods. Please bring me the Necromancer's soul stone now.", npc, creature)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand, 4)
				npcHandler.topic[playerId] = 0
			end
		elseif npcHandler.topic[playerId] == 5 then
			if player:removeItem(5809, 1) then
				npcHandler:say("You have found a rarity there, |PLAYERNAME|. This will become the tip of your blessed wand. Please bring me 20 ankhs now to complete the ritual.", npc, creature)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand, 5)
				npcHandler.topic[playerId] = 0
			end
		elseif npcHandler.topic[playerId] == 6 then
			if player:removeItem(2193, 20) then
				npcHandler:say("The ingredients for the ritual are complete! I will start to prepare your blessed wand, but I have to medidate first. Please come back later to hear how the ritual went.", npc, creature)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand, 6)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWandTimer, os.time() + 10800)
				npcHandler.topic[playerId] = 0
			end
		end
	end
end

local function confirmWedding(creature, message, keywords, parameters, node)
	local player = Player(creature)
	local playerStatus = getPlayerMarriageStatus(player:getGuid())
	local candidate = getPlayerSpouse(player:getGuid())
	if playerStatus == PROPACCEPT_STATUS then
	  --  local item3 = Item(doPlayerAddItem(creature,ITEM_Meluna_Ticket,2))
		setPlayerMarriageStatus(player:getGuid(), MARRIED_STATUS)
		setPlayerMarriageStatus(candidate, MARRIED_STATUS)
		setPlayerSpouse(player:getGuid(), candidate)
		setPlayerSpouse(candidate, player:getGuid())
		delayedSay('Dear friends and family, we are gathered here today to witness and celebrate the union of ' .. getPlayerNameById(candidate) .. ' and ' .. player:getName() .. ' in marriage.')
		delayedSay('Through their time together, they have come to realize that their personal dreams, hopes, and goals are more attainable and more meaningful through the combined effort and mutual support provided in love, commitment, and family;',5000)
		delayedSay('and so they have decided to live together as husband and wife. And now, by the power vested in me by the Gods of Tibia, I hereby pronounce you husband and wife.',15000)
		delayedSay('*After a whispered blessing opens an hand towards ' .. player:getName() .. '* Take these two engraved wedding rings and give one of them to your spouse.',22000)
		delayedSay('You may now kiss your bride.',28000)
		local item1 = Item(doPlayerAddItem(creature,ITEM_ENGRAVED_WEDDING_RING,1))
		local item2 = Item(doPlayerAddItem(creature,ITEM_ENGRAVED_WEDDING_RING,1))
		item1:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, player:getName() .. ' & ' .. getPlayerNameById(candidate) .. ' forever - married on ' .. os.date('%B %d, %Y.'))
		item2:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, player:getName() .. ' & ' .. getPlayerNameById(candidate) .. ' forever - married on ' .. os.date('%B %d, %Y.'))
	else
		npcHandler:say('Your partner didn\'t accept your proposal, yet', npc, creature)
	end
	return true
end
		-- END --
local function confirmRemoveEngage(creature, message, keywords, parameters, node)
	local player = Player(creature)
	local playerStatus = getPlayerMarriageStatus(player:getGuid())
	local playerSpouse = getPlayerSpouse(player:getGuid())
	if playerStatus == PROPOSED_STATUS then

		npcHandler:say('Are you sure you want to remove your wedding proposal with {' .. getPlayerNameById(playerSpouse) .. '}?', npc, creature)
		node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 3, text = 'Ok, let\'s keep it then.'})

		local function removeEngage(creature, message, keywords, parameters, node)
			doPlayerAddItem(creature,ITEM_WEDDING_RING,1)
	   doPlayerAddItem(creature,10503,1)
			setPlayerMarriageStatus(player:getGuid(), 0)
			setPlayerSpouse(player:getGuid(), -1)
			npcHandler:say(parameters.text, npc, creature)
			keywordHandler:moveUp(parameters.moveup)
		end
		node:addChildKeyword({'yes'}, removeEngage, {moveup = 3, text = 'Ok, your marriage proposal to {' .. getPlayerNameById(playerSpouse) .. '} has been removed. Take your wedding ring back.'})
	else
		npcHandler:say('You don\'t have any pending proposal to be removed.', npc, creature)
		keywordHandler:moveUp(2)
	end
	return true
end

local function confirmDivorce(creature, message, keywords, parameters, node)
	local player = Player(creature)
	local playerStatus = getPlayerMarriageStatus(player:getGuid())
	local playerSpouse = getPlayerSpouse(player:getGuid())
	if playerStatus == MARRIED_STATUS then
		npcHandler:say('Are you sure you want to divorce of {' .. getPlayerNameById(playerSpouse) .. '}?', npc, creature)
		node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 3, text = 'Great! Marriages should be an eternal commitment.'})

		local function divorce(creature, message, keywords, parameters, node)
			local player = Player(creature)
			local spouse = getPlayerSpouse(player:getGuid())
			setPlayerMarriageStatus(player:getGuid(), 0)
			setPlayerSpouse(player:getGuid(), -1)
			setPlayerMarriageStatus(spouse, 0)
			setPlayerSpouse(spouse, -1)
			npcHandler:say(parameters.text, npc, creature)
			keywordHandler:moveUp(parameters.moveup)
		end
		node:addChildKeyword({'yes'}, divorce, {moveup = 3, text = 'Ok, you are now divorced of {' .. getPlayerNameById(playerSpouse) .. '}. Think better next time after marrying someone.'})
	else
		npcHandler:say('You aren\'t married to get a divorce.', npc, creature)
		keywordHandler:moveUp(2)
	end
	return true
end

local node1 = keywordHandler:addKeyword({'marry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to get married? Make sure you have a wedding ring and the wedding outfit box with you.'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'That\'s fine.'})
local node2 = node1:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'And who would you like to marry?'})
node2:addChildKeyword({'[%w]'}, tryEngage, {})

local node3 = keywordHandler:addKeyword({'celebration'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Is your soulmate and friends here with you for the celebration?.'})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then go bring them here!.'})
local node4 = node3:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Good, let\'s {begin} then!.'}) --, confirmWedding, {})
node4:addChildKeyword({'begin'}, confirmWedding, {})

keywordHandler:addKeyword({'remove'}, confirmRemoveEngage, {})

keywordHandler:addKeyword({'divorce'}, confirmDivorce, {})

npcHandler:setMessage(MESSAGE_GREET, "Welcome in the name of the gods, pilgrim |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Be careful on your journeys.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Be careful on your journeys.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
