local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'firebird') then
		if player:getStorageValue(Storage.OutfitQuest.PirateSabreAddon) == 4 then
			player:setStorageValue(Storage.OutfitQuest.PirateSabreAddon, 5)
			player:addOutfitAddon(151, 1)
			player:addOutfitAddon(155, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			npcHandler:say('Ahh. So Duncan sent you, eh? You must have done something really impressive. Okay, take this fine sabre from me, mate.', cid)
		end
	elseif msgcontains(msg, 'warrior\'s sword') then
		if player:hasOutfit(player:getSex() == PLAYERSEX_FEMALE and 142 or 134, 2) then
			npcHandler:say('You already have this outfit!', cid)
			return true
		end

		if player:getStorageValue(Storage.OutfitQuest.WarriorSwordAddon) < 1 then
			player:setStorageValue(Storage.OutfitQuest.WarriorSwordAddon, 1)
			npcHandler:say('Great! Simply bring me 100 iron ore and one royal steel and I will happily {forge} it for you.', cid)
		elseif player:getStorageValue(Storage.OutfitQuest.WarriorSwordAddon) == 1 and npcHandler.topic[cid] == 1 then
			if player:getItemCount(5887) > 0 and player:getItemCount(5880) > 99 then
				player:removeItem(5887, 1)
				player:removeItem(5880, 100)
				player:addOutfitAddon(134, 2)
				player:addOutfitAddon(142, 2)
				player:setStorageValue(Storage.OutfitQuest.WarriorSwordAddon, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:addAchievementProgress('Wild Warrior', 2)
				npcHandler:say('Alright! As a matter of fact, I have one in store. Here you go!', cid)
			else
				npcHandler:say('You do not have all the required items.', cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'knight\'s sword') then
		if player:hasOutfit(player:getSex() == PLAYERSEX_FEMALE and 139 or 131, 1) then
			npcHandler:say('You already have this outfit!', cid)
			return true
		end

		if player:getStorageValue(Storage.OutfitQuest.Knight.AddonSword) < 1 then
			player:setStorageValue(Storage.OutfitQuest.Knight.AddonSword, 1)
			npcHandler:say('Great! Simply bring me 100 Iron Ore and one Crude Iron and I will happily {forge} it for you.', cid)
		elseif player:getStorageValue(Storage.OutfitQuest.Knight.AddonSword) == 1 and npcHandler.topic[cid] == 1 then
			if player:getItemCount(5892) > 0 and player:getItemCount(5880) > 99 then
				player:removeItem(5892, 1)
				player:removeItem(5880, 100)
				player:addOutfitAddon(131, 1)
				player:addOutfitAddon(139, 1)
				player:setStorageValue(Storage.OutfitQuest.Knight.AddonSword, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say('Alright! As a matter of fact, I have one in store. Here you go!', cid)
			else
				npcHandler:say('You do not have all the required items.', cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'forge') then
		npcHandler:say('What would you like me to forge for you? A {knight\'s sword} or a {warrior\'s sword}?', cid)
		npcHandler.topic[cid] = 1
	end
	return true
end

keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, text = 'I can forge the finest {weapons} for knights and warriors. They may wear them proudly and visible to everyone.'})
keywordHandler:addKeyword({'weapons'}, StdModule.say, {npcHandler = npcHandler, text = 'Would you rather be interested in a {knight\'s sword} or in a {warrior\'s sword}?'})

npcHandler:setMessage(MESSAGE_GREET, 'Hello there.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
