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
	{text = 'Gems and jewellery! Best prices in town!'} 
}

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
	if msgcontains(msg, "addon") or msgcontains(msg, "outfit") or msgcontains(msg, "hat") then
		local addonProgress = player:getStorageValue(Storage.OutfitQuest.Citizen.AddonHat)
		if addonProgress < 1 then
			npcHandler:say("Pretty, isn't it? My friend Amber taught me how to make it, but I could help you with one if you like. What do you say?", cid)
			npcHandler.topic[cid] = 1
		elseif addonProgress == 1 then
			npcHandler:say("Oh, you're back already? Did you bring a legion helmet, 100 chicken feathers and 50 honeycombs?", cid)
			npcHandler.topic[cid] = 2
		elseif addonProgress == 2 then
			npcHandler:say('Pretty hat, isn\'t it?', cid)
		end
		return true
	end

	if npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			player:setStorageValue(Storage.OutfitQuest.Ref, math.max(0, player:getStorageValue(Storage.OutfitQuest.Ref)) + 1)
			player:setStorageValue(Storage.OutfitQuest.Citizen.AddonHat, 1)
			player:setStorageValue(Storage.OutfitQuest.Citizen.MissionHat, 1)
			npcHandler:say('Okay, here we go, listen closely! I need a few things... a basic hat of course, maybe a legion helmet would do. Then about 100 chicken feathers... and 50 honeycombs as glue. That\'s it, come back to me once you gathered it!', cid)
		else
			npcHandler:say('Aw, I guess you don\'t like feather hats. No big deal.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			if player:getItemCount(2480) < 1 then
				npcHandler:say('Sorry, but I can\'t see a legion helmet.', cid)
			elseif player:getItemCount(5890) < 100 then
				npcHandler:say('Sorry, but you don\'t enough chicken feathers.', cid)
			elseif player:getItemCount(5902) < 50 then
				npcHandler:say('Sorry, but you don\'t have enough honeycombs.', cid)
			else
				npcHandler:say('Great job! That must have taken a lot of work. Okay, you put it like this... then glue like this... here!', cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

				player:removeItem(2480, 1)
				player:removeItem(5902, 50)
				player:removeItem(5890, 100)

				player:addOutfitAddon(136, 2)
				player:addOutfitAddon(128, 2)

				player:setStorageValue(Storage.OutfitQuest.Ref, math.min(0, player:getStorageValue(Storage.OutfitQuest.Ref) - 1))
				player:setStorageValue(Storage.OutfitQuest.Citizen.MissionHat, 0)
				player:setStorageValue(Storage.OutfitQuest.Citizen.AddonHat, 2)
			end
		else
			npcHandler:say('Maybe another time.', cid)
		end
		npcHandler.topic[cid] = 0
	end

	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am a jeweler. Maybe you want to have a look at my wonderful offers.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'I am Hanna.'})

npcHandler:setMessage(MESSAGE_GREET, 'Oh, please come in, |PLAYERNAME|. What do you need? Have a look at my wonderful {offers} in gems and jewellery.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye.')

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
