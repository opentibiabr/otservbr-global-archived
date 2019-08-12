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

	if(msgcontains(msg, "outfit") or msgcontains(msg, "addon")) then
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
			selfSay("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			selfSay("You will be entitled to wear the {armor} for 500.000.000 gold pieces, {boots} for an additional 250.000.000 and the {helmet} for another 250.000.000 gold pieces. ...", cid)
			selfSay("What will it be?", cid)
			npcHandler.topic[cid] = 2
			end
		if npcHandler.topic[cid] == 3 then
			selfSay("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", cid)
			selfSay("You will be entitled to wear the {armor} for 500.000.000 gold pieces, {boots} for an additional 250.000.000 and the {helmet} for another 250.000.000 gold pieces. ...", cid)
			selfSay("What will it be?", cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 5 then
			if(doPlayerRemoveMoney(cid, 500000000) and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) < 1) then
				npcHandler:say("Take this armor as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
				npcHandler.topic[cid] = 0
				player:addOutfit(1210)
				player:addOutfit(1211)
				player:setStorageValue(Storage.OutfitQuest.GoldenBaseOutfit, 1)
			end
		elseif npcHandler.topic[cid] == 6 then
			if(doPlayerRemoveMoney(cid, 250000000) and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1 and player:getStorageValue(Storage.OutfitQuest.GoldenFirstAddon) < 1) then
				npcHandler:say("Take this boots as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
				npcHandler.topic[cid] = 0
				player:addOutfitAddon(1210, 1)
				player:addOutfitAddon(1211, 1)
				player:setStorageValue(Storage.OutfitQuest.GoldenFirstAddon, 1)
			end
		elseif npcHandler.topic[cid] == 7 then
			if(doPlayerRemoveMoney(cid, 250000000) and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) == 1  and player:getStorageValue(Storage.OutfitQuest.GoldenSecondAddon) < 1) then
				npcHandler:say("Take this helmet as a token of great gratitude. Let us forever remember this day, my friend. ", cid)
				npcHandler.topic[cid] = 0
				player:addOutfitAddon(1210, 2)
				player:addOutfitAddon(1211, 2)
				player:setStorageValue(Storage.OutfitQuest.GoldenSecondAddon, 1)
			end
		end
	elseif(msgcontains(msg, "armor")) and (npcHandler.topic[cid] == 2 and player:getStorageValue(Storage.OutfitQuest.GoldenBaseOutfit) < 1) then
		npcHandler:say("So you would like to donate 500.000.000 gold pieces which in return will entitle you to wear a unique armor?", cid)
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

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- Promotion
local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})


npcHandler:addModule(FocusModule:new())
