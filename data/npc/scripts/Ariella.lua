local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Have a drink in Meriana\'s only tavern!'} }
npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'cookie') then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) == 31
				and player:getStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.Ariella) ~= 1 then
			npcHandler:say('So you brought a cookie to a pirate?', cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, 'addon') and player:getStorageValue(Storage.OutfitQuest.PirateBaseOutfit) == 1 then
		npcHandler:say('To get pirate hat you need give me Brutus Bloodbeard\'s Hat, Lethal Lissy\'s Shirt, Ron the Ripper\'s Sabre and Deadeye Devious\' Eye Patch. Do you have them with you?', cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			if not player:removeItem(8111, 1) then
				npcHandler:say('You have no cookie that I\'d like.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:setStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.Ariella, 1)
			if player:getCookiesDelivered() == 10 then
				player:addAchievement('Allow Cookies?')
			end

			Npc():getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			npcHandler:say('How sweet of you ... Uhh ... OH NO ... Bozo did it again. Tell this prankster I\'ll pay him back.', cid)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(Storage.OutfitQuest.PirateHatAddon) == -1 then
				if player:getItemCount(6101) > 0 and player:getItemCount(6102) > 0 and player:getItemCount(6100) > 0 and player:getItemCount(6099) > 0 then
					if player:removeItem(6101, 1) and player:removeItem(6102, 1) and player:removeItem(6100, 1) and player:removeItem(6099, 1) then
						npcHandler:say("Ah, right! The pirate hat! Here you go.", cid)
						player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
						player:setStorageValue(Storage.OutfitQuest.PirateHatAddon, 1)
						player:addOutfitAddon(155, 2)
						player:addOutfitAddon(151, 2)
					end
				else
					npcHandler:say("You do not have all the required items.", cid)
				end
			else
				npcHandler:say("It seems you already have this addon, don\'t you try to mock me son!", cid)
			end
		end
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('I see.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('Alright then. Come back when you got all neccessary items.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
