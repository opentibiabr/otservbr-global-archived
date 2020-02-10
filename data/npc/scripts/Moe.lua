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

local playerTopic = {}
local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.KilmareshQuest.First.Acesso) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?") -- It needs to be revised, it's not the same as the global
		playerTopic[cid] = 1
	elseif (player:getStorageValue(Storage.KilmareshQuest.First.jamesfrancisTask) >= 0 and player:getStorageValue(Storage.KilmareshQuest.First.jamesfrancisTask) <= 50)
	and player:getStorageValue(Storage.KilmareshQuest.First.Mission) < 3 then
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?") -- It needs to be revised, it's not the same as the global
		playerTopic[cid] = 15
	elseif player:getStorageValue(Storage.KilmareshQuest.First.Mission) == 4 then
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?") -- It needs to be revised, it's not the same as the global
		player:setStorageValue(Storage.KilmareshQuest.First.Mission, 5)
		playerTopic[cid] = 20
	end
	npcHandler:addFocus(cid)
	return true
end

local function creatureSayCallback(cid, type, msg)
if not npcHandler:isFocused(cid) then
	return false
end
npcHandler.topic[cid] = playerTopic[cid]
local player = Player(cid)
if msgcontains(msg, "help") and player:getStorageValue(Storage.KilmareshQuest.Fourth.Moe) == 1 then
	if player:getStorageValue(Storage.KilmareshQuest.Fourth.Moe) == 1 then
		npcHandler:say({"I guess I could do this, yes. But I have to impose a condition. If you bring me twenty sphinx feathers I will steal this ring for you."}, cid)
		npcHandler.topic[cid] = 1
		playerTopic[cid] = 1
	end
elseif msgcontains(msg, "yes") and playerTopic[cid] == 1 and player:getStorageValue(Storage.KilmareshQuest.Fourth.Moe) == 1 then
	if player:getStorageValue(Storage.KilmareshQuest.Fourth.Moe) == 1 and player:getItemById(36272, 10) then
		player:removeItem(36272, 10)			
		npcHandler:say({"Thank you! They look so pretty, I'm very pleased. Agreed, now I will steal the ring from the Ambassador of Rathleton. Just be patient, I have to wait for a good moment."}, cid)
		player:setStorageValue(Storage.KilmareshQuest.Fourth.Moe, 3)		
		npcHandler.topic[cid] = 2
		playerTopic[cid] = 2
	else
		npcHandler:say({"I still haven't had a good time to recover the ring."}, cid)
	end
end
if msgcontains(msg, "ring") and player:getStorageValue(Storage.KilmareshQuest.Fourth.Moe) == 3 then
	if player:getStorageValue(Storage.KilmareshQuest.Fourth.Moe) == 3 then
		player:addItem(36141, 1)
		npcHandler:say({"You're arriving at the right time. I have the ring you asked for. It was not too difficult. I just had to wait until the Ambassador left his residence and then I climbed in through the window. Here it is."}, cid)
		player:setStorageValue(Storage.KilmareshQuest.Fourth.Moe, 4)
		npcHandler.topic[cid] = 3
		playerTopic[cid] = 3
	else
		npcHandler:say({"You already spoke to me."}, cid)
	end
end
if msgcontains(msg, "lyre") and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Lyre) == 1 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Lyre) == 1 then
		npcHandler:say({"I'm upset to accuse myself, the lyre is hidden in a tomb west of Kilmaresh."}, cid)-- It needs to be revised, it's not the same as the global
		player:setStorageValue(Storage.KilmareshQuest.Thirteen.Lyre, 2)
		npcHandler.topic[cid] = 4
		playerTopic[cid] = 4
	else
		npcHandler:say({"You already spoke to me."}, cid)
	end
end		
return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Well, bye then.')
npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
