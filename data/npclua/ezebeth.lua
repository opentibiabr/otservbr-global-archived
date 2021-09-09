local internalNpcName = "Ezebeth"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 140,
	lookHead = 96,
	lookBody = 31,
	lookLegs = 34,
	lookFeet = 94,
	lookAddons = 1
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
	end

	local player = Player(creature)
	if msgcontains(message, "mission") then
		if player:getStorageValue(Storage.DarkTrails.Mission01) == -1 then
			npcHandler:say("Well, there is little where we need help beyond the normal tasks you can do for the city. However, there is one thing out of the ordinary where some {assistance} would be appreciated.", npc, creature)
			npcHandler.topic[creature] = 1
		else
			npcHandler:say("You already asked for a mission, go to the next.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "assistance") then
		if npcHandler.topic[creature] == 1 then
			npcHandler:say(" It's nothing really important, so no one has yet found the time to look it up. It concerns the towns beggars that have started to behave {strange} lately.", npc, creature)
			npcHandler.topic[creature] = 2
		end
	elseif msgcontains(message, "strange") then
		if npcHandler.topic[creature] == 2 then
			npcHandler:say("They usually know better than to show up in the streets and harass our citizens, but lately they've grown more bold or desperate or whatever. I ask you to investigate what they are up to. If necessary, you may scare them away a bit.", npc, creature)
			player:setStorageValue(Storage.DarkTrails.Mission01, 1) -- Mission 1 start
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "outfit") then
		if player:getStorageValue(Storage.DarkTrails.Mission18) == 1 then
			npcHandler:say("Nice work, take your outfit.", npc, creature)
			player:setStorageValue(Storage.DarkTrails.Outfit, 1)
			doPlayerAddOutfit(610, 1)
			doPlayerAddOutfit(618, 1)
			npcHandler.topic[creature] = 0
	elseif player:getStorageValue(Storage.DarkTrails.Outfit) == 1 then
			npcHandler:say("You already have the outfit.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello! I guess you are here for a {mission}.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
