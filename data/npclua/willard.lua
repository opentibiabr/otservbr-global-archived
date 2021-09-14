local internalNpcName = "Willard"
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
	lookHead = 58,
	lookBody = 104,
	lookLegs = 0,
	lookFeet = 116,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Selling weapons, ammunition and armor. Special offers only available here, have a look!'}
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
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, "package for rashid") then
		if player:getStorageValue(Storage.TravellingTrader.Mission02) >= 1 and player:getStorageValue(Storage.TravellingTrader.Mission02) < 3 then
			npcHandler:say({
				"Oooh, damn, I completely forgot about that. I was supposed to pick it up from the Outlaw Camp. ...",
				"I can't leave my shop here right now, please go and talk to Snake Eye about that package... I promise he won't make any trouble. ...",
				"Don't tell Rashid! I really don't want him to know that I forgot his order. Okay?"
			}, npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say("Thank you, I appreciate it. Don't forget to mention the package to Snake.", npc, creature)
			player:setStorageValue(Storage.TravellingTrader.Mission02, player:getStorageValue(Storage.TravellingTrader.Mission02) + 1)
			npcHandler.topic[playerId] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings and Banor be with you, |PLAYERNAME|! May I interest you in a {trade} for weapons, ammunition or armor?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. If you're only interested in {distance} equipment, let me know.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "axe", clientId = 3274, sell = 7 },
	{ itemName = "barbarian axe", clientId = 3317, sell = 185 },
	{ itemName = "battle axe", clientId = 3266, sell = 80 },
	{ itemName = "battle hammer", clientId = 3305, sell = 120 },
	{ itemName = "battle shield", clientId = 3413, sell = 95 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "bone sword", clientId = 3338, sell = 20 },
	{ itemName = "bow", clientId = 3350, sell = 100 },
	{ itemName = "brass armor", clientId = 3359, sell = 150 },
	{ itemName = "brass helmet", clientId = 3354, sell = 30 },
	{ itemName = "brass legs", clientId = 3372, sell = 49 },
	{ itemName = "brass shield", clientId = 3411, sell = 25 },
	{ itemName = "carlin sword", clientId = 3283, sell = 118 },
	{ itemName = "chain armor", clientId = 3358, sell = 70 },
	{ itemName = "chain helmet", clientId = 3352, sell = 17 },
	{ itemName = "chain legs", clientId = 3558, sell = 25 },
	{ itemName = "clerical mace", clientId = 3311, sell = 170 },
	{ itemName = "club", clientId = 3270, sell = 1 },
	{ itemName = "coat", clientId = 3562, sell = 1 },
	{ itemName = "copper shield", clientId = 3430, sell = 50 },
	{ itemName = "crossbow", clientId = 3349, sell = 120 },
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
	{ itemName = "soldier helmet", clientId = 3375, sell = 16 },
	{ itemName = "spear", clientId = 3277, sell = 3 },
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
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "axe", clientId = 3274, buy = 20 },
	{ itemName = "barbarian axe", clientId = 3317, buy = 590 },
	{ itemName = "battle axe", clientId = 3266, buy = 235 },
	{ itemName = "battle hammer", clientId = 3305, buy = 350 },
	{ itemName = "blue quiver", clientId = 35848, buy = 400 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "bone sword", clientId = 3338, buy = 75 },
	{ itemName = "bow", clientId = 3350, buy = 400 },
	{ itemName = "brass armor", clientId = 3359, buy = 450 },
	{ itemName = "brass helmet", clientId = 3354, buy = 120 },
	{ itemName = "brass legs", clientId = 3372, buy = 195 },
	{ itemName = "brass shield", clientId = 3411, buy = 65 },
	{ itemName = "carlin sword", clientId = 3283, buy = 473 },
	{ itemName = "chain armor", clientId = 3358, buy = 200 },
	{ itemName = "chain helmet", clientId = 3352, buy = 52 },
	{ itemName = "chain legs", clientId = 3558, buy = 80 },
	{ itemName = "clerical mace", clientId = 3311, buy = 540 },
	{ itemName = "club", clientId = 3270, buy = 5 },
	{ itemName = "coat", clientId = 3562, buy = 8 },
	{ itemName = "crimson sword", clientId = 7385, buy = 610 },
	{ itemName = "crossbow", clientId = 3349, buy = 500 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "crystalline arrow", clientId = 15793, buy = 20 },
	{ itemName = "dagger", clientId = 3267, buy = 5 },
	{ itemName = "diamond arrow", clientId = 35901, buy = 100 },
	{ itemName = "doublet", clientId = 3379, buy = 16 },
	{ itemName = "drill bolt", clientId = 16142, buy = 12 },
	{ itemName = "durable exercise axe", clientId = 35280, buy = 945000, count = 1800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 945000, count = 1800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 945000, count = 1800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 945000, count = 1800 },
	{ itemName = "dwarven shield", clientId = 3425, buy = 500 },
	{ itemName = "earth arrow", clientId = 774, buy = 5 },
	{ itemName = "envenomed arrow", clientId = 16143, buy = 12 },
	{ itemName = "exercise axe", clientId = 28553, buy = 262500, count = 500 },
	{ itemName = "exercise bow", clientId = 28555, buy = 262500, count = 500 },
	{ itemName = "exercise club", clientId = 28554, buy = 262500, count = 500 },
	{ itemName = "exercise sword", clientId = 28552, buy = 262500, count = 500 },
	{ itemName = "flaming arrow", clientId = 763, buy = 5 },
	{ itemName = "flash arrow", clientId = 761, buy = 5 },
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
	{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
	{ itemName = "piercing bolt", clientId = 7363, buy = 5 },
	{ itemName = "plate armor", clientId = 3357, buy = 1200 },
	{ itemName = "plate shield", clientId = 3410, buy = 125 },
	{ itemName = "power bolt", clientId = 3450, buy = 7 },
	{ itemName = "prismatic bolt", clientId = 16141, buy = 20 },
	{ itemName = "quiver", clientId = 35562, buy = 400 },
	{ itemName = "rapier", clientId = 3272, buy = 15 },
	{ itemName = "red quiver", clientId = 35849, buy = 400 },
	{ itemName = "sabre", clientId = 3273, buy = 35 },
	{ itemName = "scale armor", clientId = 3377, buy = 260 },
	{ itemName = "shiver arrow", clientId = 762, buy = 5 },
	{ itemName = "short sword", clientId = 3294, buy = 26 },
	{ itemName = "sickle", clientId = 3293, buy = 7 },
	{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
	{ itemName = "soldier helmet", clientId = 3375, buy = 110 },
	{ itemName = "spear", clientId = 3277, buy = 9 },
	{ itemName = "spectral bolt", clientId = 35902, buy = 70 },
	{ itemName = "spike sword", clientId = 3271, buy = 8000 },
	{ itemName = "steel helmet", clientId = 3351, buy = 580 },
	{ itemName = "steel shield", clientId = 3409, buy = 240 },
	{ itemName = "studded armor", clientId = 3378, buy = 90 },
	{ itemName = "studded helmet", clientId = 3376, buy = 63 },
	{ itemName = "studded legs", clientId = 3362, buy = 50 },
	{ itemName = "studded shield", clientId = 3426, buy = 50 },
	{ itemName = "sword", clientId = 3264, buy = 85 },
	{ itemName = "tarsal arrow", clientId = 14251, buy = 6 },
	{ itemName = "throwing knife", clientId = 3298, buy = 25 },
	{ itemName = "throwing star", clientId = 3287, buy = 42 },
	{ itemName = "two handed sword", clientId = 3265, buy = 950 },
	{ itemName = "viking helmet", clientId = 3367, buy = 265 },
	{ itemName = "viking shield", clientId = 3431, buy = 260 },
	{ itemName = "vortex bolt", clientId = 14252, buy = 6 },
	{ itemName = "war hammer", clientId = 3279, buy = 10000 },
	{ itemName = "wooden shield", clientId = 3412, buy = 15 }
}
-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost))
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, clientId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)
