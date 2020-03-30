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
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Fifth.Memories) == 4 then
	if player:getStorageValue(Storage.KilmareshQuest.Fifth.Memories) == 4 then
		player:addItem(36249, 1)
		npcHandler:say({"I see. There is enough and adequate evidence that the Ambassador of Rathleton is indeed an arch traitor. So, Eshaya was right. Well done, mortal being. You have proven your loyalty and bravery, therefore allow me to ask you one more favour. ..."}, cid)
		npcHandler:say({"The Cult of Fafnar is a serious problem for Issavi. The cultists are roaming the sewers and catacombs beneath the city now and again but this time they are really up to something. ..."}, cid)
		npcHandler:say({"As a member of the Sapphire Blade found out, they are planning to cause a major earthquake, that could severely damage or even destroy Issavi. You may wonder how. ..."}, cid)
		npcHandler:say({"Well, they want to activate five Fafnar statues which they have already enchanted. They are hidden in the catacombs underneath the city. Please go down and search for the statues. ..."}, cid)
		npcHandler:say({"Then use this sceptre to bless them in the name of Suon and Bastesh. This will destroy the disastrous enchantment and Issavi will be safe again."}, cid)
		player:setStorageValue(Storage.KilmareshQuest.Sixth.Favor, 1)
		player:setStorageValue(Storage.KilmareshQuest.Fifth.Memories, 5)
		npcHandler.topic[cid] = 1
		playerTopic[cid] = 1
	else
		npcHandler:say({"Sorry."}, cid)-- It needs to be revised, it's not the same as the global
	end
end
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Sixth.Favor) == 10 then
	if player:getStorageValue(Storage.KilmareshQuest.Sixth.Favor) == 10 then
		npcHandler:say({"Did you take all the masks and enchant all the statues?"}, cid)-- It needs to be revised, it's not the same as the global
		npcHandler.topic[cid] = 3
		playerTopic[cid] = 3
	end		
elseif msgcontains(msg, "yes") and playerTopic[cid] == 3 and player:getStorageValue(Storage.KilmareshQuest.Sixth.Favor) == 10 then
	if player:getStorageValue(Storage.KilmareshQuest.Sixth.Favor) == 10 then				
		player:addItem(36408, 1) -- Sun Medal	
		npcHandler:say({"Thank you."}, cid)-- It needs to be revised, it's not the same as the global
		player:setStorageValue(Storage.KilmareshQuest.Sixth.Favor, 11)
		npcHandler.topic[cid] = 4
		playerTopic[cid] = 4
	else
		npcHandler:say({"Sorry."}, cid)-- It needs to be revised, it's not the same as the global
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
