local npcType = Game.createNpcType("A Bearded Woman")
local npcConfig = {}

npcConfig.description = "A Bearded Woman"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 140,
	lookHead = 60,
	lookBody = 22,
	lookLegs = 24,
	lookFeet = 32,
	lookAddons = 1
}

npcConfig.voices = {
	interval = 2000,
	chance = 20,
	{ text = 'I am a MAN! Get me out you drunken fools!' },
	{ text = 'GET ME OUT OF HERE!' },
	{ text = 'Get me out! It was all part of the plan, you fools!' },
	{ text = 'If I ever get out of here, I\'ll kill you all! All of you!' },
	{ text = 'I am NOT Princess Lumelia, you fools!' },
	{ text = 'Get a locksmith and free me or you will regret it, you foolish pirates!' },
	{ text = 'I am not a princess, I am an actor!' }
}

npcConfig.flags = {
	attackable = false,
	hostile = false,
	floorchange = false
}

npcType.onThink = function(npc, interval)
end

npcType.onAppear = function(npc, creature)
end

npcType.onDisappear = function(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
end

npcType:register(npcConfig)
