local internalNpcName = "Budrik"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 94,
	lookBody = 95,
	lookLegs = 58,
	lookFeet = 114
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)

	if msgcontains(message, "mission") then
		if player:getStorageValue(Storage.toOutfoxAFoxQuest) < 1 then
			npcHandler:say({
				"Funny that you are asking me for a mission! There is indeed something you can do for me. Ever heard about The Horned Fox? Anyway, yesterday his gang has stolen my mining helmet during a raid. ...",
				"It belonged to my father and before that to my grandfather. That helmet is at least 600 years old! I need it back. Are you willing to help me?"
			}, npc, creature)
			npcHandler.topic[creature] = 1

		elseif player:getStorageValue(Storage.toOutfoxAFoxQuest) == 1 then
			if player:removeItem(7497, 1) then
				player:setStorageValue(Storage.toOutfoxAFoxQuest, 2)
				player:addItem(7939, 1)
				npcHandler:say("I always said it to the others 'This brave fellow will bring me my mining helmet back' and here you are with it!! Here take my spare helmet, I don't need it anymore!", npc, creature)
			else
				npcHandler:say("We presume the hideout of The Horned Fox is somewhere in the south-west near the coast, good luck finding my mining helmet!", npc, creature)
			end
			npcHandler.topic[creature] = 0
			else npcHandler:say("Hum... what, {task}?", npc, creature)
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 then
			player:setStorageValue(Storage.toOutfoxAFoxQuest, 1)
			npcHandler:say("I knew you have the guts for that task! We presume the hideout of The Horned Fox somewhere in the south-west near the coast. Good luck!", npc, creature)
			npcHandler.topic[creature] = 0

			elseif npcHandler.topic[creature] == 2 then
			npcHandler:say("Hussah! Let's bring war to those hoof-legged, dirt-necked, bull-headed minotaurs!! Come back to me when you are done with your mission.", npc, creature)
			player:setStorageValue(JOIN_STOR, 1)
			player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinos, 1)
			player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, 0)
			npcHandler.topic[creature] = 0
			else npcHandler:say("Zzz...", npc, creature)

		end
		elseif msgcontains(message, "task") then
		-- AQUI
		if player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) <= 0 then
			npcHandler:say({
				"I am so angry I could spit grit! That damn Horned Fox and his attacks! Let's show those bull-heads that they have messed with the wrong people....",
				"I want you to kill {5000 minotaurs} - no matter where - for me and all the dwarfs of Kazordoon! Are you willing to do that?"
			}, npc, creature)
			npcHandler.topic[creature] = 2
		elseif player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			if player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount) >= 5000 then
				npcHandler:say({
					"By all that is holy! You are a truly great warrior! With much patience! I have just found out the location the hideout of {The Horned Fox}! I have marked the spot on your map so you can find it. Go there and slay him!! Good luck!"
				}, npc, creature)
				player:setStorageValue(17522, 1)
				player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinos, 2)
			else
				npcHandler:say("Come back when you have slain {5000 minotaurs!}", npc, creature)
			end
		elseif player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 2 then
			npcHandler:say({
				"It was very decent of you to help me, and I am thankful, really I am, but now I have to get back to my duties as a foreman."
			}, npc, creature)
			player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinos, 3)
		elseif player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 3 then
			npcHandler:say("You already done this task.", npc, creature)
			npcHandler.topic[creature] = 0
			else npcHandler:say("You need to do the {To Outfox a Fox Quest} before.", npc, creature)
		end
		-- AQUI

		-- YES AQUI

	elseif msgcontains(message, "no") then
		if npcHandler.topic[creature] > 1 then
			npcHandler:say("Then no.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	end
		-- YES AQUI

	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye, bye.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye, bye.")
npcHandler:setMessage(MESSAGE_GREET, "Hiho, hiho |PLAYERNAME|.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
