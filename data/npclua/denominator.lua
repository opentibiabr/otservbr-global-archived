local internalNpcName = "Denominator"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeex = 1442
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local playerTopic = {}
local playerLastResp = {}
local function greetCallback(npc, creature)

	local player = Player(creature)
	if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) == 13 then
		npcHandler:setMessage(MESSAGE_GREET, "Enter answers for the following {questions}:")
		playerTopic[creature] = 1
	else
		npcHandler:setMessage(MESSAGE_GREET, "Greetings.")
	end
	return true
end

local quiz1 = {
	[1] = {p ="The sum of first and second digit?", r = function(player)player:setStorageValue(Storage.CultsOfTibia.MotA.Answer, player:getStorageValue(Storage.CultsOfTibia.MotA.Stone1) + player:getStorageValue(Storage.CultsOfTibia.MotA.Stone2))return player:getStorageValue(Storage.CultsOfTibia.MotA.Answer)end},
	[2] = {p ="The sum of second and third digit?", r = function(player)player:setStorageValue(Storage.CultsOfTibia.MotA.Answer, player:getStorageValue(Storage.CultsOfTibia.MotA.Stone2) + player:getStorageValue(Storage.CultsOfTibia.MotA.Stone3))return player:getStorageValue(Storage.CultsOfTibia.MotA.Answer)end},
	[3] = {p ="The sum of first and third digit?", r = function(player)player:setStorageValue(Storage.CultsOfTibia.MotA.Answer, player:getStorageValue(Storage.CultsOfTibia.MotA.Stone1) + player:getStorageValue(Storage.CultsOfTibia.MotA.Stone3))return player:getStorageValue(Storage.CultsOfTibia.MotA.Answer)end},
	[4] = {p ="The digit sum?", r = function(player)player:setStorageValue(Storage.CultsOfTibia.MotA.Answer, player:getStorageValue(Storage.CultsOfTibia.MotA.Stone1) + player:getStorageValue(Storage.CultsOfTibia.MotA.Stone2) + player:getStorageValue(Storage.CultsOfTibia.MotA.Stone3))return player:getStorageValue(Storage.CultsOfTibia.MotA.Answer)end}
}

local quiz2 = {
	[1] = {p = "Is the number prime?", r =
		function(player)
			local stg = player:getStorageValue(Storage.CultsOfTibia.MotA.Answer)
			if stg < 1 then
				return 0
			end
			if stg == 1 or stg == 2 then
				return 1
			end
			local incr = 0
			for i = 1, stg do
				if(stg % i == 0)then
					incr = incr + 1
				end
			end
			return (incr == 2 and 1 or 0)
		end
	},
	[2] = {p = "Does the number belong to a prime twing?", r =
		function(player)
			local stg = player:getStorageValue(Storage.CultsOfTibia.MotA.Answer)
			if stg < 2 then
				return 0
			end
			if stg == 1 or stg == 2 then
				return 1
			end
			local incr = 0
			for i = 1, stg do
				if(stg % i == 0)then
					incr = incr + 1
				end
			end
			return (incr == 2 and 1 or 0)
		end
	},
	-- [2] = {p = "", r = ""}
}

