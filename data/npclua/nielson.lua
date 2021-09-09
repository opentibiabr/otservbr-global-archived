local internalNpcName = "Nielson"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 129,
	lookHead = 114,
	lookBody = 113,
	lookLegs = 68,
	lookFeet = 67,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Passages to Senja, Folda and Vega.'}
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

-- Travel
local function addTravelKeyword(keyword, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say,
		{
			npcHandler = npcHandler,
			text = "Do you want a round-trip passage to " .. keyword:titleCase() .. " for |TRAVELCOST|?",
			cost = cost,
			discount = "postman"
		}
	)
	travelKeyword:addChildKeyword({"yes"}, StdModule.travel,
		{
			npcHandler = npcHandler,
			text = "Have a nice trip!",
			premium = false,
			cost = cost,
			discount = "postman",
			destination = destination
		}
	)
	travelKeyword:addChildKeyword({"no"}, StdModule.say,
		{
			npcHandler = npcHandler,
			text = "You shouldn't miss the experience.",
			reset = true
		}
	)
end

addTravelKeyword("vega", 20, {x = 32020, y = 31692, z = 7})
addTravelKeyword("senja", 20, {x = 32128, y = 31664, z = 7})
addTravelKeyword("folda", 20, {x = 32046, y = 31578, z = 7})

-- Basic
keywordHandler:addKeyword({"passage"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Where do you want to go today? We serve the routes to {Folda}, {Senja} and {Vega} and back to Tibia."
	}
)
keywordHandler:addKeyword({"job"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We are ferrymen. We transport goods and passengers to the Ice Islands."
	}
)
keywordHandler:addKeyword({"captain"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We are ferrymen. We transport goods and passengers to the Ice Islands."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Ahoi, young man |PLAYERNAME| and welcome to the Nordic Tibia Ferries. If you need a {passage}, let me know.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. You are welcome.")

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
