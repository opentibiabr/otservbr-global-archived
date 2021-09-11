local internalNpcName = "Tomruk The Ruddy"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 553
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Interesting reaction. Bloodcurdling. Must inspect further.' },
	{ text = 'This is really sanguine!' },
	{ text = 'Hmm... the conductors are too dry to transmit energy.' },
	{ text = 'Ah, fresh blood. My favourite.' }
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

local function creatureSayCallback(npc, creature, type, message)	local player = Player(creature)
	if(msgcontains(message, 'scroll') or msgcontains(message, 'mission')) and player:getStorageValue(Storage.GravediggerOfDrefia.Mission35) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission36) < 1 then
		npcHandler:say({
			"So someone sent you after a scroll, eh? A stroll for a scroll! <chuckles> Sounds like an old-fashioned necromancer thing. ...",
			"Well, this piece here is a rather fascinating thing - see those strange blood stains? - ...",
			"My predecessors have had it for quite a while without finding out more - I was hoping to investigate, but there's always so much to do! ...",
			"Ah, so you want it, too? Well, do me a favour: fetch two samples and assist in my experiment, in exchange for the scroll piece. Yes?"
		}, npc, creature)
		npcHandler.topic[creature] = 1
	elseif msgcontains(message, 'yes') and npcHandler.topic[creature] == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission35) == 1 then
		npcHandler:say({
			"Sanguine! I need two different blood samples - The first one from the necromancer's pure blood chamber. ... ",
			"I was barred from the premises. For my research! Shameful! I'm a martyr to the cause - oh, the second sample you said? ...",
			"The second sample you must retrieve from the sacrificial chamber in the ancient vampire crypts, first floor, far west. ...",
			"Take these two sterilised vials, one for each blood basin. Oh, I wish I could go myself! Come back when you have filled both vials."
		}, npc, creature)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission36, 1)
		player:addItem(21417, 2)
		npcHandler.topic[creature] = 0
	elseif(msgcontains(message, 'scroll') or msgcontains(message, 'mission') or msgcontains(message, 'blood')) and player:getStorageValue(Storage.GravediggerOfDrefia.Mission37) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission38) < 1 then
		npcHandler:say("Hello hello! Did you bring those blood samples?", npc, creature)
		npcHandler.topic[creature] = 2
	elseif msgcontains(message, 'yes') and npcHandler.topic[creature] == 2 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission37) == 1 then
		if player:getItemCount(21419) >= 1 and player:getItemCount(21418) >= 1 then
			npcHandler:say({
				"Now, let me see... yes... yes... very good. Let me add THIS ..... swill it... there. Sanguine! ...",
				"We're not finished yet. Take this tainted blood vial ...",
				"Dab some drops from it on to the four blood pagodas in the inner circle here. Then pull the lightning lever over there."
			}, npc, creature)
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission38, 1)
			player:removeItem(21418, 1)
			player:removeItem(21419, 1)
			player:addItem(21449, 1)
			npcHandler.topic[creature] = 0
		else
			npcHandler:say("You haven't got any blood.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	elseif(msgcontains(message, 'scroll') or msgcontains(message, 'mission')) and player:getStorageValue(Storage.GravediggerOfDrefia.Mission40) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission41) < 1 then
		npcHandler:say("Hello hello! Did Hello hello! Well now, painted all those blood pagodas properly?", npc, creature)
		npcHandler.topic[creature] = 3
	elseif msgcontains(message, 'yes') and npcHandler.topic[creature] == 3 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission40) == 1 then
		npcHandler:say({
			"Sanguine! Did you see those sparks! We definitely had some energy transfer! Well done! Now, for your reward. ...",
			"Err... I would awfully like to know more about the scroll ...",
			"Would you settle for a heartfelt handshake instead - oh, you wouldn't? Well, er, okay ...",
			"Give me a minute or two to retrieve it. Ask me for the {scroll} or the {mission}"
		}, npc, creature)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission41, 1)
		npcHandler.topic[creature] = 0
	elseif(msgcontains(message, 'scroll') or msgcontains(message, 'mission')) and player:getStorageValue(Storage.GravediggerOfDrefia.Mission41) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission42) < 1 then
		npcHandler:say("Hello hell- oh, you've come for the scroll, haven't you?", npc, creature)
		npcHandler.topic[creature] = 4
	elseif msgcontains(message, 'yes') and npcHandler.topic[creature] == 4 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission41) == 1 then
		npcHandler:say("My heart bleeds to part from it. Here. Extend your hand - I'll just retrieve some blood from in exchange - HOLD STILL.", npc, creature)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission42, 1)
		player:addItem(21250, 1)
		npcHandler.topic[creature] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
