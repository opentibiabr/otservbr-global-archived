local internalNpcName = "Gurbasch"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 66
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Passages to Kazordoon! Gotta try the beer there.'}
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

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Travel
local function addTravelKeyword(keyword, text, cost, discount, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = text[1], cost = cost, discount = discount})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, text = text[2], cost = cost, discount = discount, destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = text[3], reset = true})
end

addTravelKeyword('farmine', {'Do you seek a ride to Farmine for |TRAVELCOST|?', 'Hold on!', 'You shouldn\'t miss the experience.'}, 110, {'postman', 'new frontier'},
	function(player)
		local destination = Position(33025, 31553, 14)
		if player:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then --if The New Frontier Quest 'Mission 05: Getting Things Busy' complete then Stage 3
			destination.z = 10
		elseif player:getStorageValue(Storage.TheNewFrontier.Mission03) >= 2 then --if The New Frontier Quest 'Mission 03: Strangers in the Night' complete then Stage 2
			destination.z = 12
		end

		return destination
	end
)
addTravelKeyword('kazordoon', {'Do you want to go to Kazordoon to try the beer there? |TRAVELCOST|?', 'Set the sails!', 'Then not.'}, 160, 'postman', Position(32660, 31957, 15))

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want me take you to {Kazordoon} or {Farmine}?'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome, |PLAYERNAME|! May Earth protect you, even whilst sailing!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Until next time.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Until next time.')

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
