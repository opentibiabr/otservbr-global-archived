 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Bem vindos ao Blood da Dilma, por apenas 10k voce compra um vial.'} }
npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Ate logo, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Que Deus lhe mostre o caminho, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Claro, basta navegar atraves de minhas ofertas.")

local focusModule = FocusModule:new()
focusModule:addGreetMessage({'hi', 'hello', 'ashari'})
focusModule:addFarewellMessage({'bye', 'farewell', 'asgha thrazi'})
npcHandler:addModule(focusModule)
