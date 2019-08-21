 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

local player = Player(cid)
local outfitArmor = (500*1000*1000)
local outfitHelmet = (250*1000*1000)
local outfitBoots = (250*1000*1000)

	if(msgcontains(msg, "outfit") or msgcontains(msg, "addon") ) then
		if player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) <= 1 then
			npcHandler:say("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			npcHandler.topic[cid] = 1
		end
	end


	if(msgcontains(msg, "outfit") or msgcontains(msg, "addon")) then
		if player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1 and player:getStorageValue(Storage.OutfitQuest.GoldenFirstAddon) < 1 then
			npcHandler:say("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1 and player:getStorageValue(Storage.OutfitQuest.GoldenSecondAddon) < 1 then
			npcHandler:say("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			npcHandler:say("You will be entitled to wear the {armor} for 500.000.000 gold pieces, {boots} for an additional 250.000.000 and the {helmet} for another 250.000.000 gold pieces. ...", cid)
			npcHandler:say("What will it be?", cid)
			npcHandler.topic[cid] = 2
		end



	elseif(msgcontains(msg, "armor")) then
		if(player:getMoney() + player:getBankBalance() >= outfitArmor and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) < 1) then
			npcHandler:say("Take this armor as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
			player:removeMoneyNpc(outfitArmor)
			player:addOutfit(1210)
			player:addOutfit(1211)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.OutfitQuest.GoldenBaseOutfit, 1)
		elseif(player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1) then
			npcHandler:say("You already have this outfit!", cid)
			npcHandler.topic[cid] = 0
		elseif(player:getMoney() + player:getBankBalance() < outfitArmor) then
			npcHandler:say("You dont have enough money", cid)
			npcHandler.topic[cid] = 0
		end

	elseif(msgcontains(msg, "boots")) then
		if(player:getMoney() + player:getBankBalance() >= outfitHelmet and player:getStorageValue(Storage.OutfitQuest.GoldenFirstAddon) < 1) then
			npcHandler:say("Take this armor as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
			player:removeMoneyNpc(outfitHelmet)
			player:addOutfitAddon(1210, 1)
			player:addOutfitAddon(1211, 1)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.OutfitQuest.GoldenFirstAddon, 1)
		elseif(player:getStorageValue(Storage.OutfitQuest.GoldenFirstAddon) == 1) then
			npcHandler:say("You already have this outfit!", cid)
			npcHandler.topic[cid] = 0
		elseif(player:getMoney() + player:getBankBalance() < outfitHelmet) then
			npcHandler:say("You dont have enough money", cid)
			npcHandler.topic[cid] = 0
		end


	elseif(msgcontains(msg, "helmet")) then
		if(player:getMoney() + player:getBankBalance() >= outfitBoots and player:getStorageValue(Storage.OutfitQuest.GoldenSecondAddon) < 1) then
			npcHandler:say("Take this armor as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
			player:removeMoneyNpc(outfitBoots)
			player:addOutfitAddon(1210, 2)
			player:addOutfitAddon(1211, 2)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.OutfitQuest.GoldenSecondAddon, 1)
		elseif(player:getStorageValue(Storage.OutfitQuest.GoldenSecondAddon) == 1) then
			npcHandler:say("You already have this outfit!", cid)
			npcHandler.topic[cid] = 0
		elseif(player:getMoney() + player:getBankBalance() < outfitBoots) then
			npcHandler:say("You dont have enough money", cid)
			npcHandler.topic[cid] = 0
			end
		end
	return true
end

-- Promotion
local node1 = keywordHandler:addKeyword({'promot' or 'promotion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

npcHandler:setMessage(MESSAGE_GREET, 'Hiho, may fire and earth bless you, my child. Are you looking for a promotion?')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell, |PLAYERNAME|, my child!')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hail king')
focusModule:addGreetMessage('salutations king')
npcHandler:addModule(focusModule)
