local internalNpcName = "Tarak"
local npcType = Game.createNpcType("Tarak (Inner)")
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 153,
	lookHead = 115,
	lookBody = 31,
	lookLegs = 66,
	lookFeet = 97,
	lookAddons = 0
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
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	if msgcontains(message, "monument tower") or msgcontains(message, "passage") or msgcontains(message, "trip") then
		npcHandler:say("Do you want to travel to the {monument tower} for a 50 gold fee?", npc, creature)
		npcHandler.topic[playerId] = 1
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 1 then
			local player = Player(creature)
			if player:getMoney() + player:getBankBalance() >= 50 then
				player:removeMoneyBank(50)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:teleportTo(Position(32940, 31182, 7), false)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[playerId] = 0

			elseif player:getBankBalance() >= 50 then
				getBankMoney(creature, 50)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:teleportTo(Position(32940, 31182, 7), false)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[playerId] = 0
			else
				npcHandler:say("You don't have enought money.", npc, creature)
				npcHandler.topic[playerId] = 0
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Can I interest you in a trip to the {monument tower}?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
