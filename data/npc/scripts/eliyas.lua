local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end
local voices = {
	{ text = 'Buy bows, crossbows and ammunition here!' },
	{ text = 'Bows! Crossbows! Bolts and arrows! Buy them here!' }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Name, id, price, count/charges
shopModule:addSellableItem({"bow"}, 2456, 100, 1)
shopModule:addSellableItem({"crossbow"}, 2455, 120, 1)
shopModule:addSellableItem({"spear"}, 2389, 3, 1)

shopModule:addBuyableItem({'arrow'}, 2544, 3, 1)
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1)
shopModule:addBuyableItem({'bow'}, 2456, 400, 1)
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 1)
shopModule:addBuyableItem({'crystalline arrow'}, 18304, 20, 1)
shopModule:addBuyableItem({'drill bolt'}, 18436, 12, 1)
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 1)
shopModule:addBuyableItem({'envenomed arrow'}, 18437, 12, 1)
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 1)
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 1)
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 1)
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 1)
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 1)
shopModule:addBuyableItem({'prismatic bolt'}, 18435, 20, 1)
shopModule:addBuyableItem({'royal spear'}, 7378, 15, 1)
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 1)
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 1)
shopModule:addBuyableItem({'spear'}, 2389, 9, 1)
shopModule:addBuyableItem({'tarsal arrow'}, 15648, 6, 1)
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 1)
shopModule:addBuyableItem({'vortex bolt'}, 15649, 6, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'outfit') then
		if player:getSex() == PLAYERSEX_MALE then
			npcHandler:say('My jewelled belt? <giggles> That\'s not very manly. Maybe you\'d prefer a scimitar like Habdel has.', cid)
			return true
		end

		if player:getStorageValue(Storage.OutfitQuest.firstOrientalAddon) < 1 then
			npcHandler:say('My jewelled belt? Of course I could make one for you, but I have a small request. Would you fulfil a task for me?', cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, 'comb') then
		if player:getSex() == PLAYERSEX_MALE then
			npcHandler:say('Comb? This is a jewellery shop.', cid)
			return true
		end

		if player:getStorageValue(Storage.OutfitQuest.firstOrientalAddon) == 1 then
			npcHandler:say('Have you brought me a mermaid\'s comb?', cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				'Listen, um... I have been wanting a comb for a long time... not just any comb, but a mermaid\'s comb. Having a mermaid\'s comb means never having split ends again! ...',
				'You know what that means to a girl! Could you please bring me such a comb? I really would appreciate it.'
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1)
			player:setStorageValue(Storage.OutfitQuest.firstOrientalAddon, 1)
			npcHandler:say('Yay! I will wait for you to return with a mermaid\'s comb then.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if not player:removeItem(5945, 1) then
				npcHandler:say('No... that\'s not it.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:setStorageValue(Storage.OutfitQuest.firstOrientalAddon, 2)
			player:addOutfitAddon(150, 1)
			player:addOutfitAddon(146, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			npcHandler:say('Yeah! That\'s it! I can\'t wait to comb my hair! Oh - but first, I\'ll fulfil my promise: Here is your jewelled belt! Thanks again!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] ~= 0 then
		npcHandler:say('Oh... okay.', cid)
		npcHandler.topic[cid] = 0
	end

	return true
end

keywordHandler:addKeyword({'need'}, StdModule.say, {npcHandler = npcHandler, text = 'I am a jeweller. Maybe you want to have a look at my wonderful {offers}.'})
keywordHandler:addKeyword({'offers'}, StdModule.say, {npcHandler = npcHandler, text = 'Well, I sell gems and {goblets}. If you\'d like to see my offers, ask me for a {trade}.'})
keywordHandler:addKeyword({'goblets'}, StdModule.say, {npcHandler = npcHandler, text = 'Ah, our newest import! We have golden goblets, silver goblets and bronze goblets. All of them have space for a hand-written dedication.'})

npcHandler:setMessage(MESSAGE_GREET, 'Be greeted, |PLAYERNAME|. Which of my fine gems do you {need}?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Daraman\'s blessings and good bye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Daraman\'s blessings and good bye.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
