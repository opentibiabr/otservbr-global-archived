local internalNpcName = "Emperor Kruzak"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 66,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onAppear = function(npc, creature)
npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
npcHandler:onThink(npc, interval)	
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then 
		return false 
	end
	local player = Player(creature)
	if(msgcontains(message, "outfit")) or (msgcontains(message, "addon")) then
		selfSay("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", npc, creature)
		npcHandler.topic[creature] = 1
	elseif(msgcontains(message, "yes")) then
		-- vamos tratar todas condições para YES aqui
		if npcHandler.topic[creature] == 1 then
			-- para o primeiro Yes, o npc deve explicar como obter o outfit
			selfSay("Excellent! Now, let me explain. If you donate 1.000.000.000 gold pieces, you will be entitled to wear a unique outfit. ...", npc, creature)
			selfSay("You will be entitled to wear the {armor} for 500.000.000 gold pieces, {helmet} for an additional 250.000.000 and the {boots} for another 250.000.000 gold pieces. ...", npc, creature)
			selfSay("What will it be?", npc, creature)
			npcHandler.topic[creature] = 2
		-- O NPC só vai oferecer os addons se o player já tiver escolhido.
		elseif npcHandler.topic[creature] == 2 then
			-- caso o player repita o yes, resetamos o tópico para começar de novo?
			selfSay("In that case, return to me once you made up your mind.", npc, creature)
			npcHandler.topic[creature] = 0
		-- Inicio do outfit
		elseif npcHandler.topic[creature] == 3 then -- ARMOR/OUTFIT
			if player:getStorageValue(Storage.OutfitQuest.GoldenOutfit) < 1 then
				if player:getMoney() + player:getBankBalance() >= 500000000 then
					local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
					if inbox and inbox:getEmptySlots() > 0 then
						local decoKit = inbox:addItem(26054, 1)
						local decoItemName = ItemType(36345):getName()
							decoKit:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "You bought this item in the Store.\nUnwrap it in your own house to create a " .. decoItemName .. ".")
							decoKit:setActionId(36345)
							selfSay("Take this armor as a token of great gratitude. Let us forever remember this day, my friend!", npc, creature)
							player:removeMoneyNpc(500000000)
							player:addOutfit(1211)
							player:addOutfit(1210)
							player:getPosition():sendMagicEffect(171)
							player:setStorageValue(Storage.OutfitQuest.GoldenOutfit, 1)
					else
						selfSay("Please make sure you have free slots in your store inbox.", npc, creature)
					end				
				else
					selfSay("You do not have enough money to donate that amount.", npc, creature)
				end
			else
				selfSay("You alread have that addon.", npc, creature)
			end
			npcHandler.topic[creature] = 2
		-- Fim do outfit
		-- Inicio do helmet
		elseif npcHandler.topic[creature] == 4 then
			if player:getStorageValue(Storage.OutfitQuest.GoldenOutfit) == 1 then
				if player:getStorageValue(Storage.OutfitQuest.GoldenOutfit) < 2 then
					if player:getMoney() + player:getBankBalance() >= 250000000 then
						selfSay("Take this helmet as a token of great gratitude. Let us forever remember this day, my friend. ", npc, creature)
						player:removeMoneyNpc(250000000)
						player:addOutfitAddon(1210, 1)
						player:addOutfitAddon(1211, 1)
						player:getPosition():sendMagicEffect(171)
						player:setStorageValue(Storage.OutfitQuest.GoldenOutfit, 2)
						npcHandler.topic[creature] = 2
					else
						selfSay("You do not have enough money to donate that amount.", npc, creature)
						npcHandler.topic[creature] = 2
					end
				else
					selfSay("You alread have that outfit.", npc, creature)
					npcHandler.topic[creature] = 2
				end
			else
				selfSay("You need to donate {armor} outfit first.", npc, creature)
				npcHandler.topic[creature] = 2
			end
			npcHandler.topic[creature] = 2
		-- Fim do helmet
		-- Inicio da boots
		elseif npcHandler.topic[creature] == 5 then
			if player:getStorageValue(Storage.OutfitQuest.GoldenOutfit) == 2 then
				if player:getStorageValue(Storage.OutfitQuest.GoldenOutfit) < 3 then
					if player:getMoney() + player:getBankBalance() >= 250000000 then
						selfSay("Take this boots as a token of great gratitude. Let us forever remember this day, my friend. ", npc, creature)
						player:removeMoneyNpc(250000000)
						player:addOutfitAddon(1210, 2)
						player:addOutfitAddon(1211, 2)
						player:getPosition():sendMagicEffect(171)
						player:setStorageValue(Storage.OutfitQuest.GoldenOutfit, 3)
						npcHandler.topic[creature] = 2
					else
						selfSay("You do not have enough money to donate that amount.", npc, creature)
						npcHandler.topic[creature] = 2
					end
				else
					selfSay("You alread have that outfit.", npc, creature)
					npcHandler.topic[creature] = 2
				end
			else
				selfSay("You need to donate {helmet} addon first.", npc, creature)
				npcHandler.topic[creature] = 2
			end
			-- Fim da boots
			npcHandler.topic[creature] = 2
	end
	--inicio das opções armor/helmet/boots
	-- caso o player não diga YES, dirá alguma das seguintes palavras:
	elseif(msgcontains(message, "armor")) and npcHandler.topic[creature] == 2 then
		selfSay("So you wold like to donate 500.000.000 gold pieces which in return will entitle you to wear a unique armor?", npc, creature)
		npcHandler.topic[creature] = 3 -- alterando o tópico para que no próximo YES ele faça o outfit
	elseif(msgcontains(message, "helmet")) and npcHandler.topic[creature] == 2 then
		selfSay("So you would like to donate 250.000.000 gold pieces which in return will entitle you to wear unique helmet?", npc, creature)
		npcHandler.topic[creature] = 4 -- alterando o tópico para que no próximo YES ele faça o helmet
	elseif(msgcontains(message, "boots")) and npcHandler.topic[creature] == 2 then
		selfSay("So you would like to donate 250.000.000 gold pieces which in return will entitle you to wear a unique boots?", npc, creature)
		npcHandler.topic[creature] = 5 -- alterando o tópico para que no próximo YES ele faça a boots
	end
	-- fim das opções armor/helmet/boots
end

-- Promotion
local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})
	
-- Greeting message
keywordHandler:addGreetKeyword({"hail emperor"}, {npcHandler = npcHandler, text = "Hiho, may fire and earth bless you, my child. Are you looking for a promotion?"})
keywordHandler:addGreetKeyword({"salutations emperor"}, {npcHandler = npcHandler, text = "Hiho, may fire and earth bless you, my child. Are you looking for a promotion?"})

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell, |PLAYERNAME|, my child!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
