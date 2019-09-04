local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local player = Player(cid)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()						npcHandler:onThink() 						end
function onThink() 						npcHandler:onThink() 						end

npcHandler:addModule(FocusModule:new())

-- missing script for complete the mission 15 of dark trails
