local internalNpcName = "One-Eyed Joe"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 155,
	lookHead = 94,
	lookBody = 114,
	lookLegs = 105,
	lookFeet = 97,
	lookAddons = 1
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Did you hear that, too?' }
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

function creatureSayCallback(npc, creature, type, message)
	if (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) == 3) then
		if (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Questline) == 3)then
			player:setStorageValue(Storage.TibiaTales.TheCursedCrystal.Questline, 4)
		end
		player:addAchievement("Wail of the Banshee")
		player:setStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe, 4)
		doPlayerAddItem(creature,18413,1)
		doPlayerAddItem(creature,18414,1)
		doPlayerAddItem(creature,18415,1)
		math.randomseed(os.time())
		chanceToPirate = math.random(1,4)
		if chanceToPirate == 1 then
			doPlayerAddItem(creature,5926,1)
		elseif chanceToPirate == 2 then
			doPlayerAddItem(creature,6098,1)
		elseif chanceToPirate == 3 then
			doPlayerAddItem(creature,6097,1)
		elseif chanceToPirate == 4 then
			doPlayerAddItem(creature,6126,1)
		end
	elseif (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) >= 0) and (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) < 3) then
		npcHandler:say("Ah, the brave adventurer who sought to destroy the evil crystal down there. Have you been succesful?", npc, creature)			
	elseif msgcontains(message, "mission") and (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) < 0) and npcHandler.topic[creature] < 1 then
		npcHandler.topic[creature] = 1 
		npcHandler:say({
			"As for myself I haven't been down there. But I heard some disturbing rumours. In these caves are wonderful crystal formations. Some more poetically inclined fellows call them the crystal gardens. ...",
			"At first glance it seems to be a beautiful - and precious - surrounding. But in truth, deep down in these caverns exists an old evil. Want to hear more?"
		}, npc, creature)
	elseif msgcontains(message, "yes") and (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) > 0) and (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) < 3) then
		npcHandler:say({"Hmm. No, i don't think so. I still feel this strange prickling in my toes."}, npc, creature)
	elseif msgcontains(message, "no") and (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) > 0) and (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) < 3) then
		npcHandler:say({"Too bad."}, npc, creature)
	elseif msgcontains(message, "protect ears") then
		npcHandler:say({"Protect your ears? Hmm ... Wasn't there some fabulous seafarer who used wax or something to plug his ears? There was a story about horrible bird-women or something ...? No, sounds like hogwash, doesn't it."}, npc, creature)
	elseif msgcontains(message, "yes") and npcHandler.topic[creature] == 1 then
		npcHandler.topic[creature] = 2
		npcHandler:say({
			"The evil I mentioned is a strange crystal, imbued with some kind of unholy energy. It is very hard to destroy, no weapon is able to shatter the thing. Maybe a jarring, very loud sound could destroy it. ...",
			"I heard of creatures, that are able to utter ear-splitting sounds. Don't remember the name, though. Would you go down there and try to destroy the crystal?"
		}, npc, creature)
	elseif msgcontains(message, "yes") and npcHandler.topic[creature] == 2 then
		npcHandler.topic[creature] = 3
		player:setStorageValue(Storage.TibiaTales.DefaultStart, 1)
		if (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Questline) < 0)then
			player:setStorageValue(Storage.TibiaTales.TheCursedCrystal.Questline, 0)
		end
		player:setStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe, 0)
		npcHandler:say({"Great! Good luck and be careful down there!"}, npc, creature)
	elseif msgcontains(message, "crystals") then
		npcHandler:say({
			"In my humble opinion a pirate should win a fortune by boarding ships not by crawling through caves and tunnels. But who am I to bring into question the captain's decision. All I know is that they sell the crystals at a high price. ...",
			"A certain amount of the crystals is ground to crystal dust with a special kind of mill. Don't ask me why. Some kind of magical component perhaps that they sell to mages and sorcerers."
		}, npc, creature)
	elseif msgcontains(message, "cursed") and (player:getStorageValue(Storage.TibiaTales.TheCursedCrystal.Oneeyedjoe) < 0) and npcHandler.topic[creature] < 1 then
		npcHandler.topic[creature] = 1 
		npcHandler:say({
			"As for myself I haven't been down there. But I heard some disturbing rumours. In these caves are wonderful crystal formations. Some more poetically inclined fellows call them the crystal gardens. ...",
			"At first glance it seems to be a beautiful - and precious - surrounding. But in truth, deep down in these caverns exists an old evil. Want to hear more?"
		}, npc, creature)
	elseif msgcontains(message, "sounds") then
		npcHandler:say({
			"These caves are incredibly beautiful, {crystals} in vibrant colours grow there like exotic flowers. There are more than a few captains who send down their men in order to quarry the precious crystals. ...",
			"But there are few volunteers. Often the crystal gatherers disappear and are never seen again. Other poor fellows then meet their former shipmates in the form of ghosts or skeletons. It's a {cursed} area, something evil is down there!"
		}, npc, creature)
	elseif msgcontains(message, "job") then
		npcHandler:say({"I'm a pirate. Normally I'm sailing the seas, boarding other ships and gathering treasures. But at the moment my captain graciously assigned me to watch this {cursed} entrance."}, npc, creature)
	elseif msgcontains(message, "name") then
		npcHandler:say({"I'm One-Eyed Joe. From Josephina, got that? And I regard this eye patch as a personal feature of beauty!"}, npc, creature)
	elseif msgcontains(message, "bye") then
		npcHandler:say("Good bye adventurer. It was nice to talk with you.", npc, creature)	
		npcHandler:removeInteraction(npc, creature) 
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello there. I'm sorry, I hardly noticed you. I'm a bit nervous. The spooky {sounds} down there, you know")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
