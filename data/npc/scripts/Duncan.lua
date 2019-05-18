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
	local storage = Storage.OutfitQuest.PirateSabreAddon

	if isInArray({"outfit", "addon"}, msg) and player:getStorageValue(Storage.OutfitQuest.PirateBaseOutfit) == 1 then
		npcHandler:say("You're talking about my sabre? Well, even though you earned our trust, you'd have to fulfill a task first before you are granted to wear such a sabre.", cid)
	elseif msgcontains(msg, "task") then
		if player:getStorageValue(storage) < 1 then
			npcHandler:say("Are you up to the task which I'm going to give you and willing to prove you're worthy of wearing such a sabre?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "eye patches") then
		if player:getStorageValue(storage) == 1 then
			npcHandler:say("Have you gathered 100 eye patches?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "peg legs") then
		if player:getStorageValue(storage) == 2 then
			npcHandler:say("Have you gathered 100 peg legs?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "hooks") then
		if player:getStorageValue(storage) == 3 then
			npcHandler:say("Have you gathered 100 hooks?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"Listen, the task is not that hard. Simply prove that you are with us and not with the pirates from Nargor by bringingme some of their belongings. ...",
				"Bring me 100 of their eye patches, 100 of their peg legs and 100 of their hooks, in that order. ...",
				"Have you understood everything I told you and are willing to handle this task?"
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			player:setStorageValue(storage, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
			npcHandler:say("Good! Come back to me once you have gathered 100 eye patches.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(6098, 100) then
				player:setStorageValue(storage, 2)
				npcHandler:say("Good job. Alright, now bring me 100 peg legs.", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:removeItem(6126, 100) then
				player:setStorageValue(storage, 3)
				npcHandler:say("Nice. Lastly, bring me 100 pirate hooks. That should be enough to earn your sabre.", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:removeItem(6097, 100) then
				player:setStorageValue(storage, 4)
				npcHandler:say("I see, I see. Well done. Go to Morgan and tell him this codeword: 'firebird'. He'll know what to do.", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] >= 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
