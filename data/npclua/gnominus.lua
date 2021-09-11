local internalNpcName = "Gnominus"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 493,
	lookHead = 0,
	lookBody = 85,
	lookLegs = 85,
	lookFeet = 0,
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

-- transcript for buying fresh mushroom beer is probably wrong except for the case where you buy it
local function creatureSayCallback(npc, creature, type, message)	local player = Player(creature)
	if msgcontains(message, 'recruitment') then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 3 then
			npcHandler:say('Your examination is quite easy. Just step through the green crystal apparatus in the south! We will examine you with what we call g-rays. Where g stands for gnome of course ...', npc, creature)
			npcHandler:say('Afterwards walk up to Gnomedix for your ear examination.', npc, creature)
			npcHandler.topic[creature] = 1
		end
	elseif msgcontains(message, 'tavern') then
			npcHandler:say('I provide the population with some fresh alcohol-free mushroom {beer}!', npc, creature)
	elseif msgcontains(message, 'beer') then
			npcHandler:say('Do you want some mushroom beer for 10 gold?', npc, creature)
			npcHandler.topic[creature] = 2
	elseif npcHandler.topic[creature] == 1 then
		if msgcontains(message, 'apparatus') then
			npcHandler:say('Don\'t be afraid. It won\'t hurt! Just step in!', npc, creature)
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 4)
			npcHandler.topic[creature] = 0
		end
	elseif npcHandler.topic[creature] == 2 then
		if msgcontains(message, 'yes') then
			if player:getMoney() + player:getBankBalance() >= 10 then
				npcHandler:say('And here it is! Drink it quick, it gets stale quite fast!', npc, creature)
				player:removeMoneyNpc(10)
				local beerItem = player:addItem(18305)
				if beerItem then
					beerItem:decay()
				end
			else
				npcHandler:say('You do not have enough money.', npc, creature)
			end
		else
			npcHandler:say('Come back later.', npc, creature)
		end
		npcHandler.topic[creature] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hi there! Welcome to my little {tavern}.')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
