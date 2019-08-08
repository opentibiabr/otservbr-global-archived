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

	npcHandler:setMessage(MESSAGE_GREET, "Greetings hero. I guess you came to {talk}.")
		
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
if player:getStorageValue(Storage.DreamCourts.Summer.Task) < 1 then
	if msgcontains(msg, "talk") then
			npcHandler:say({"So do you want to learn the {story} behind of this or rather talk about the task at hand?"}, cid)
			npcHandler.topic[cid] = 2
			playerTopic[cid] = 2
	elseif msgcontains(msg, "story") and npcHandler.topic[cid] == 2 then
			npcHandler:say({"Do you prefer the {long} version or the {short} version? "}, cid)
			npcHandler.topic[cid] = 3
			playerTopic[cid] = 3
	elseif msgcontains(msg, "short") and npcHandler.topic[cid] == 3 then
			npcHandler:say({"You will have to re-empower several wardstones all over the world, to weaken the beast of nightmares. ... ",
						"The next step would be to enter a place known as dream scar and participate in battles, to gain access to the lower areas. ... ",
					"There the nightmare beast can be challenged and defeated. ...",
				"So do you want to learn the story behind of this or rather talk about the {task} at hand? "}, cid)
			npcHandler.topic[cid] = 4
			playerTopic[cid] = 4
--	elseif msgcontains(msg, "long") and npcHandler.topic[cid] == 3 then
--			npcHandler:say({"I know only little and I forget so much. So many things going around my mind! ... ",
--						"However, I can grant you access to the {Courts} of Summer and Winter if you promise to help! There you can meet with Undal or Vanys, the servants of Lord Cadion and Lady Alivar. They will be able to tell you more about the issue."}, cid)
--			npcHandler.topic[cid] = 4
--			playerTopic[cid] = 4
	elseif msgcontains(msg, "task") and npcHandler.topic[cid] == 4 then
			npcHandler:say({"You have to empower eight ward stones. Once charged with arcane energy, they will strengthen the Nightmare Beast's prison and at the same time weaken this terrible creature. We know about the specific location of six of those stones. ...  ",
						"You can find them in the mountains of the island Okolnir, in a water elemental cave beneath Folda, in the depths of Calassa, in the forests of Feyrist and on the islands Meriana and Cormaya. ...  ",
					"The location of the other two ward stones is a bit more obscure, however. We are not completely sure where they are. You should make inquiries at an abandoned house in the Plains of Havoc. You may find it east of an outlaw camp. ... .",
					"The other stone seems to be somewhere in Tiquanda. Search for a small stone building south-west of Banuta. Take this talisman to empower the ward stones. It will work with the six stones at the known locations. ... .",
				"However, the empowering of the two hidden stones could be a bit more complicated. But you have to find out on yourself what to do with those stones. "}, cid)
			npcHandler.topic[cid] = 5
			playerTopic[cid] = 5
			player:addItem(34770)
			player:setStorageValue(Storage.DreamCourts.Summer.Task, 1)
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
