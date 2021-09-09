local internalNpcName = "Oblivion"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 552
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Hm.' },
	{ text = 'Yes. I listen, master.' },
	{ text = 'I understand.' },
	{ text = 'Not yet, my brothers. Wait.' }
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end
	local player = Player(creature)
	if(msgcontains(message, 'scroll') or msgcontains(message, 'mission')) and player:getStorageValue(Storage.GravediggerOfDrefia.Mission44) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission45) < 1 then
		npcHandler:say("Lost. Hidden. The keys are shadow names. Find them, they will talk to me and reveal what is hidden. Will you go on that quest?", npc, creature)
		npcHandler.topic[creature] = 1
	elseif msgcontains(message, 'yes') and npcHandler.topic[creature] == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission44) == 1 then
		npcHandler:say({
			"Then into the vampire crypts, deep down, you must go. ...",
			"There... three graves where the shadows swirl, unseen. The first one: name the colour of the silent gong. Then ...",
			"The second: the name that is silent now in the halls of Darkstone ...",
			"The third: the lost beauty of Dunesea. It must be remembered, the shadows command it. Go now."
		}, npc, creature)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission45, 1)
		npcHandler.topic[creature] = 0
	elseif(msgcontains(message, 'scroll') or msgcontains(message, 'mission')) and player:getStorageValue(Storage.GravediggerOfDrefia.Mission48) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) < 1 then
		npcHandler:say("Yes. Have you gone there and found what you sought?", npc, creature)
		npcHandler.topic[creature] = 2
	elseif(msgcontains(message, 'yes')) and npcHandler.topic[creature] == 2 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission48) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) < 1 then
		npcHandler:say("Tell me. Begin with the colour.", npc, creature)
		npcHandler.topic[creature] = 3
	elseif(msgcontains(message, 'bronze')) and npcHandler.topic[creature] == 3 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission48) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) < 1 then
		npcHandler:say("Yes. The shadows say this is true. The beauty of House Dunesea, name it.", npc, creature)
		npcHandler.topic[creature] = 4
	elseif(msgcontains(message, 'floating')) and npcHandler.topic[creature] == 4 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission48) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) < 1 then
		npcHandler:say("The floating gardens. Too beautiful to lie asleep in the memory of men. Yes. The name that is no more in Darkstone?", npc, creature)
		npcHandler.topic[creature] = 5
	elseif(msgcontains(message, 'Takesha Antishu')) and npcHandler.topic[creature] == 5 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission48) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) < 1 then
		npcHandler:say({
			"Ah, the Lady of Darkstone. You have done well to remember her name. ...",
			"Now, the shadows say the thing you seek lies next to Akab, the Quarrelsome. ...",
			"No coal is burned in his honour. Find his resting place and dig near it. Now go."
		}, npc, creature)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission49, 1)
		npcHandler.topic[creature] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Be greeted.")
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
