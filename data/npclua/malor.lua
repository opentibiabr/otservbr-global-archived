local internalNpcName = "Malor"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 103
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onAppear = function(npc, creature)
npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
npcHandler:onThink(npc, interval)	
end

local function releasePlayer(creature)
	if not Player(creature) then
		return
	end

	npcHandler:removeInteraction(npc, creature)
	npcHandler:resetNpc(creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local missionProgress = player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03)
	if msgcontains(message, 'mission') then
		if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission02) == 3 then
			if missionProgress < 1 then
				npcHandler:say({
					'I guess this is the first time I entrust a human with a mission. And such an important mission, too. But well, we live in hard times, and I am a bit short of adequate staff. ...',
					'Besides, Baa\'leal told me you have distinguished yourself well in previous missions, so I think you might be the right person for the job. ...',
					'But think carefully, human, for this mission will bring you close to certain death. Are you prepared to embark on this mission?'
				}, npc, creature)
				npcHandler.topic[creature] = 1

			elseif missionProgress == 1 then
				npcHandler:say('You haven\'t finished your final mission yet. Shall I explain it again to you?', npc, creature)
				npcHandler.topic[creature] = 1

			elseif missionProgress == 2 then
				npcHandler:say('Have you found Fa\'hradin\'s lamp and placed it in Malor\'s personal chambers?', npc, creature)
				npcHandler.topic[creature] = 2
			else
				npcHandler:say('There\'s no mission left for you, friend of the Efreet. However, I have a {task} for you.', npc, creature)
			end
		else
			npcHandler:say({
				'So you would like to fight for us. Hmm. ...',
				'You show true courage, human, but I will not accept your offer at this point of time.'
			}, npc, creature)
		end

	elseif npcHandler.topic[creature] == 1 then
		if msgcontains(message, 'yes') then
			npcHandler:say({
				'Well, listen. We are trying to acquire the ultimate weapon to defeat Gabel: Fa\'hradin\'s lamp! ...',
				'At the moment it is still in the possession of that good old friend of mine, the Orc King, who kindly released me from it. ...',
				'However, for some reason he is not as friendly as he used to be. You better watch out, human, because I don\'t think you will get the lamp without a fight. ...',
				'Once you have found the lamp you must enter Ashta\'daramai again. Sneak into Gabel\'s personal chambers and exchange his sleeping lamp with Fa\'hradin\'s lamp! ...',
				'If you succeed, the war could be over one night later!'
			}, npc, creature)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission03, 1)

		elseif msgcontains(message, 'no') then
			npcHandler:say('Your choice.', npc, creature)
			npcHandler.topic[creature] = 0
		end

	elseif npcHandler.topic[creature] == 2 then
		if msgcontains(message, 'yes') then
			npcHandler:say({
				'Well well, human. So you really have made it - you have smuggled the modified lamp into Gabel\'s bedroom! ...',
				'I never thought I would say this to a human, but I must confess I am impressed. ...',
				'Perhaps I have underestimated you and your kind after all. ...',
				'I guess I will take this as a lesson to keep in mind when I meet you on the battlefield. ...',
				'But that\'s in the future. For now, I will confine myself to give you the permission to trade with my people whenever you want to. ...',
				'Farewell, human!'
			}, npc, creature)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission03, 3)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.DoorToMaridTerritory, 1)
			player:addAchievement('Efreet Ally')
			addEvent(releasePlayer, 1000, npc, creature)

		elseif msgcontains(message, 'no') then
			npcHandler:say('Just do it!', npc, creature)
		end
		npcHandler.topic[creature] = 0
	end
	return true
end

-- Greeting
keywordHandler:addGreetKeyword({"djanni'hah"}, {npcHandler = npcHandler, text = "Greetings, human |PLAYERNAME|. My patience with your kind is limited, so speak quickly and choose your words well."})

npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, human. When I have taken my rightful place I shall remember those who served me well. Even if they are only humans.")
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell, human.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
