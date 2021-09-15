local internalNpcName = "Santa Claus"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 0,
	lookBody = 112,
	lookLegs = 93,
	lookFeet = 95
}

npcConfig.flags = {
	floorchange = false
}

 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

local talkState = {}
npcType.onAppear = function(npc, creature)
	 npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	 npcHandler:onDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	 npcHandler:onSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	 npcHandler:onThink(npc, interval)
end

local normalItems = {
	 {7439, 7440, 7443},
	 {2688, 6508},
	 {2688, 6509},
	 {2688, 6507},
	 {2688, 2114},
	 {2688, 2111},
	 {2167, 2213, 2214},
	 {11227},
	 {2156},
	 {2153}
}

local semiRareItems = {
	 {2173},
	 {9954},
	 {9971},
	 {5080}
}

local rareItems = {
	 {2110},
	 {5919},
	 {6567},
	 {11255},
	 {11256},
	 {6566},
	 {2112}
}

local veryRareItems = {
	 {2659},
	 {3954},
	 {2644},
	 {10521},
	 {5804}
}

local function getReward()
	 local rewardTable = {}
	 local random = math.random(100)
	 if (random <= 90) then
		  rewardTable = normalItems
	 elseif (random <= 70) then
		  rewardTable = semiRareItems
	 elseif (random <= 30) then
		  rewardTable = rareItems
	 elseif (random <= 10) then
		  rewardTable = veryRareItems
	 end

	 local rewardItem = rewardTable[math.random(#rewardTable)]
	 return rewardItem
end

function creatureSayCallback(npc, creature, type, message)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or creature
	
	if msgcontains(message, 'present') then
		local player = Player(creature)
		if (player:getStorageValue(840293) == 1) then
			npcHandler:say("You can't get other present.", npc, creature)
			return false
		end
		
		local reward = getReward()
		local cont = Container(Player(creature):addItem(6511):getUniqueId())
		local count = 1
		
		for i = 1, #reward do
			if (reward[i] == 2111 or
			reward[i] == 2688) then
				count = 10
			end
			
			cont:addItem(reward[i], count)
		end
		
		player:setStorageValue(840293, 1)
		npcHandler:say("Merry Christmas!", npc, creature)
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