local quiz3 = {
	[1] = {p = "Is the number divisible by 3?", r = function(player)return (player:getStorageValue(Storage.CultsOfTibia.MotA.Answer) % 3 == 0 and 1 or 0)end},
	[2] = {p = "Is the number divisible by 2?", r = function(player)return (player:getStorageValue(Storage.CultsOfTibia.MotA.Answer) % 2 == 0 and 1 or 0)end}
}
local function creatureSayCallback(npc, creature, type, message)	npcHandler.topic[creature] = playerTopic[creature]
	local player = Player(creature)
	-- Começou a quest
	if msgcontains(message, "questions") and npcHandler.topic[creature] == 1 then
		npcHandler:say("Ready to {start}?", npc, creature)
		npcHandler.topic[creature] = 2
		playerTopic[creature] = 2
	elseif msgcontains(message, "start") and npcHandler.topic[creature] == 2 then
		local perguntaid = math.random(#quiz1)
		player:setStorageValue(Storage.CultsOfTibia.MotA.QuestionId, perguntaid)
		npcHandler:say(quiz1[perguntaid].p, npc, creature)
		npcHandler.topic[creature] = 3
		playerTopic[creature] = 3
	elseif (npcHandler.topic[creature] == 3) then
		npcHandler:say(string.format("Your answer is %s, do you want to continue?", message), npc, creature)
		playerLastResp[creature] = tonumber(message)
		npcHandler.topic[creature] = 4
		playerTopic[creature] = 4
	elseif (npcHandler.topic[creature] == 4) then
		if msgcontains(message, "yes") then
			local resposta = quiz1[player:getStorageValue(Storage.CultsOfTibia.MotA.QuestionId)].r
			if playerLastResp[creature] ~= (tonumber(resposta(player))) then
				npcHandler:say("Wrong. SHUT DOWN.", npc, creature)
				npcHandler:resetNpc(creature)
				npcHandler:removeInteraction(npc, creature)
				return false
			else
				npcHandler:say("Correct. {Next} question?", npc, creature)
				npcHandler.topic[creature] = 5
				playerTopic[creature] = 5
			end
		elseif msgcontains(message, "no") then
			npcHandler:say("SHUT DOWN.", npc, creature)
			npcHandler:resetNpc(creature)
			npcHandler:removeInteraction(npc, creature)
			return false
		end
	elseif msgcontains(message, "next") and npcHandler.topic[creature] == 5 then
		local perguntaid = math.random(#quiz2)
		player:setStorageValue(Storage.CultsOfTibia.MotA.QuestionId, perguntaid)
		npcHandler:say(quiz2[perguntaid].p, npc, creature)
		npcHandler.topic[creature] = 6
		playerTopic[creature] = 6
	elseif npcHandler.topic[creature] == 6 then
		local resp = 0
		if msgcontains(message, "no") then
			resp = 0
		elseif msgcontains(message, "yes") then
			resp = 1
		end
		local resposta = quiz2[player:getStorageValue(Storage.CultsOfTibia.MotA.QuestionId)].r
		if resp == resposta(player) then
			npcHandler:say("Correct. {Next} question?", npc, creature)
			npcHandler.topic[creature] = 7
			playerTopic[creature] = 7
		else
			npcHandler:say("Wrong. SHUT DOWN.", npc, creature)
			npcHandler:resetNpc(creature)
			npcHandler:removeInteraction(npc, creature)
			return false
		end
	elseif npcHandler.topic[creature] == 7 and msgcontains(message, "next") then
		local perguntaid = math.random(#quiz3)
		player:setStorageValue(Storage.CultsOfTibia.MotA.QuestionId, perguntaid)
		npcHandler:say(quiz3[perguntaid].p, npc, creature)
		npcHandler.topic[creature] = 8
		playerTopic[creature] = 8
	elseif npcHandler.topic[creature] == 8 then
		local resp = 0
		if msgcontains(message, "no") then
			resp = 0
		elseif msgcontains(message, "yes") then
			resp = 1
		end
		local resposta = quiz3[player:getStorageValue(Storage.CultsOfTibia.MotA.QuestionId)].r
		if resp == resposta(player) then
			npcHandler:say("Correct. {Last} question?", npc, creature)
			npcHandler.topic[creature] = 9
			playerTopic[creature] = 9
		else
			npcHandler:say("Wrong. SHUT DOWN.", npc, creature)
			npcHandler:resetNpc(creature)
			npcHandler:removeInteraction(npc, creature)
			return false
		end
	elseif npcHandler.topic[creature] == 9 and msgcontains(message, "last") then
		npcHandler:say("Tell me the correct number?", npc, creature)
		npcHandler.topic[creature] = 10
		playerTopic[creature] = 10
	elseif npcHandler.topic[creature] == 10 then
		npcHandler:say(string.format("Your answer is %s, do you want to continue?", message), npc, creature)
		playerLastResp[creature] = tonumber(message)
		npcHandler.topic[creature] = 11
		playerTopic[creature] = 11
	elseif npcHandler.topic[creature] == 11 then
		if msgcontains(message, "yes") then
			local correct = string.format("%d%d%d", player:getStorageValue(Storage.CultsOfTibia.MotA.Stone1), player:getStorageValue(Storage.CultsOfTibia.MotA.Stone2), player:getStorageValue(Storage.CultsOfTibia.MotA.Stone3))
			if tonumber(playerLastResp[creature]) ~= (tonumber(correct)) then
				npcHandler:say("Wrong. SHUT DOWN.", npc, creature)
				npcHandler:resetNpc(creature)
				npcHandler:removeInteraction(npc, creature)
				return false
			else
				npcHandler:say("Correct. The lower door is now open. The druid of Crunor lies.", npc, creature)
				player:setStorageValue(Storage.CultsOfTibia.MotA.Mission, player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) + 1)
				player:setStorageValue(Storage.CultsOfTibia.MotA.AccessDoorDenominator)
			end
		elseif msgcontains(message, "no") then
			npcHandler:say("SHUT DOWN.", npc, creature)
			npcHandler:resetNpc(creature)
			npcHandler:removeInteraction(npc, creature)
			return false
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

-- npcType registering the npcConfig table
npcType:register(npcConfig)
