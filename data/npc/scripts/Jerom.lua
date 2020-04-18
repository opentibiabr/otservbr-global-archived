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
		{ text = 'My house! Uahahahaha <sniffs>' },
		{ text = 'Dear gods! My precious house, DESTROYED!!' },
		{ text = 'Oh no!! What am I supposed to do now?!?' }
	}

	npcHandler:addModule(VoiceModule:new(voices))
	npcHandler:addModule(FocusModule:new())

	local player = Player(cid)
	local TrollSabotage = player:getStorageValue(Storage.TibiaTales.TrollSabotage)
	local DefaultStart = player:getStorageValue(Storage.TibiaTales.DefaultStart)

	if msgcontains(msg, "mission") then
			if TrollSabotage <= 0 then
				npcHandler:say({
								'I\'m not sure but I suppose that an evil troll lives in the mountains here! I saw him rummaging in the ruins of my house. ...',
								'I took a closer look and found my family casket ripped open. It contained a precious necklace. If I had it back, I could sell it and start over! ...',
								'Could you look for this mean beast, find out why he did and either get me some money ormy necklace to rebuild my business?'
				}, cid)
				npcHandler.topic[cid] = 1
			elseif TrollSabotage == 2 then
				npcHandler:say("Thank you sooo much <sniffs>. Well, you know I lost everything, but recently I found this strange rope here. I don't need it, here take it!", cid)
				player:setStorageValue(Storage.TibiaTales.TrollSabotage, 3)
				player:removeItem(8584, 1)
				player:addItem(7731, 1)
			end	
		elseif msgcontains(msg, "yes") then
			if npcHandler.topic[cid] == 1 then
				npcHandler:say("Gret! Finally, some light at the end of the tunnel! Come back and ask me for the quest when you solved this mystery!", cid)
				npcHandler.topic[cid] = 2
					if DefaultStart <= 0 then
						player:setStorageValue(Storage.TibiaTales.DefaultStart, 1)
					end
				player:setStorageValue(Storage.TibiaTales.TrollSabotage, 1)	
			end
		end
		return true
	end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Sorry, but I'm not in the best mood today.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye, I'm not in the best mood today.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oh no!! What am I supposed to do now?!?")
npcHandler:addModule(FocusModule:new())