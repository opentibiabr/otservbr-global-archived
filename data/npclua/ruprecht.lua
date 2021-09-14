local internalNpcName = "Ruprecht"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 153,
	lookHead = 59,
	lookBody = 115,
	lookLegs = 115,
	lookFeet = 38,
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

local storeTable = {}
local itemsTable = {
	["gingerbreadman"] = {itemId = 6501, count = 1},
	["christmas cookie tray"] = {itemId = 22644, count = 1},
	["gingerbread recipe"] = {itemId = 6523, count = 10},
	["jewel case"] = {itemId = 8261, count = 25},
	["santa hat"] = {itemId = 6531, count = 50},
	["santa backpack"] = {itemId = 11263, count = 75},
	["snow flake tapestry"] = {itemId = 22649, count = 75},
	["santa doll"] = {itemId = 6512, count = 100},
	["snowman doll"] = {itemId = 11256, count = 150},
	["snow globe"] = {itemId = 22645, count = 150},
	["frazzlemaw santa"] = {itemId = 22642, count = 250},
	["leaf golem santa"] = {itemId = 22643, count = 250},
	["santa music box"] = {itemId = 22647, count = 250},
	["santa teddy"] = {itemId = 11255, count = 500},
	["maxxen santa"] = {itemId = 24321, count = 250},
	["present bag"] = {itemId = 6497, count = 1},
	["ferumbras' teddy santa"] = {itemId = 25535, count = 250},
	["nightmare beast santa"] = {itemId = 34585, count = 250},
	["orclops santa"] = {itemId = 27062, count = 250},
	["raccoon santa"] = {itemId = 40527, count = 250},
	["santa fox"] = {itemId = 30826, count = 250},
	["santa leech"] = {itemId = 37581, count = 250}
}

local function creatureSayCallback(npc, creature, type, message)
	local playerId = creature:getId()
	local player = Player(creature)

	if (msgcontains(message, "offers")) then
		local text = "I have these offers: "
		for i, v in pairs(itemsTable) do
			text = text.. "{" ..i.. "}, "
		end
		npcHandler:say(text, npc, creature)
	end

	if npcHandler.topic[playerId] == 0 then
		local table = itemsTable[message]
		if table then
			if (table.itemId ~= 6497) then
				npcHandler:say("So you want to exchange "..message..", for ".. table.count .." christmas tokens?", npc, creature)
				storeTable[creature] = message
				npcHandler.topic[playerId] = 1
			else
				npcHandler:say("So you want to exchange ".. message .." to "..table.count.." christmas token(s)?", npc, creature)
				storeTable[creature] = 6527
				npcHandler.topic[playerId] = 1
			end
		end
	elseif npcHandler.topic[playerId] == 1 then
		if msgcontains(message, "yes") then
			if (tonumber(storeTable[creature]) == 6527) then
				if (player:removeItem(6497, 1)) then
					npcHandler:say("Thank you, here is your 1 christmas token.", npc, creature)
					player:addItem(6527, 1)
					npcHandler.topic[playerId] = 0
				else
					npcHandler:say("You don't have a present bag.", npc, creature)
					npcHandler.topic[playerId] = 0
				end
				return false
			end
			if player:removeItem(6527, itemsTable[storeTable[creature]].count) then
				npcHandler:say("Thank you, here is your "..storeTable[creature]..".", npc, creature)
				player:addItem(itemsTable[storeTable[creature]].itemId, 1)
				npcHandler.topic[playerId] = 0
			else
				npcHandler:say("You don't have enough of tokens.", npc, creature)
				npcHandler.topic[playerId] = 0
			end
		end
	elseif npcHandler.topic[playerId] > 0 then
		if msgcontains(message, "no") then
			npcHandler:say("Come back when you are ready to trade some tokens!", npc, creature)
		end
	end
	if msgcontains(message, "santa claus") then
		npcHandler:say({
			"Well, he does not really like it if someone tells his story ... but I do! A long, long time ago Santa was nothing but a greedy little dwarf. A real miser, I tell ya ...",
			"He was greedy even by dwarven standards. He would never share anything or give away the cheapest thing in his possession ...",
			"One day a woman came to his house and asked him for a cup of water ...",
			"Of course he refused. He even mocked her for being so naive. But what he did not know was that this woman was some kind of mighty faery or perhaps a goddess in disguise ...",
			"Be it as it may, the woman cursed old Santa, forcing him to share his fortune with everyone he met ...",
			"Santa was horrified. Of course, he could not bear the thought of sharing anything at all. So he went into hiding ...",
			"He hid in the most remote places in the world, but time and again someone found him out, and the curse made him share his wealth ...",
			"And know something? Old Santa actually came to like it! He saw the joy his presents brought, and this opened his old stony heart ...",
			"And he learned that this way his fortune gave him more joy and pleasure than it ever did when he locked it away. ...",
			"Over the years he turned it into a game. He hid somewhere to reward those who found him ...",
			"But once every year, on a very special day which happens to be his curse's anniversary, he goes out and brings presents to the people, and especially to the children ...",
			"Well, that is his story ... Nah, that's not a tear in my eye. It's just the wind, you know."
		}, npc, creature)
	end
	return true
end

local function onReleaseFocus(creature)
	storeTable[creature] = nil
end

npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
