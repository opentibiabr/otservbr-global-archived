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
	
   	local player = Player(cid)   	
	if (msgcontains(msg, 'mission')) and player:getStorageValue(Storage.ShadownofYalahar.Questline) == 41 then
		npcHandler:say("It was a long and perilous road, my friend, but we made it! I assure you, without your help this would never have been possible. Now do it my friend! Pull the lever and give life to our masterpiece!", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 42)
		setPlayerStorageValue(cid, 82972, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 43) then
		selfSay("It's alive! Well, not strictly alive, of course, but moving and talking! Hmm, it seems to be behaving strangely, but perhaps it just needs some training or something like that! ...", cid)
		selfSay("I am so grateful to you! I grant you the privilege of being allowed to enter my laboratory. My latest experiments involve creatures from the far north. ...", cid)
		selfSay("I've upgraded them with some experimental golem technology and those formerly wild creatures can now actually be mounted. ...", cid)
		npcHandler:say("For all of your good work, feel free to take one with you. Just use the golem wrench on it that you'll find in a chest nearby. Thanks again!", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 44)
		player:setStorageValue(Storage.ShadownofYalahar.doorLastLaboratorio13, 1)
		setPlayerStorageValue(cid, 82972, 4) -- quest log
		player:addExperience(25000, true)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
