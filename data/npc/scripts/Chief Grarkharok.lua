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
	
	local voices = {
		{ text = 'Grarkharok\'s bestest troll tribe! Yeee, good name!' },
		{ text = 'Grarkharok make new tribe here! Me Chief now!' },
		{ text = 'Me like to throw rocks, me also like frogs! Yumyum!' }
	}

	npcHandler:addModule(VoiceModule:new(voices))
	npcHandler:addModule(FocusModule:new())

	local player = Player(cid)
	local TrollSabotage = player:getStorageValue(Storage.TibiaTales.TrollSabotage)

	if msgcontains(msg, "kill you") then
		if TrollSabotage == 1 then
			npcHandler:say("Hrhrhrhr! Me no fear of human! Me Chief Grarkharok!!", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "lady") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("You help?? Human know troll lady for Grarkharok??", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("|PLAYERNAME| ?!? Sound good! Bring troll lady to Grarkharok!! Here, give troll lady! Take take! Bring lady to Grarkharok for make tribe!! Now GO!", cid)
			player:setStorageValue(Storage.TibiaTales.TrollSabotage, 2)
			player:addItem(8584, 1)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Me Chief Grarkharok! No do {nothing}!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Grarkharok be {chief}!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Grarkharok be {chief}!")
npcHandler:addModule(FocusModule:new())