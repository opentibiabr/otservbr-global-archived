 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local playerTopic = {}
local function greetCallback(cid)

	local player = Player(cid)

	npcHandler:setMessage(MESSAGE_GREET, "Hello adventurer. It is {good} to see you.")
		
	if player:getStorageValue(Storage.DreamCourts.Feyrist.Mission) == 1 then
		npcHandler:setMessage(MESSAGE_GREET, "The Druid of Crunor has sent you? He seems to know that this new museum shines like a diamond. Enjoy your stay! If you like to {support} this place, talk to me.")
		playerTopic[cid] = 1
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
	local valor = 10000

	-- Começou a quest
if player:getStorageValue(Storage.DreamCourts.Feyrist.Acesso) < 1 then
	if msgcontains(msg, "good") then
			npcHandler:say({" I'm just a mere messenger and I'm here to find brave adventurers that might {help} my friends in this time of need."}, cid)
			npcHandler.topic[cid] = 2
			playerTopic[cid] = 2
	elseif msgcontains(msg, "help") and npcHandler.topic[cid] == 2 then
			npcHandler:say({"Lady Alivar of the Summer Court and Lord Cadion of the Winter Court are in need of brave adventurers to avert a great {threat} for the whole world."}, cid)
			npcHandler.topic[cid] = 3
			playerTopic[cid] = 3
	elseif msgcontains(msg, "threat") and npcHandler.topic[cid] == 3 then
			npcHandler:say({"I know only little and I forget so much. So many things going around my mind! ... ",
						"However, I can grant you access to the {Courts} of Summer and Winter if you promise to help! There you can meet with Undal or Vanys, the servants of Lord Cadion and Lady Alivar. They will be able to tell you more about the issue."}, cid)
			npcHandler.topic[cid] = 4
			playerTopic[cid] = 4
	elseif msgcontains(msg, "courts") and npcHandler.topic[cid] == 4 then
			npcHandler:say({"There are {entrances} to the hidden Courts of Summer and Winter in secluded places. You can find the portal to the Winter Court high in the mountains of Tyrsung and the portal to the Summer Court in the meadows of Feyrist. ... ",
						"With my magic you will be able to enter the Courts. Find Undal or Vanys and talk to them. "}, cid)
			npcHandler.topic[cid] = 5
			playerTopic[cid] = 5
	elseif msgcontains(msg, "entrances") and npcHandler.topic[cid] == 5 then
			npcHandler:say({"So, are you willing to help in this time of need?"}, cid)
			npcHandler.topic[cid] = 6
			playerTopic[cid] = 6
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 6 then
			npcHandler:say({"You are a true hero! Here, take my enchantment and you will be able to pass the portals. Now hurry, my friends are waiting."}, cid)
			npcHandler.topic[cid] = 7
			playerTopic[cid] = 7
			player:setStorageValue(Storage.DreamCourts.Feyrist.Acesso, 1)
		else
			npcHandler.topic[cid] = 1
			playerTopic[cid] = 1
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
