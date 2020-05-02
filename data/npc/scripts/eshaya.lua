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
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Second.Investigating) == -1 then
	npcHandler:say({"I\'m willing to admit that I need help. And the help of someone who is not from Issavi at that. But the task could be dangerous and you would become embroiled in the politics and court intrigues of Kilmaresh. Will you help me anyhow?"}, cid)
	player:setStorageValue(Storage.KilmareshQuest.First.Title, 1)
	npcHandler.topic[cid] = 1
	playerTopic[cid] = 1
elseif msgcontains(msg, "yes") and playerTopic[cid] == 1 and player:getStorageValue(Storage.KilmareshQuest.Second.Investigating) == -1 then
	if player:getStorageValue(Storage.KilmareshQuest.First.Title) == 1 then
		npcHandler:say({"You are a noble soul! So listen: for many decades, over a century actually, the city of Rathleton had an Ambassador here in Issavi..."}, cid)
		npcHandler:say({"Kilmaresh and Oramond maintain important commercial relations, and for this reason Rathleton has an envoy here. In the past, the relations were good but now ..."}, cid)
		npcHandler:say({"I hate to admit it but I heavily suspect that the current Ambassador is a traitor and consorts with the forbidden cult of Fafnar. I have several hints and Kallimae saw it in one of her visions..."}, cid)
		npcHandler:say({"But the vision of a Kilmareshian seer is no proof they will ever accept in Rathleton. And without proof we can\'t banish the Ambassador, this would cause major diplomatic fallout or even a war. I can\'t risk that..."}, cid)
		npcHandler:say({"I need unequivocal evidence that the Ambassador conspires with the Fafnar cultists. Please go to his residence in the eastern part of the city and search for letters, journals ... anything that could prove him guilty."}, cid)
		player:setStorageValue(Storage.KilmareshQuest.Second.Investigating, 1)
		npcHandler.topic[cid] = 2
		playerTopic[cid] = 2
	else
		npcHandler:say({"You haven\'t investigated all the evidence."}, cid)
	end
end
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Second.Investigating) == 5 then
	if player:getStorageValue(Storage.KilmareshQuest.Second.Investigating) == 5 then
		npcHandler:say({"It seems that he destroyed every visible evidence of his treason. That\'s very unfortunate and I see only one remaining possibility: You need to see the Ambassador\'s memories..."}, cid)
		npcHandler:say({"But there is only one way to achieve this: You have to find a Ring of Secret Thoughts. Legend has it that a monstrous being called Urmahlullu has such a ring. If the myths are true you can find this creature in a subterranean tomb south of Issavi."}, cid)
		player:setStorageValue(Storage.KilmareshQuest.Third.Recovering, 1)
		player:setStorageValue(Storage.KilmareshQuest.Second.Investigating, 6)
		npcHandler.topic[cid] = 3
		playerTopic[cid] = 3
	else
		npcHandler:say({"You haven\'t investigated all the evidence."}, cid)
	end
end
if msgcontains(msg, "ring") and player:getStorageValue(Storage.KilmareshQuest.Third.Recovering) == 1 and player:getItemById(36098, true) then
	if player:getStorageValue(Storage.KilmareshQuest.Third.Recovering) == 1 then
		npcHandler:say({"You found the Ring of Secret Thoughts! Well done! Now give it to the Ambassador as a present. He\'s a peacock and will accept such a precious gift for sure. As soon as he wears it, his memories will be stored in the ring."}, cid)
		player:setStorageValue(Storage.KilmareshQuest.Third.Recovering, 2)
		npcHandler.topic[cid] = 5
		playerTopic[cid] = 5
	else
		npcHandler:say({"You don't have the ring I need."}, cid)
	end
end
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Fifth.Memories) == 3 then
	if player:getStorageValue(Storage.KilmareshQuest.Fifth.Memories) == 3 then
		npcHandler:say({"This is the proof we need! Very well done! You have to report this to our Empress. She will grant you an audience now."}, cid)
		player:setStorageValue(Storage.KilmareshQuest.Fifth.Memories, 4)
		npcHandler.topic[cid] = 7
		playerTopic[cid] = 7
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
