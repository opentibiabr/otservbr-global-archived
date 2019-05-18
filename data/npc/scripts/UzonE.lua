 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Feel the wind in your hair during one of my carpet rides!'} }
npcHandler:addModule(VoiceModule:new(voices))

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am known as Uzon Ibn Kalith."})
--keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = "You'll have to leave this unholy place first!"})
--keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, text = "You'll have to leave this unholy place first!"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, text = "You'll have to leave this unholy place first!"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = "You'll have to leave this unholy place first!"})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isInArray({"back", "leave", "passage", "transport"}, msg) then
		npcHandler:say('Can we finally leave this cursed place?', cid)
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			local player, destination = Player(cid), Position(32535, 31837, 4)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say('So be it!', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Daraman's blessings, traveller |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Daraman's blessings")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Daraman's blessings")
npcHandler:addModule(FocusModule:new())
