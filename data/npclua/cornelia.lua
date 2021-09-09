local internalNpcName = "Cornelia"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 139,
	lookHead = 95,
	lookBody = 76,
	lookLegs = 100,
	lookFeet = 115,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Quality armors for sale!'}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I run this armoury. If you want to protect your life, you better buy my wares."})

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end

	local player = Player(creature)
	if isInArray({"addon", "armor"}, message) then
		if player:getStorageValue(Storage.OutfitQuest.WarriorShoulderAddon) == 5 then
			player:setStorageValue(Storage.OutfitQuest.WarriorShoulderAddon, 6)
			player:setStorageValue(Storage.OutfitQuest.WarriorShoulderTimer, os.time() + (player:getSex() == PLAYERSEX_FEMALE and 3600 or 7200))
			npcHandler:say('Ah, you must be the hero Trisha talked about. I\'ll prepare the shoulder spikes for you. Please give me some time to finish.', npc, creature)
		elseif player:getStorageValue(Storage.OutfitQuest.WarriorShoulderAddon) == 6 then
			if player:getStorageValue(Storage.OutfitQuest.WarriorShoulderTimer) > os.time() then
				npcHandler:say('I\'m not done yet. Please be as patient as you are courageous.', npc, creature)
			elseif player:getStorageValue(Storage.OutfitQuest.WarriorShoulderTimer) > 0 and player:getStorageValue(Storage.OutfitQuest.WarriorShoulderTimer) < os.time() then
				player:addOutfitAddon(142, 1)
				player:addOutfitAddon(134, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.OutfitQuest.WarriorShoulderAddon, 7)
				player:addAchievementProgress('Wild Warrior', 2)
				npcHandler:say('Finished! Since you are a man, I thought you probably wanted two. Men always want that little extra status symbol. <giggles>', npc, creature)
			else
				npcHandler:say('I\'m selling leather armor, chain armor, and brass armor. Ask me for a {trade} if you like to take a look.', npc, creature)
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to the finest {armor} shop in the land, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Come back soon.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "battle shield", clientId = 3413, sell = 95 },
	{ itemName = "brass armor", clientId = 3359, sell = 150 },
	{ itemName = "brass helmet", clientId = 3354, sell = 30 },
	{ itemName = "brass legs", clientId = 3372, sell = 49 },
	{ itemName = "brass shield", clientId = 3411, sell = 25 },
	{ itemName = "chain armor", clientId = 3358, sell = 70 },
	{ itemName = "chain helmet", clientId = 3352, sell = 17 },
	{ itemName = "chain legs", clientId = 3558, sell = 25 },
	{ itemName = "coat", clientId = 3562, sell = 1 },
	{ itemName = "copper shield", clientId = 3430, sell = 50 },
	{ itemName = "doublet", clientId = 3379, sell = 3 },
	{ itemName = "dwarven shield", clientId = 3425, sell = 100 },
	{ itemName = "iron helmet", clientId = 3353, sell = 150 },
	{ itemName = "jacket", clientId = 3561, sell = 1 },
	{ itemName = "leather armor", clientId = 3361, sell = 12 },
	{ itemName = "leather boots", clientId = 3552, sell = 2 },
	{ itemName = "leather helmet", clientId = 3355, sell = 4 },
	{ itemName = "leather legs", clientId = 3559, sell = 9 },
	{ itemName = "legion helmet", clientId = 3374, sell = 22 },
	{ itemName = "plate armor", clientId = 3357, sell = 400 },
	{ itemName = "plate legs", clientId = 3557, sell = 115 },
	{ itemName = "plate shield", clientId = 3410, sell = 45 },
	{ itemName = "scale armor", clientId = 3377, sell = 75 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "soldier helmet", clientId = 3375, sell = 16 },
	{ itemName = "steel helmet", clientId = 3351, sell = 293 },
	{ itemName = "steel shield", clientId = 3409, sell = 80 },
	{ itemName = "studded armor", clientId = 3378, sell = 25 },
	{ itemName = "studded helmet", clientId = 3376, sell = 20 },
	{ itemName = "studded legs", clientId = 3362, sell = 15 },
	{ itemName = "studded shield", clientId = 3426, sell = 16 },
	{ itemName = "viking helmet", clientId = 3367, sell = 66 },
	{ itemName = "viking shield", clientId = 3431, sell = 85 },
	{ itemName = "wooden shield", clientId = 3412, sell = 5 },
	-- Buyable items
	{ itemName = "brass armor", clientId = 3359, buy = 450 },
	{ itemName = "brass helmet", clientId = 3354, buy = 120 },
	{ itemName = "brass legs", clientId = 3372, buy = 195 },
	{ itemName = "brass shield", clientId = 3411, buy = 65 },
	{ itemName = "chain armor", clientId = 3358, buy = 200 },
	{ itemName = "chain helmet", clientId = 3352, buy = 52 },
	{ itemName = "chain legs", clientId = 3558, buy = 80 },
	{ itemName = "coat", clientId = 3562, buy = 8 },
	{ itemName = "doublet", clientId = 3379, buy = 16 },
	{ itemName = "dwarven shield", clientId = 3425, buy = 500 },
	{ itemName = "iron helmet", clientId = 3353, buy = 390 },
	{ itemName = "jacket", clientId = 3561, buy = 12 },
	{ itemName = "leather armor", clientId = 3361, buy = 35 },
	{ itemName = "leather boots", clientId = 3552, buy = 10 },
	{ itemName = "leather helmet", clientId = 3355, buy = 12 },
	{ itemName = "leather legs", clientId = 3559, buy = 10 },
	{ itemName = "plate armor", clientId = 3357, buy = 1200 },
	{ itemName = "plate shield", clientId = 3410, buy = 125 },
	{ itemName = "scale armor", clientId = 3377, buy = 260 },
	{ itemName = "soldier helmet", clientId = 3375, buy = 110 },
	{ itemName = "steel helmet", clientId = 3351, buy = 580 },
	{ itemName = "steel shield", clientId = 3409, buy = 240 },
	{ itemName = "studded armor", clientId = 3378, buy = 90 },
	{ itemName = "studded helmet", clientId = 3376, buy = 63 },
	{ itemName = "studded legs", clientId = 3362, buy = 50 },
	{ itemName = "studded shield", clientId = 3426, buy = 50 },
	{ itemName = "viking helmet", clientId = 3367, buy = 265 },
	{ itemName = "viking shield", clientId = 3431, buy = 260 },
	{ itemName = "wooden shield", clientId = 3412, buy = 15 }
}
-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost), npc, player)
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, amount, name, totalCost, clientId)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)
