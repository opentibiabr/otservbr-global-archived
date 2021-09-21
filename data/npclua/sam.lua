local internalNpcName = "Sam"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 131,
	lookHead = 38,
	lookBody = 113,
	lookLegs = 67,
	lookFeet = 95,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Hello there, adventurer! Need a deal in weapons or armor? I\'m your man!'}
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

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, 'adorn')
			or msgcontains(message, 'outfit')
			or msgcontains(message, 'addon') then
		local addonProgress = player:getStorageValue(Storage.OutfitQuest.Knight.AddonHelmet)
		if addonProgress == 5 then
			player:setStorageValue(Storage.OutfitQuest.Knight.MissionHelmet, 6)
			player:setStorageValue(Storage.OutfitQuest.Knight.AddonHelmet, 6)
			player:setStorageValue(Storage.OutfitQuest.Knight.AddonHelmetTimer, os.time() + 7200)
			npcHandler:say('Oh, Gregor sent you? I see. It will be my pleasure to adorn your helmet. Please give me some time to finish it.', npc, creature)
		elseif addonProgress == 6 then
			if player:getStorageValue(Storage.OutfitQuest.Knight.AddonHelmetTimer) < os.time() then
				player:setStorageValue(Storage.OutfitQuest.Knight.MissionHelmet, 0)
				player:setStorageValue(Storage.OutfitQuest.Knight.AddonHelmet, 7)
				player:setStorageValue(Storage.OutfitQuest.Ref, math.min(0, player:getStorageValue(Storage.OutfitQuest.Ref) - 1))
				player:addOutfitAddon(131, 2)
				player:addOutfitAddon(139, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say('Just in time, |PLAYERNAME|. Your helmet is finished, I hope you like it.', npc, creature)
			else
				npcHandler:say('Please have some patience, |PLAYERNAME|. Forging is hard work!', npc, creature)
			end
		elseif addonProgress == 7 then
			npcHandler:say('I think it\'s one of my masterpieces.', npc, creature)
		else
			npcHandler:say('Sorry, but without the permission of Gregor I cannot help you with this matter.', npc, creature)
		end

	elseif msgcontains(message, "old backpack") or msgcontains(message, "backpack") then
		if player:getStorageValue(Storage.SamsOldBackpack) < 1 then
			npcHandler:say("What? Are you telling me you found my old adventurer's backpack that I lost years ago??", npc, creature)
			npcHandler:setTopic(playerId, 1)
		end

	elseif msgcontains(message, '2000 steel shields') then
		if player:getStorageValue(Storage.WhatAFoolish.Questline) ~= 29
				or player:getStorageValue(Storage.WhatAFoolish.Contract) == 2 then
			npcHandler:say('My offers are weapons, armors, helmets, legs, and shields. If you\'d like to see my offers, ask me for a {trade}.', npc, creature)
			return true
		end

		npcHandler:say('What? You want to buy 2000 steel shields??', npc, creature)
		npcHandler:setTopic(playerId, 2)

	elseif msgcontains(message, 'contract') then
		if player:getStorageValue(Storage.WhatAFoolish.Contract) == 0 then
			npcHandler:say('Have you signed the contract?', npc, creature)
			npcHandler:setTopic(playerId, 4)
		end

	elseif msgcontains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			if player:removeItem(3244, 1) then
				npcHandler:say({
					"Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend Kroox to provide you a special dwarven armor. ...",
					"I will mail him about you immediately. Just tell him, his old buddy Sam is sending you."
				}, npc, creature)
				player:setStorageValue(Storage.SamsOldBackpack, 1)
				player:addAchievement('Backpack Tourist')
			else
				npcHandler:say("You don't have it...", npc, creature)
			end
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 2 then
			npcHandler:say('I can\'t believe it. Finally I will be rich! I could move to Edron and enjoy my retirement! But ... wait a minute! I will not start working without a contract! Are you willing to sign one?', npc, creature)
			npcHandler:setTopic(playerId, 3)
		elseif npcHandler:getTopic(playerId) == 3 then
			player:addItem(129, 1)
			player:setStorageValue(Storage.WhatAFoolish.Contract, 1)
			npcHandler:say('Fine! Here is the contract. Please sign it. Talk to me about it again when you\'re done.', npc, creature)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 4 then
			if not player:removeItem(128, 1) then
				npcHandler:say('You don\'t have a signed contract.', npc, creature)
				npcHandler:setTopic(playerId, 0)
				return true
			end

			player:setStorageValue(Storage.WhatAFoolish.Contract, 2)
			npcHandler:say('Excellent! I will start working right away! Now that I am going to be rich, I will take the opportunity to tell some people what I REALLY think about them!', npc, creature)
			npcHandler:setTopic(playerId, 0)
		end

	elseif msgcontains(message, "no") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("Then no.", npc, creature)
		elseif isInArray({2, 3, 4}, npcHandler:getTopic(playerId)) then
			npcHandler:say("This deal sounded too good to be true anyway.", npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the blacksmith. If you need weapons or armor - just ask me."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my shop, adventurer |PLAYERNAME|! I {trade} with weapons and armor.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "axe", clientId = 3274, sell = 7 },
	{ itemName = "battle axe", clientId = 3266, sell = 80 },
	{ itemName = "battle hammer", clientId = 3305, sell = 120 },
	{ itemName = "battle shield", clientId = 3413, sell = 95 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "bone sword", clientId = 3338, sell = 20 },
	{ itemName = "brass armor", clientId = 3359, sell = 150 },
	{ itemName = "brass helmet", clientId = 3354, sell = 30 },
	{ itemName = "brass legs", clientId = 3372, sell = 49 },
	{ itemName = "brass shield", clientId = 3411, sell = 25 },
	{ itemName = "carlin sword", clientId = 3283, sell = 118 },
	{ itemName = "chain armor", clientId = 3358, sell = 70 },
	{ itemName = "chain helmet", clientId = 3352, sell = 17 },
	{ itemName = "chain legs", clientId = 3558, sell = 25 },
	{ itemName = "club", clientId = 3270, sell = 1 },
	{ itemName = "coat", clientId = 3562, sell = 1 },
	{ itemName = "copper shield", clientId = 3430, sell = 50 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "dagger", clientId = 3267, sell = 2 },
	{ itemName = "double axe", clientId = 3275, sell = 260 },
	{ itemName = "doublet", clientId = 3379, sell = 3 },
	{ itemName = "dwarven shield", clientId = 3425, sell = 100 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000 },
	{ itemName = "halberd", clientId = 3269, sell = 400 },
	{ itemName = "hand axe", clientId = 3268, sell = 4 },
	{ itemName = "hatchet", clientId = 3276, sell = 25 },
	{ itemName = "iron helmet", clientId = 3353, sell = 150 },
	{ itemName = "jacket", clientId = 3561, sell = 1 },
	{ itemName = "katana", clientId = 3300, sell = 35 },
	{ itemName = "leather armor", clientId = 3361, sell = 12 },
	{ itemName = "leather boots", clientId = 3552, sell = 2 },
	{ itemName = "leather helmet", clientId = 3355, sell = 4 },
	{ itemName = "leather legs", clientId = 3559, sell = 9 },
	{ itemName = "legion helmet", clientId = 3374, sell = 22 },
	{ itemName = "longsword", clientId = 3285, sell = 51 },
	{ itemName = "mace", clientId = 3286, sell = 30 },
	{ itemName = "morning star", clientId = 3282, sell = 100 },
	{ itemName = "orcish axe", clientId = 3316, sell = 350 },
	{ itemName = "plate armor", clientId = 3357, sell = 400 },
	{ itemName = "plate legs", clientId = 3557, sell = 115 },
	{ itemName = "plate shield", clientId = 3410, sell = 45 },
	{ itemName = "rapier", clientId = 3272, sell = 5 },
	{ itemName = "sabre", clientId = 3273, sell = 12 },
	{ itemName = "scale armor", clientId = 3377, sell = 75 },
	{ itemName = "short sword", clientId = 3294, sell = 10 },
	{ itemName = "sickle", clientId = 3293, sell = 3 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "soldier helmet", clientId = 3375, sell = 16 },
	{ itemName = "spike sword", clientId = 3271, sell = 240 },
	{ itemName = "steel helmet", clientId = 3351, sell = 293 },
	{ itemName = "steel shield", clientId = 3409, sell = 80 },
	{ itemName = "studded armor", clientId = 3378, sell = 25 },
	{ itemName = "studded club", clientId = 3336, sell = 10 },
	{ itemName = "studded helmet", clientId = 3376, sell = 20 },
	{ itemName = "studded legs", clientId = 3362, sell = 15 },
	{ itemName = "studded shield", clientId = 3426, sell = 16 },
	{ itemName = "swampling club", clientId = 17824, sell = 40 },
	{ itemName = "sword", clientId = 3264, sell = 25 },
	{ itemName = "throwing knife", clientId = 3298, sell = 2 },
	{ itemName = "two handed sword", clientId = 3265, sell = 450 },
	{ itemName = "viking helmet", clientId = 3367, sell = 66 },
	{ itemName = "viking shield", clientId = 3431, sell = 85 },
	{ itemName = "war hammer", clientId = 3279, sell = 470 },
	{ itemName = "wooden shield", clientId = 3412, sell = 5 },
	-- Buyable items
	{ itemName = "axe", clientId = 3274, buy = 20 },
	{ itemName = "battle axe", clientId = 3266, buy = 235 },
	{ itemName = "battle hammer", clientId = 3305, buy = 350 },
	{ itemName = "bone sword", clientId = 3338, buy = 75 },
	{ itemName = "brass armor", clientId = 3359, buy = 450 },
	{ itemName = "brass helmet", clientId = 3354, buy = 120 },
	{ itemName = "brass legs", clientId = 3372, buy = 195 },
	{ itemName = "brass shield", clientId = 3411, buy = 65 },
	{ itemName = "carlin sword", clientId = 3283, buy = 473 },
	{ itemName = "chain armor", clientId = 3358, buy = 200 },
	{ itemName = "chain helmet", clientId = 3352, buy = 52 },
	{ itemName = "chain legs", clientId = 3558, buy = 80 },
	{ itemName = "club", clientId = 3270, buy = 5 },
	{ itemName = "coat", clientId = 3562, buy = 8 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "dagger", clientId = 3267, buy = 5 },
	{ itemName = "doublet", clientId = 3379, buy = 16 },
	{ itemName = "durable exercise axe", clientId = 35280, buy = 945000, count = 1800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 945000, count = 1800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 945000, count = 1800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 945000, count = 1800 },
	{ itemName = "dwarven shield", clientId = 3425, buy = 500 },
	{ itemName = "exercise axe", clientId = 28553, buy = 262500, count = 500 },
	{ itemName = "exercise bow", clientId = 28555, buy = 262500, count = 500 },
	{ itemName = "exercise club", clientId = 28554, buy = 262500, count = 500 },
	{ itemName = "exercise sword", clientId = 28552, buy = 262500, count = 500 },
	{ itemName = "hand axe", clientId = 3268, buy = 8 },
	{ itemName = "iron helmet", clientId = 3353, buy = 390 },
	{ itemName = "jacket", clientId = 3561, buy = 12 },
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 7560000, count = 14400 },
	{ itemName = "leather armor", clientId = 3361, buy = 35 },
	{ itemName = "leather boots", clientId = 3552, buy = 10 },
	{ itemName = "leather helmet", clientId = 3355, buy = 12 },
	{ itemName = "leather legs", clientId = 3559, buy = 10 },
	{ itemName = "longsword", clientId = 3285, buy = 160 },
	{ itemName = "mace", clientId = 3286, buy = 90 },
	{ itemName = "morning star", clientId = 3282, buy = 430 },
	{ itemName = "plate armor", clientId = 3357, buy = 1200 },
	{ itemName = "plate shield", clientId = 3410, buy = 125 },
	{ itemName = "rapier", clientId = 3272, buy = 15 },
	{ itemName = "sabre", clientId = 3273, buy = 35 },
	{ itemName = "scale armor", clientId = 3377, buy = 260 },
	{ itemName = "short sword", clientId = 3294, buy = 26 },
	{ itemName = "sickle", clientId = 3293, buy = 7 },
	{ itemName = "soldier helmet", clientId = 3375, buy = 110 },
	{ itemName = "spike sword", clientId = 3271, buy = 8000 },
	{ itemName = "steel helmet", clientId = 3351, buy = 580 },
	{ itemName = "steel shield", clientId = 3409, buy = 240 },
	{ itemName = "studded armor", clientId = 3378, buy = 90 },
	{ itemName = "studded helmet", clientId = 3376, buy = 63 },
	{ itemName = "studded legs", clientId = 3362, buy = 50 },
	{ itemName = "studded shield", clientId = 3426, buy = 50 },
	{ itemName = "sword", clientId = 3264, buy = 85 },
	{ itemName = "throwing knife", clientId = 3298, buy = 25 },
	{ itemName = "two handed sword", clientId = 3265, buy = 950 },
	{ itemName = "viking helmet", clientId = 3367, buy = 265 },
	{ itemName = "viking shield", clientId = 3431, buy = 260 },
	{ itemName = "war hammer", clientId = 3279, buy = 10000 },
	{ itemName = "wooden shield", clientId = 3412, buy = 15 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)
