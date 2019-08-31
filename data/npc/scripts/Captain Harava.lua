local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Come on board! The winds are prosperous!.'}, {text = 'Passages to Oramond and Krailos!'}}
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, cost, destination, action, condition)
	if condition then
		keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry but I don\'t sail there.'}, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination}, nil, action)
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
end

addTravelKeyword('darashia', 120, Position(33289, 32481, 6))
addTravelKeyword('venore', 170, Position(32954, 32022, 6))
addTravelKeyword('oramond', 150, Position(33479, 31985, 7))
addTravelKeyword('krailos', 230, Position(33492, 31712, 6))

-- Kick
--keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(32320, 32219, 6), Position(32321, 32210, 6)}})

-- Basic
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'My name is Harava.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m the captain of this beautiful ship. I can {sail} you to Krailos, Oramond, Venore or Darashia.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m the captain of this beautiful ship. I can {sail} you to Krailos, Oramond, Venore or Darashia.'})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, text = 'This beautiful ship has seen many voyages.'})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m ready to bring you to {Oramond}, {Krailos}, {Venore} or {Darashia}.'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m ready to bring you to {Oramond}, {Krailos}, {Venore} or {Darashia}.'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m ready to bring you to {Oramond}, {Krailos}, {Venore} or {Darashia}.'})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but I don\'t sail there.'})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but I don\'t sail there.'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, traveller. Where can I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell and Bastesh\'s blessings!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Bastesh\'s blessings!.')

npcHandler:addModule(FocusModule:new())