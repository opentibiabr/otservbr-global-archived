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
-- Mission 3 Steal The Ambassador Ring
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 1 then
	if player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 1 then
		npcHandler:say({"Could you kill 3 bosses for me?"}, cid) -- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 1
		playerTopic[cid] = 1
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 1 and player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 1 then
	if player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 1 then
		npcHandler:say({"Come back as soon as you kill all 3 bosses."}, cid) -- needs review, this is not the speech of the global
		player:setStorageValue(Storage.KilmareshQuest.Twelve.Boss, 2)
		player:setStorageValue(Storage.KilmareshQuest.Twelve.Bragrumol, 1)
		player:setStorageValue(Storage.KilmareshQuest.Twelve.Mozradek, 1)
		player:setStorageValue(Storage.KilmareshQuest.Twelve.Xogixath, 1)
		npcHandler.topic[cid] = 2
		playerTopic[cid] = 2
	else
		npcHandler:say({"Sorry."}, cid)
	end
end
-- Mission 3 Steal The Ambassador Ring
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 2 then
	if player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 2 then
		npcHandler:say({"Did you manage to face all 3 bosses?"}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 3
		playerTopic[cid] = 3
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 3 and player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 2 then
	if player:getStorageValue(Storage.KilmareshQuest.Twelve.Bragrumol) == 2 and player:getStorageValue(Storage.KilmareshQuest.Twelve.Mozradek) == 2 and player:getStorageValue(Storage.KilmareshQuest.Twelve.Xogixath) == 2 then
		npcHandler:say({"I am very satisfied."}, cid)-- needs review, this is not the speech of the global
		player:setStorageValue(Storage.KilmareshQuest.Twelve.Boss, 3)
		npcHandler.topic[cid] = 4
		playerTopic[cid] = 4
	else
		npcHandler:say({"Sorry."}, cid)
	end
end
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 3 then
	if player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 3 then
		npcHandler:say({"Could you help me with some more work?"}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 5
		playerTopic[cid] = 5
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 5 and player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 3 then
	if player:getStorageValue(Storage.KilmareshQuest.Twelve.Boss) == 3 then
		npcHandler:say({"Kill 300 members of the Fafnar cult, help me find Ivory Lyre and help me find an animal to stone."}, cid)-- needs review, this is not the speech of the global
		player:setStorageValue(Storage.KilmareshQuest.Twelve.Boss, 4)
		player:setStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar, 1)
		player:setStorageValue(Storage.KilmareshQuest.Thirteen.Lyre, 1)
		player:setStorageValue(Storage.KilmareshQuest.Thirteen.Presente, 1)
		npcHandler.topic[cid] = 6
		playerTopic[cid] = 6
	else
		npcHandler:say({"Sorry."}, cid)
	end
end
if msgcontains(msg, "report") and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 300 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 300 then
		npcHandler:say({"Have you finished killing the 300 members of Fafnar's cult?"}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 7
		playerTopic[cid] = 7
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 7 and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 300 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 300 then
		npcHandler:say({"Thanks. You killed the 300 members of the Fafnar cult."}, cid)-- needs review, this is not the speech of the global
		player:setStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar, 301)
		npcHandler.topic[cid] = 8
		playerTopic[cid] = 8
	else
		npcHandler:say({"Sorry."}, cid)
	end
end
if msgcontains(msg, "report") and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Lyre) == 3 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Lyre) == 3 then
		npcHandler:say({"Did you manage to find Lyre?"}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 9
		playerTopic[cid] = 9
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 9 and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Lyre) == 3 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Lyre) == 3 and player:getItemById(36282, 1) then
		player:removeItem(36282, 1)
		npcHandler:say({"Thanks. I was looking for Lyre for a long time."}, cid)-- needs review, this is not the speech of the global
		player:setStorageValue(Storage.KilmareshQuest.Thirteen.Lyre, 4)
		npcHandler.topic[cid] = 10
		playerTopic[cid] = 10
	else
		npcHandler:say({"Sorry."}, cid)
	end
end
if msgcontains(msg, "report") and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Presente) == 2 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Presente) == 2 then
		npcHandler:say({"Did you manage to find Small Tortoise?"}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 11
		playerTopic[cid] = 11
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 11 and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Presente) == 2 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Presente) == 2 and player:getItemById(36280, 1) then
		player:removeItem(36280, 1)
		npcHandler:say({"Thanks. I was looking for Small Tortoise."}, cid)-- needs review, this is not the speech of the global
		player:setStorageValue(Storage.KilmareshQuest.Thirteen.Presente, 3)
		npcHandler.topic[cid] = 12
		playerTopic[cid] = 12
	else
		npcHandler:say({"Sorry."}, cid)
	end
end
if msgcontains(msg, "small tortoise") then
	if player:getItemById(36280, 1) then
		npcHandler:say({"Do you want me to stone a small tortoise?"}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 15
		playerTopic[cid] = 15
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 15 then
	if player:getItemById(36280, 1) then
		player:removeItem(36280, 1)
		player:addItem(36281, 1)
		npcHandler:say({"Here's your Small Petrified Tortoise."}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 16
		playerTopic[cid] = 16
	else
		npcHandler:say({"Sorry."}, cid)
	end
end
if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 301 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 301 then
		npcHandler:say({"Did you finish the 3 jobs I gave you?"}, cid)-- needs review, this is not the speech of the global
		npcHandler.topic[cid] = 13
		playerTopic[cid] = 13
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 13 and player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 301 then
	if player:getStorageValue(Storage.KilmareshQuest.Thirteen.Fafnar) == 301 then
		player:addAchievement(462, "Congratulations! You earned the achievement \"Sculptor Apprentice\".")
		player:addItem(36409, 1)
		npcHandler:say({"Congratulations, you have completed the 3 jobs I gave you."}, cid)-- needs review, this is not the speech of the global
		player:setStorageValue(Storage.KilmareshQuest.Fourteen.Remains, 1)
		npcHandler.topic[cid] = 14
		playerTopic[cid] = 14
	else
		npcHandler:say({"Sorry."}, cid)
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
