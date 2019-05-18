local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Travel
local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, text = 'Give me |TRAVELCOST| and I bring you to Svargrond. Alright?', cost = 50, discount = 'postman'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = 50, discount = 'postman', destination = Position(32255, 31197, 7) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'SHIP AHOY! I AM BUDDEL THE ..... did you say no??? Alright.'})

-- Kick
--keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, text = 'Get out o\' here!*HICKS*', destination = {Position(32224, 31385, 7), Position(32227, 31387, 7), Position(32229, 31385, 7)}})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
