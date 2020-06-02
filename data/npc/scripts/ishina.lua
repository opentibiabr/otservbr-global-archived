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

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"black pearl"}, 2144, 280, 1)
shopModule:addBuyableItem({"bronze goblet"}, 5807, 2000, 1)
shopModule:addBuyableItem({"golden amulet"}, 2130, 6600, 1)
shopModule:addBuyableItem({"golden goblet"}, 5805, 5000, 1)
shopModule:addBuyableItem({"ruby necklace"}, 2133, 3560, 1)
shopModule:addBuyableItem({"silver goblet"}, 5806, 3000, 1)
shopModule:addBuyableItem({"small amethyst"}, 2150, 400, 1)
shopModule:addBuyableItem({"small diamond"}, 2145, 600, 1)
shopModule:addBuyableItem({"small emerald"}, 2149, 500, 1)
shopModule:addBuyableItem({"small ruby"}, 2147, 500, 1)
shopModule:addBuyableItem({"small sapphire"}, 2146, 500, 1)
shopModule:addBuyableItem({"wedding ring"}, 2121, 990, 1)
shopModule:addBuyableItem({"white pearl"}, 2143, 320, 1)

shopModule:addSellableItem({"ancient coin"}, 27058, 350, 1)
shopModule:addSellableItem({"black pearl"}, 2144, 280, 1)
shopModule:addSellableItem({"blue crystal shard"}, 18413, 1500, 1)
shopModule:addSellableItem({"blue crystal splinter"}, 18418, 400, 1)
shopModule:addSellableItem({"brown crystal splinter"}, 18417, 400, 1)
shopModule:addSellableItem({"coral brooch"}, 27059, 750, 1)
shopModule:addSellableItem({"crunor idol"}, 34693, 30000, 1)
shopModule:addSellableItem({"cyan crystal fragment"}, 18419, 800, 1)
shopModule:addSellableItem({"dragon figurine"}, 34691, 45000, 1)
shopModule:addSellableItem({"gemmed figurine"}, 27060, 3500, 1)
shopModule:addSellableItem({"giant emerald"}, 34698, 90000, 1)
shopModule:addSellableItem({"giant ruby"}, 34697, 70000, 1)
shopModule:addSellableItem({"giant sapphire"}, 34699, 50000, 1)
shopModule:addSellableItem({"giant shimmering pearl"}, 7633, 3000, 1)
shopModule:addSellableItem({"gold ingot"}, 9971, 5000, 1)
shopModule:addSellableItem({"gold nugget"}, 2157, 850, 1)
shopModule:addSellableItem({"green crystal fragment"}, 18421, 800, 1)
shopModule:addSellableItem({"green crystal shard"}, 18415, 1500, 1)
shopModule:addSellableItem({"green crystal splinter"}, 18416, 400, 1)
shopModule:addSellableItem({"onyx chip"}, 24849, 500, 1)
shopModule:addSellableItem({"opal"}, 24850, 500, 1)
shopModule:addSellableItem({"ornate locket"}, 34694, 18000, 1)
shopModule:addSellableItem({"prismatic quartz"}, 27630, 450, 1)
shopModule:addSellableItem({"rainbow quartz"}, 29038, 500, 1)
shopModule:addSellableItem({"red crystal fragment"}, 18420, 800, 1)
shopModule:addSellableItem({"small amethyst"}, 2150, 200, 1)
shopModule:addSellableItem({"small diamond"}, 2145, 300, 1)
shopModule:addSellableItem({"small emerald"}, 2149, 250, 1)
shopModule:addSellableItem({"small enchanted amethyst"}, 7762, 200, 1)
shopModule:addSellableItem({"small enchanted emerald"}, 7761, 250, 1)
shopModule:addSellableItem({"small enchanted ruby"}, 7760, 250, 1)
shopModule:addSellableItem({"small enchanted sapphire"}, 7759, 250, 1)
shopModule:addSellableItem({"small ruby"}, 2147, 250, 1)
shopModule:addSellableItem({"small sapphire"}, 2146, 250, 1)
shopModule:addSellableItem({"small topaz"}, 9970, 200, 1)
shopModule:addSellableItem({"tiger eye"}, 27629, 350, 1)
shopModule:addSellableItem({"unicorn figurine"}, 34692, 50000, 1)
shopModule:addSellableItem({"violet crystal shard"}, 18414, 1500, 1)
shopModule:addSellableItem({"wedding ring"}, 2121, 100, 1)
shopModule:addSellableItem({"white pearl"}, 2143, 160, 1)

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
