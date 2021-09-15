local internalNpcName = "Jorge"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 159,
	lookHead = 38,
	lookBody = 77,
	lookLegs = 78,
	lookFeet = 94
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

local items = {
	 [1] = {name = "Abacus", id = 21467},
	 [2] = {name = "Assassin Doll", id = 32594},
	 [3] = {name = "Bag of Oriental Spices", id = 26338},
	 [4] = {name = "Bookworm Doll", id = 32592},
	 [5] = {name = "Cateroides Doll", id = 29217},
	 [6] = {name = "Doll of Durin the Almighty", id = 26335},
	 [7] = {name = "Dragon Eye", id = 24683},
	 [8] = {name = "Dragon Goblet", id = 36100},
	 [9] = {name = "Draken Doll", id = 29215},
	 [10] = {name = "Encyclopedia", id = 26334},
	 [11] = {name = "Friendship Amulet", id = 21469},
	 [12] = {name = "Frozen Heart", id = 21472},
	 [13] = {name = "Golden Falcon", id = 32593},
	 [14] = {name = "Golden Newspaper", id = 26337},
	 [15] = {name = "Hand Puppets", id = 26332},
	 [16] = {name = "Imortus", id = 26339},
	 [17] = {name = "Jade Amulet", id = 36103},
	 [18] = {name = "Key of Numerous Locks", id = 21468},
	 [19] = {name = "Loremaster Doll", id = 36102},
	 [20] = {name = "Mathmaster Shield", id = 29218},
	 [21] = {name = "Medusa Skull", id = 26336},
	 [22] = {name = "Music Box", id = 26333},
	 [23] = {name = "Noble Sword", id = 18551},
	 [24] = {name = "Norsemal Doll", id = 21466},
	 [25] = {name = "Old Radio", id = 32591},
	 [26] = {name = "Orcs Jaw Shredder", id = 21471},
	 [27] = {name = "Pigeon Trophy", id = 36101},
	 [28] = {name = "Phoenix Statue", id = 24682},
	 [29] = {name = "The Mexcalibur", id = 21470},
	 [30] = {name = "TibiaHispano Emblem", id = 29216},
	 [31] = {name = "Goromaphone", id = 39045}
}

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)

	if message then
		for i = 1, #items do
		  if msgcontains(message, items[i].name) then
				if getPlayerItemCount(creature, 21400) >= 20 then
					doPlayerRemoveItem(creature, 21400, 20)
					doPlayerAddItem(creature, items[i].id, 1)
					selfSay('You just swapped 20 silver raid tokens for 1 '.. getItemName(items[i].name) ..'.', npc, creature)
				else
					selfSay('You need 20 silver raid tokens.', npc, creature)
				end
			end
		end
	end
	return true
end

local function onAddFocus(creature)
	local playerId = creature:getId()
end

local function onReleaseFocus(creature)
	local playerId = creature:getId()
end

npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
