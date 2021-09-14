local internalNpcName = "Kratos"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 471,
	lookHead = 77,
	lookBody = 101,
	lookLegs = 97,
	lookFeet = 115,
	lookMount = 902,
	lookAddons = 3
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

-- ID, Count, Price
local eventShopItems = {
	["stamina refill low"] = {1000, 1, 10},
	["stamina refill medium"] = {1000, 1, 20},
	["stamina refill high"] = {1000, 1, 30},
	["blood herb"] = {2798, 10, 3}
}

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	message = string.lower(message)
	if (message == "ofertas") then
		local answerOffers = ""
		for i, v in pairs(eventShopItems) do
			answerOffers = answerOffers.. " {" ..i.."} (" ..v[2].. "x) - " ..v[3].." event token(s) |"
		end
		npcHandler:say("Eu troco os itens: " ..answerOffers, npc, creature)
	elseif (message == "event shop") then
		npcHandler:say("Entre no nosso site, clique em {Events} => {Events Shop}.", npc, creature)
	end

	if (eventShopItems[message]) then
		npcHandler.topic[playerId] = 0
		local itemId, itemCount, itemPrice = eventShopItems[message][1], eventShopItems[message][2], eventShopItems[message][3]
		if (player:getItemCount(26143) > 0) then
			npcHandler:say("Deseja comprar o item {" ..message.. "} por " ..itemPrice.. "x?", npc, creature)
			npcHandler.topic[playerId] = message
		else
			npcHandler:say("Voc� n�o tem " ..itemPrice.. " {Event Token(s)}!", npc, creature)
			return true
		end
	end

	if (eventShopItems[npcHandler.topic[playerId]]) then
		local itemId, itemCount, itemPrice = eventShopItems[npcHandler.topic[playerId]][1], eventShopItems[npcHandler.topic[playerId]][2], eventShopItems[npcHandler.topic[playerId]][3]
		if (message == "no" or
			message == "n�o") then
			npcHandler:say("Ent�o qual item deseja comprar?", npc, creature)
			npcHandler.topic[playerId] = 0
		elseif (message == "yes" or
				message == "sim") then
			if (player:getItemCount(26143) > 0) then
				npcHandler:say("Voc� comprou o Item {" ..npcHandler.topic[playerId].."} " ..itemCount.. "x por " ..itemPrice.. " {Event Token(s)}!", npc, creature)
				player:removeItem(26143, itemPrice)
				player:addItem(itemId, itemCount)
			end
		end
	end
end

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Troco itens por Event Tokens, venha ver minhas ofertas!'}
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

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Ol�, |PLAYERNAME|! Caso n�o me conhe�a, v� no site e clique em {Event Shop}. Deseja trocar seus Event Tokens? fale {ofertas}.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Foi �timo negociar com voc�, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Foi �timo negociar com voc�, |PLAYERNAME|.')
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
}

npcType:register(npcConfig)
