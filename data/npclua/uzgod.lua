local internalNpcName = "Uzgod"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 96,
	lookBody = 60,
	lookLegs = 97,
	lookFeet = 116
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

local function creatureSayCallback(npc, creature, type, message)
	if(not npcHandler:isFocused(creature)) then
		return false
	end
	local player = Player(creature)
	if(msgcontains(message, "piece of draconian steel")) then
		npcHandler:say("You bringing me draconian steel and obsidian lance in exchange for obsidian knife?", npc, creature)
		npcHandler.topic[creature] = 15
	elseif(msgcontains(message, "yes") and npcHandler.topic[creature] == 15) then
		if player:getItemCount(5889) >= 1 and player:getItemCount(2425) >= 1 then
			if player:removeItem(5889, 1) and player:removeItem(2425, 1) then
				npcHandler:say("Here you have it.", npc, creature)
				player:addItem(5908, 1)
				npcHandler.topic[creature] = 0
			end
		else
			npcHandler:say("You don\'t have these items.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	end

	if(msgcontains(message, "pickaxe")) then
		if player:getStorageValue(Storage.ExplorerSociety.JoiningTheExplorers) == 1 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 1 then
			npcHandler:say("True dwarven pickaxes having to be maded by true weaponsmith! You wanting to get pickaxe for explorer society?", npc, creature)
			npcHandler.topic[creature] = 1
		end
	elseif(msgcontains(message, "crimson sword")) then
		if player:getStorageValue(Storage.TravellingTrader.Mission05) == 1 then
			npcHandler:say("Me don't sell crimson sword.", npc, creature)
			npcHandler.topic[creature] = 5
		end
	elseif(msgcontains(message, "forge")) then
		if(npcHandler.topic[creature] == 5) then
			npcHandler:say("You telling me to forge one?! Especially for you? You making fun of me?", npc, creature)
			npcHandler.topic[creature] = 6
		end
	elseif(msgcontains(message, "brooch")) then
		if player:getStorageValue(Storage.ExplorerSociety.JoiningTheExplorers) == 2 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 2 then
			npcHandler:say("You got me brooch?", npc, creature)
			npcHandler.topic[creature] = 3
		end
	elseif(msgcontains(message, "yes")) then
		if(npcHandler.topic[creature] == 1) then
			npcHandler:say("Me order book quite full is. But telling you what: You getting me something me lost and Uzgod seeing that your pickaxe comes first. Jawoll! You interested?", npc, creature)
			npcHandler.topic[creature] = 2
		elseif(npcHandler.topic[creature] == 2) then
			npcHandler:say("Good good. You listening: Me was stolen valuable heirloom. Brooch from my family. Good thing is criminal was caught. Bad thing is, criminal now in dwarven prison of dwacatra is and must have taken brooch with him ...", npc, creature)
			npcHandler:say("To get into dwacatra you having to get several keys. Each key opening way to other key until you get key to dwarven prison ...", npc, creature)
			npcHandler:say("Last key should be in the generals quarter near armory. Only General might have key to enter there too. But me not knowing how to enter Generals private room at barracks. You looking on your own ...", npc, creature)
			npcHandler:say("When got key, then you going down to dwarven prison and getting me that brooch. Tell me that you got brooch when having it.", npc, creature)
			npcHandler.topic[creature] = 0
			player:setStorageValue(Storage.ExplorerSociety.JoiningTheExplorers, 2)
			player:setStorageValue(Storage.ExplorerSociety.DwacatraDoor, 1)
			player:setStorageValue(Storage.ExplorerSociety.QuestLine, 2)
		elseif(npcHandler.topic[creature] == 3) then
			if player:removeItem(4845, 1) then -----
				npcHandler:say("Thanking you for brooch. Me guessing you now want your pickaxe?", npc, creature)
				npcHandler.topic[creature] = 4
			end
		elseif(npcHandler.topic[creature] == 4) then
			npcHandler:say("Here you have it.", npc, creature)
			player:addItem(4874, 1) -----
			player:setStorageValue(Storage.ExplorerSociety.JoiningTheExplorers, 3)
			player:setStorageValue(Storage.ExplorerSociety.QuestLine, 3)
			npcHandler.topic[creature] = 0
		elseif(npcHandler.topic[creature] == 9) then
			if player:getMoney() + player:getBankBalance() >= 250 and player:getItemCount(5880) >= 3 then
				if player:removeMoneyNpc(250) and player:removeItem(5880, 3) then
					npcHandler:say("Ah, that's how me like me customers. Ok, me do this... <pling pling> ... another fine swing of the hammer here and there... <ploing>... here you have it!", npc, creature)
					player:addItem(7385, 1)
					player:setStorageValue(Storage.TravellingTrader.Mission05, 2)
					npcHandler.topic[creature] = 0
				end
			end
		end
	elseif(msgcontains(message, "no")) then
		if(npcHandler.topic[creature] == 6) then
			npcHandler:say("Well. Thinking about it, me a smith, so why not. 1000 gold for your personal crimson sword. Ok?", npc, creature)
			npcHandler.topic[creature] = 7
		elseif(npcHandler.topic[creature] == 7) then
			npcHandler:say("Too expensive?! You think me work is cheap? Well, if you want cheap, I can make cheap. Hrmpf. I make cheap sword for 300 gold. Ok?", npc, creature)
			npcHandler.topic[creature] = 8
		elseif(npcHandler.topic[creature] == 8) then
			npcHandler:say("Cheap but good quality? Impossible. Unless... you bring material. Three iron ores, 250 gold. Okay?", npc, creature)
			npcHandler.topic[creature] = 9
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "axe", clientId = 3274, sell = 7 },
	{ itemName = "battle axe", clientId = 3266, sell = 80 },
	{ itemName = "battle hammer", clientId = 3305, sell = 120 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "bone sword", clientId = 3338, sell = 20 },
	{ itemName = "carlin sword", clientId = 3283, sell = 118 },
	{ itemName = "club", clientId = 3270, sell = 1 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "dagger", clientId = 3267, sell = 2 },
	{ itemName = "double axe", clientId = 3275, sell = 260 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000 },
	{ itemName = "halberd", clientId = 3269, sell = 310 },
	{ itemName = "hand axe", clientId = 3268, sell = 4 },
	{ itemName = "hatchet", clientId = 3276, sell = 25 },
	{ itemName = "katana", clientId = 3300, sell = 35 },
	{ itemName = "longsword", clientId = 3285, sell = 51 },
	{ itemName = "mace", clientId = 3286, sell = 30 },
	{ itemName = "morning star", clientId = 3282, sell = 100 },
	{ itemName = "orcish axe", clientId = 3316, sell = 350 },
	{ itemName = "rapier", clientId = 3272, sell = 5 },
	{ itemName = "sabre", clientId = 3273, sell = 12 },
	{ itemName = "short sword", clientId = 3294, sell = 10 },
	{ itemName = "sickle", clientId = 3293, sell = 3 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "spear", clientId = 3277, sell = 3 },
	{ itemName = "spike sword", clientId = 3271, sell = 240 },
	{ itemName = "studded club", clientId = 3336, sell = 10 },
	{ itemName = "swampling club", clientId = 17824, sell = 40 },
	{ itemName = "sword", clientId = 3264, sell = 25 },
	{ itemName = "throwing knife", clientId = 3298, sell = 2 },
	{ itemName = "two handed sword", clientId = 3265, sell = 450 },
	{ itemName = "war hammer", clientId = 3279, sell = 470 },
	-- Buyable items
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "axe", clientId = 3274, buy = 20 },
	{ itemName = "battle axe", clientId = 3266, buy = 235 },
	{ itemName = "battle hammer", clientId = 3305, buy = 350 },
	{ itemName = "blue quiver", clientId = 35848, buy = 400 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "bone sword", clientId = 3338, buy = 75 },
	{ itemName = "bow", clientId = 3350, buy = 400 },
	{ itemName = "carlin sword", clientId = 3283, buy = 473 },
	{ itemName = "club", clientId = 3270, buy = 5 },
	{ itemName = "crossbow", clientId = 3349, buy = 500 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "dagger", clientId = 3267, buy = 5 },
	{ itemName = "durable exercise axe", clientId = 35280, buy = 945000, count = 1800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 945000, count = 1800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 945000, count = 1800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 945000, count = 1800 },
	{ itemName = "exercise axe", clientId = 28553, buy = 262500, count = 500 },
	{ itemName = "exercise bow", clientId = 28555, buy = 262500, count = 500 },
	{ itemName = "exercise club", clientId = 28554, buy = 262500, count = 500 },
	{ itemName = "exercise sword", clientId = 28552, buy = 262500, count = 500 },
	{ itemName = "hand axe", clientId = 3268, buy = 8 },
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 7560000, count = 14400 },
	{ itemName = "longsword", clientId = 3285, buy = 160 },
	{ itemName = "mace", clientId = 3286, buy = 90 },
	{ itemName = "morning star", clientId = 3282, buy = 430 },
	{ itemName = "quiver", clientId = 35562, buy = 400 },
	{ itemName = "rapier", clientId = 3272, buy = 15 },
	{ itemName = "red quiver", clientId = 35849, buy = 400 },
	{ itemName = "sabre", clientId = 3273, buy = 35 },
	{ itemName = "short sword", clientId = 3294, buy = 26 },
	{ itemName = "sickle", clientId = 3293, buy = 7 },
	{ itemName = "spear", clientId = 3277, buy = 9 },
	{ itemName = "spike sword", clientId = 3271, buy = 8000 },
	{ itemName = "sword", clientId = 3264, buy = 85 },
	{ itemName = "throwing knife", clientId = 3298, buy = 25 },
	{ itemName = "two handed sword", clientId = 3265, buy = 950 },
	{ itemName = "war hammer", clientId = 3279, buy = 10000 }
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
