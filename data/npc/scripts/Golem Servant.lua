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
	if msgcontains(msg, "repairs") then
		if player:getStorageValue(Storage.ShadownofYalahar.golemServant) < 1 then
		npcHandler:say({
				"You must bring me the correct components or tools. The items deteriorate when they leave their conservation fields so you must be quick ...",
				"Are you ready, flesh unit?"
			}, cid)
		player:setStorageValue(Storage.ShadownofYalahar.golemServant, 1)
		npcHandler.topic[cid] = 0
	end
	elseif msgcontains(msg, "yes") then
		if player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 1 then
			npcHandler:say("Chaos matter. Replacement needed immediately!", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 2)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 2 and player:getItemCount(10076) == 1 then
			npcHandler:say("Task fulfilled! Repair progress 1 / 8 ! Can we continue?", cid)
			player:removeItem(10076, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 3)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 3 then
			npcHandler:say("Several parts instable. Wonder glue infusion necessary.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 4)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 4 and player:getItemCount(10089) == 1 then
			npcHandler:say("Initializing repairs! Repair progress 2 / 8 ! Can we continue?", cid)
			player:removeItem(10089, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 5)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 5 then
			npcHandler:say("Danger! Danger! Elemental water urgently needed for cooling!", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 6)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 6 and player:getItemCount(10068) == 1 then
			npcHandler:say("Excellent performance! Repair progress 3 / 8 ! Can we continue?", cid)
			player:removeItem(10068, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 7)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 7 then
			npcHandler:say("Energy net required immediately!", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 8)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 8 and player:getItemCount(10069) == 1 then
			npcHandler:say("Critical failure avoided! Repair progress 4 / 8 ! Can we continue?", cid)
			player:removeItem(10069, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 9)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 9 then
			npcHandler:say("Grease! Grease! Procedure impossible without proper amount of grease!", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 10)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 10 and player:getItemCount(10066) == 1 then
			npcHandler:say("Total destruction averted! Repair progress 5 / 8 ! Can we continue?", cid)
			player:removeItem(10066, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 11)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 11 then
			npcHandler:say("Essential component: bag of screws is missing!", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 12)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 12 and player:getItemCount(10070) == 1 then
			npcHandler:say("Repairs progressing satisfactorily. Repair progress 6 / 8 ! Can we continue?", cid)
			player:removeItem(10070, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 13)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 13 then
			npcHandler:say("Procedure impossible without spare parts!", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 14)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 14 and player:getItemCount(10073) == 1 then
			npcHandler:say("Total destruction averted! Repair progress 7 / 8 ! Can we continue?", cid)
			player:removeItem(10073, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 15)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 15 then
			npcHandler:say("Repair procedure requires giant screwdriver. Hurry, flesh unit!", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 16)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 16 and player:getItemCount(10067) == 1 then
			npcHandler:say("Flesh unit is functioning in acceptable parameters! Repair progress 8 / 8 ! Can we continue?", cid)
			player:removeItem(10067, 1)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 17)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.ShadownofYalahar.golemServant) == 17 then
			npcHandler:say("Repair procedure complete! Elevator fully operational. Ending communication. Have a nice day. Good bye.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.golemServant, 18)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

keywordHandler:addKeyword({"here"}, StdModule.say, {npcHandler = npcHandler, text = "I am a servant and maintenance golem. I also operate the {lift}."})
keywordHandler:addKeyword({"lift"}, StdModule.say, {npcHandler = npcHandler, text = " If you wish to initiate the repair process ask me for {repairs}, male or female unit."})

npcHandler:setMessage(MESSAGE_GREET, 'Greetings! What brings you {here}?')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
