local internalNpcName = "Alesar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 80
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.shop = {
	-- Sellable items
	{ itemName = "ancient shield", clientId = 3432, sell = 900 },
	{ itemName = "black shield", clientId = 3429, sell = 800 },
	{ itemName = "bonebreaker", clientId = 7428, sell = 10000 },
	{ itemName = "dark armor", clientId = 3383, sell = 400 },
	{ itemName = "dark helmet", clientId = 3384, sell = 250 },
	{ itemName = "dragon hammer", clientId = 3322, sell = 2000 },
	{ itemName = "dreaded cleaver", clientId = 7419, sell = 15000 },
	{ itemName = "giant sword", clientId = 3281, sell = 17000 },
	{ itemName = "haunted blade", clientId = 7407, sell = 8000 },
	{ itemName = "knight armor", clientId = 3370, sell = 5000 },
	{ itemName = "knight axe", clientId = 3318, sell = 2000 },
	{ itemName = "knight legs", clientId = 3371, sell = 5000 },
	{ itemName = "mystic turban", clientId = 3574, sell = 150 },
	{ itemName = "onyx flail", clientId = 7421, sell = 22000 },
	{ itemName = "ornamented axe", clientId = 7411, sell = 20000 },
	{ itemName = "poison dagger", clientId = 3299, sell = 50 },
	{ itemName = "scimitar", clientId = 3307, sell = 150 },
	{ itemName = "serpent sword", clientId = 3297, sell = 900 },
	{ itemName = "skull staff", clientId = 3324, sell = 6000 },
	{ itemName = "strange helmet", clientId = 3373, sell = 500 },
	{ itemName = "titan axe", clientId = 7413, sell = 4000 },
	{ itemName = "tower shield", clientId = 3428, sell = 8000 },
	{ itemName = "vampire shield", clientId = 3434, sell = 15000 },
	{ itemName = "warrior helmet", clientId = 3369, sell = 5000 },
	-- Buyable items
	{ itemName = "ancient shield", clientId = 3432, buy = 5000 },
	{ itemName = "dark armor", clientId = 3383, buy = 1500 },
	{ itemName = "dark helmet", clientId = 3384, buy = 1000 },
	{ itemName = "ice rapier", clientId = 3284, buy = 5000 },
	{ itemName = "serpent sword", clientId = 3297, buy = 6000 }
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
	if not npcHandler:isFocused(creature) then
		return false
	end

	local player = Player(creature)
	local missionProgress = player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission02)
	if msgcontains(message, "mission") then
		if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission01) == 3 then
			if missionProgress < 1 then
				npcHandler:say({
					"So Baa'leal thinks you are up to do a mission for us? ...",
					"I think he is getting old, entrusting human scum such as you are with an important mission like that. ...",
					"Personally, I don't understand why you haven't been slaughtered right at the gates. ...",
					"Anyway. Are you prepared to embark on a dangerous mission for us?"
				}, npc, creature)
				npcHandler.topic[creature] = 1

			elseif isInArray({1, 2}, missionProgress) then
				npcHandler:say("Did you find the tear of Daraman?", npc, creature)
				npcHandler.topic[creature] = 2
			else
				npcHandler:say("Don't forget to talk to Malor concerning your next mission.", npc, creature)
			end
		end

	elseif npcHandler.topic[creature] == 1 then
		if msgcontains(message, "yes") then
			npcHandler:say({
				"All right then, human. Have you ever heard of the {'Tears of Daraman'}? ...",
				"They are precious gemstones made of some unknown blue mineral and possess enormous magical power. ...",
				"If you want to learn more about these gemstones don't forget to visit our library. ...",
				"Anyway, one of them is enough to create thousands of our mighty djinn blades. ...",
				"Unfortunately my last gemstone broke and therefore I'm not able to create new blades anymore. ...",
				"To my knowledge there is only one place where you can find these gemstones - I know for a fact that the Marid have at least one of them. ...",
				"Well... to cut a long story short, your mission is to sneak into Ashta'daramai and to steal it. ...",
				"Needless to say, the Marid won't be too eager to part with it. Try not to get killed until you have delivered the stone to me."
			}, npc, creature)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission02, 1)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.DoorToMaridTerritory, 1)

		elseif msgcontains(message, "no") then
			npcHandler:say("Then not.", npc, creature)
		end
		npcHandler.topic[creature] = 0

	elseif npcHandler.topic[creature] == 2 then
		if msgcontains(message, "yes") then
			if player:getItemCount(2346) == 0 or missionProgress ~= 2 then
				npcHandler:say("As I expected. You haven't got the stone. Shall I explain your mission again?", npc, creature)
				npcHandler.topic[creature] = 1
			else
				npcHandler:say({
					"So you have made it? You have really managed to steal a Tear of Daraman? ...",
					"Amazing how you humans are just impossible to get rid of. Incidentally, you have this character trait in common with many insects and with other vermin. ...",
					"Nevermind. I hate to say it, but it you have done us a favour, human. That gemstone will serve us well. ...",
					"Baa'leal, wants you to talk to Malor concerning some new mission. ...",
					"Looks like you have managed to extended your life expectancy - for just a bit longer."
				}, npc, creature)
				player:removeItem(2346, 1)
				player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission02, 3)
				npcHandler.topic[creature] = 0
			end

		elseif msgcontains(message, "no") then
			npcHandler:say("As I expected. You haven't got the stone. Shall I explain your mission again?", npc, creature)
			npcHandler.topic[creature] = 1
		end
	end
	return true
end

local function onTradeRequest(creature)
	local player = Player(creature)
	if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) ~= 3 then
		npcHandler:say("I'm sorry, but you don't have Malor's permission to trade with me.", npc, creature)
		return false
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, |PLAYERNAME|?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Finally.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Finally.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "At your service, just browse through my wares.")

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
