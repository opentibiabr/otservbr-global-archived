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

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.Kilmaresh.First.Access) < 1 then
		-- It needs to be revised, it's not the same as the global
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?")
		npcHandler.topic[cid] = 1
	elseif (player:getStorageValue(Storage.Kilmaresh.First.JamesfrancisTask) >= 0 and player:getStorageValue(Storage.Kilmaresh.First.JamesfrancisTask) <= 50)
	and player:getStorageValue(Storage.Kilmaresh.First.Mission) < 3 then
		-- It needs to be revised, it's not the same as the global
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?")
		npcHandler.topic[cid] = 15
	elseif player:getStorageValue(Storage.Kilmaresh.First.Mission) == 4 then
		-- It needs to be revised, it's not the same as the global
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?")
		player:setStorageValue(Storage.Kilmaresh.First.Mission, 5)
		npcHandler.topic[cid] = 20
	end
	npcHandler:addFocus(cid)
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "present")
	and player:getStorageValue(Storage.Kilmaresh.Third.Recovering) == 2
	and player:getItemById(36098, true) then
		if player:getStorageValue(Storage.Kilmaresh.Third.Recovering) == 2 then
			player:removeItem(36098, 1)
			player:setStorageValue(Storage.Kilmaresh.Fourth.Moe, 1)
			player:setStorageValue(Storage.Kilmaresh.Third.Recovering, 3)
			npcHandler:say({"This is a very beautiful ring. Thank you for this generous present!"}, cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say({"Didn't you bring my gift?"}, cid)
			npcHandler.topic[cid] = 0
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
