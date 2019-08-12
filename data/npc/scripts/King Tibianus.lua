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

keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, text = 'Feel free to buy it in our town\'s fine shops.'})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask the royal cook for some food.'})
keywordHandler:addKeyword({'tax collector'}, StdModule.say, {npcHandler = npcHandler, text = 'That tax collector is the bane of my life. He is so lazy. I bet you haven\'t payed any taxes at all.'})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the king, so watch what you say!'})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask the soldiers about that.'})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, text = 'Visit the shops of our merchants and craftsmen.'})
keywordHandler:addKeyword({'guild'}, StdModule.say, {npcHandler = npcHandler, text = 'The four major guilds are the knights, the paladins, the druids, and the sorcerers.'})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, text = 'Vile monsters, but I must admit they are strong and sometimes even cunning ... in their own bestial way.'})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, text = 'The forces of good are hard pressed in these dark times.'})
keywordHandler:addKeyword({'evil'}, StdModule.say, {npcHandler = npcHandler, text = 'We need all strength we can muster to smite evil!'})
keywordHandler:addKeyword({'order'}, StdModule.say, {npcHandler = npcHandler, text = 'We need order to survive!'})
keywordHandler:addKeyword({'chaos'}, StdModule.say, {npcHandler = npcHandler, text = 'Chaos arises from selfishness.'})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = 'It\'s the sword of the Kings. If you return this weapon to me I will {reward} you beyond your wildest dreams.'})
keywordHandler:addKeyword({'reward'}, StdModule.say, {npcHandler = npcHandler, text = 'Well, if you want a reward, go on a quest to bring me Excalibug!'})
keywordHandler:addKeyword({'chester'}, StdModule.say, {npcHandler = npcHandler, text = 'A very competent person. A little nervous but very competent.'})
keywordHandler:addKeyword({'tbi'}, StdModule.say, {npcHandler = npcHandler, text = 'This organisation is an essential tool for holding our enemies in check. Its headquarter is located in the bastion in the northwall.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = 'Soon the whole land will be ruled by me once again!'})
keywordHandler:addAliasKeyword({'land'})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, text = 'Harkath Bloodblade is the general of our glorious {army}.'})
keywordHandler:addAliasKeyword({'bloodblade'})
keywordHandler:addAliasKeyword({'general'})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, text = 'I will call for heroes as soon as the need arises again and then reward them appropriately.'})
keywordHandler:addAliasKeyword({'mission'})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, text = 'To pay your taxes, visit the royal tax collector.'})
keywordHandler:addAliasKeyword({'money'})
keywordHandler:addAliasKeyword({'tax'})
keywordHandler:addAliasKeyword({'collector'})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = 'It\'s a time for heroes!'})
keywordHandler:addAliasKeyword({'hero'})
keywordHandler:addAliasKeyword({'adventurer'})
keywordHandler:addKeyword({'enemy'}, StdModule.say, {npcHandler = npcHandler, text = 'Our enemies are numerous. The evil minotaurs, Ferumbras, and the renegade city of Carlin to the north are just some of them.'})
keywordHandler:addAliasKeyword({'enemies'})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = 'They dare to reject my reign over the whole continent!'})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'Our beloved city has some fine shops, guildhouses and a modern sewerage system.'})
keywordHandler:addAliasKeyword({'city'})
keywordHandler:addKeyword({'merchant'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask around about them.'})
keywordHandler:addAliasKeyword({'craftsmen'})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, text = 'The paladins are great protectors for Thais.'})
keywordHandler:addAliasKeyword({'elane'})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, text = 'The brave knights are necessary for human survival in Thais.'})
keywordHandler:addAliasKeyword({'gregor'})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, text = 'The magic of the sorcerers is a powerful tool to smite our enemies.'})
keywordHandler:addAliasKeyword({'muriel'})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, text = 'We need the druidic healing powers to fight evil.'})
keywordHandler:addAliasKeyword({'marvik'})

npcHandler:setMessage(MESSAGE_GREET, 'I greet thee, my loyal subject |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'How rude!')

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hail king')
focusModule:addGreetMessage('salutations king')
npcHandler:addModule(focusModule)
