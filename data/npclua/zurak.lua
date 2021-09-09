local internalNpcName = "Zurak"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 114
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	elseif msgcontains(message, "trip") or msgcontains(message, "passage") then
		--if Player(creature):getStorageValue(Storage.TheNewFrontier.Questline) >= 24 then
			npcHandler:say("You want trip to Izzle of Zztrife?", npc, creature)
			npcHandler.topic[creature] = 1
			--else
			--npcHandler:say("You need The New Frontier Quest to travel.", npc, creature)
		--end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 then
			npcHandler:say("It'zz your doom you travel to.", npc, creature)
			local player, destination = Player(creature), Position(33102, 31056, 7)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "no") then
		if npcHandler.topic[creature] == 1 then
			npcHandler:say("Zzoftzzkinzz zzo full of fear.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, 'hurry') or msgcontains(message, 'job')  then
		npcHandler:say('Me zzimple ferryman. I arrange {trip} to Izzle of Zztrife.', npc, creature)
		npcHandler.topic[creature] = 0
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
