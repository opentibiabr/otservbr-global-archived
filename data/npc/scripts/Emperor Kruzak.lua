local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) < 1 then
		if (msg == "outfit") or (msg == "addon") then
			npcHandler:say("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif player:getStorageValue(Storage.OutfitQuest.GoldenFirstAddon) < 1 or player:getStorageValue(Storage.OutfitQuest.GoldenSecondAddon) < 1 and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1 then
		if (msg == "outfit") or (msg == "addon") then
			npcHandler:say("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			npcHandler.topic[cid] = 3
		end
	end
	if(msgcontains(msg, "yes")) and npcHandler.topic[cid] == 1 then
		npcHandler:say({
		"Excellent! Now, let me explain. If you donate 1.000.000.000 gold pieces, you will be entitled to wear a unique outfit. ...",
		"You will be entitled to wear the {armor} for 500.000.000 gold pieces, {boots} for an additional 250.000.000 and the {helmet} for another 250.000.000 gold pieces. ...",
		"What will it be?"
		}, cid)
		npcHandler.topic[cid] = 2
	elseif (msgcontains(msg, "yes")) and npcHandler.topic[cid] == 3 then
		npcHandler:say({
		"Excellent! Now, let me explain. If you donate 1.000.000.000 gold pieces, you will be entitled to wear a unique outfit. ...",
		"You will be entitled to wear the {armor} for 500.000.000 gold pieces, {boots} for an additional 250.000.000 and the {helmet} for another 250.000.000 gold pieces. ...",
		"What will it be?"
		}, cid)
		npcHandler.topic[cid] = 4
	end
		-- armor (golden outfit)
		if player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) < 1 and npcHandler.topic[cid] == 5 and (msgcontains(msg, "yes")) then
			if player:getMoney() + player:getBankBalance() >= 500000000 then
				npcHandler:say("Take this armor as a token of great gratitude. Let us forever remember this day, my friend!", cid)
				player:removeMoneyNpc(500000000)
				player:addOutfit(1211)
				player:addOutfit(1210)
				player:setStorageValue(Storage.OutfitQuest.GoldenBaseOutfit, 1)
				npcHandler.topic[cid] = 0
				else
				npcHandler:say("You do not have enough money to donate that amount.", cid)
			end
		-- boots addon
		elseif (msgcontains(msg, "yes")) and npcHandler.topic[cid] == 6 and player:getStorageValue(Storage.OutfitQuest.GoldenFirstAddon) < 1 then
			if player:getMoney() + player:getBankBalance() >= 250000000 and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1 then
				npcHandler:say("Take this boots as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
				npcHandler.topic[cid] = 0
				player:addOutfitAddon(1210, 2)
				player:addOutfitAddon(1211, 2)
				player:removeMoneyNpc(250000000)
				player:setStorageValue(Storage.OutfitQuest.GoldenFirstAddon, 1)
				else
				npcHandler:say("You do not have enough money to donate that amount.", cid)
			end
		-- helmet addon
		elseif npcHandler.topic[cid] == 7 and (msgcontains(msg, "yes")) then
			if player:getMoney() + player:getBankBalance() >= 250000000 and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1  and player:getStorageValue(Storage.OutfitQuest.GoldenSecondAddon) < 1 then
				npcHandler:say("Take this helmet as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
				npcHandler.topic[cid] = 0
				player:removeMoneyNpc(250000000)
				player:addOutfitAddon(1210, 1)
				player:addOutfitAddon(1211, 1)
				player:setStorageValue(Storage.OutfitQuest.GoldenSecondAddon, 1)
			else
				npcHandler:say("Do not have money helmet", cid)
			end
		end
	if msgcontains(msg, "armor") and npcHandler.topic[cid] == 2 and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) < 1 then
		npcHandler:say("So you wold like to donate 500.000.000 gold pieces which in return will entitle you to wear a unique armor?", cid)
		npcHandler.topic[cid] = 5
	elseif(msgcontains(msg, "boots")) and (npcHandler.topic[cid] == 4 and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1 and player:getStorageValue(Storage.OutfitQuest.GoldenFirstAddon) < 1) then
		npcHandler:say("So you would like to donate 250.000.000 gold pieces which in return will entitle you to wear unique boots?", cid)
		npcHandler.topic[cid] = 6
	elseif(msgcontains(msg, "helmet")) and (npcHandler.topic[cid] == 4 and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1 and player:getStorageValue(Storage.OutfitQuest.GoldenSecondAddon) < 1) then
		npcHandler:say("So you would like to donate 250.000.000 gold pieces which in return will entitle you to wear a unique helmet?", cid)
		npcHandler.topic[cid] = 7
	end
	return true
end

-- Promotion
local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

npcHandler:setMessage(MESSAGE_GREET, 'Hiho, may fire and earth bless you, my child. Are you looking for a promotion?')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell, |PLAYERNAME|, my child!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hail emperor')
npcHandler:addModule(focusModule)