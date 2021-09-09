local internalNpcName = "The Oracle"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeex = 1448
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local vocation = {}
local town = {}
local config = {
	towns = {
		["venore"] = TOWNS_LIST.VENORE,
		["thais"] = TOWNS_LIST.THAIS,
		["carlin"] = TOWNS_LIST.CARLIN
	},
	vocations = {
		["sorcerer"] = {
			text = "A SORCERER! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = VOCATION.ID.SORCERER
		},
		["druid"] = {
			text = "A DRUID! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = VOCATION.ID.DRUID
		},
		["paladin"] = {
			text = "A PALADIN! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = VOCATION.ID.PALADIN
		},
		["knight"] = {
			text = "A KNIGHT! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = VOCATION.ID.KNIGHT
		}
	}
}

local function greetCallback(npc, creature)
	local player = Player(creature)
	local level = player:getLevel()
	if level < 8 then
		npcHandler:say("CHILD! COME BACK WHEN YOU HAVE GROWN UP!", npc, creature)
		npcHandler:resetNpc(creature)
		return false
	elseif level > 10 then
		npcHandler:say(player:getName() ..", I CAN'T LET YOU LEAVE - YOU ARE TOO STRONG ALREADY! \z
		YOU CAN ONLY LEAVE WITH LEVEL 9 OR LOWER.", npc, creature)
		npcHandler:resetNpc(creature)
		return false
	elseif player:getVocation():getId() > VOCATION.ID.NONE then
		npcHandler:say("YOU ALREADY HAVE A VOCATION!", npc, creature)
		npcHandler:resetNpc(creature)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, player:getName() ..", ARE YOU PREPARED TO FACE YOUR DESTINY?")
	end
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end

	local player = Player(creature)
	if npcHandler.topic[creature] == 0 then
		if msgcontains(message, "yes") then
			npcHandler:say("IN WHICH TOWN DO YOU WANT TO LIVE: {CARLIN}, {THAIS}, OR {VENORE}?", npc, creature)
			npcHandler.topic[creature] = 1
		end
	elseif npcHandler.topic[creature] == 1 then
		local cityTable = config.towns[message:lower()]
		if cityTable then
			town[creature] = cityTable
			npcHandler:say("IN ".. string.upper(message) .."! AND WHAT PROFESSION HAVE YOU CHOSEN: \z
			{KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", npc, creature)
			npcHandler.topic[creature] = 2
		else
			npcHandler:say("IN WHICH TOWN DO YOU WANT TO LIVE: {CARLIN}, {THAIS}, OR {VENORE}?", npc, creature)
		end
	elseif npcHandler.topic[creature] == 2 then
		local vocationTable = config.vocations[message:lower()]
		if vocationTable then
			npcHandler:say(vocationTable.text, npc, creature)
			npcHandler.topic[creature] = 3
			vocation[creature] = vocationTable.vocationId
		else
			npcHandler:say("{KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", npc, creature)
		end
	elseif npcHandler.topic[creature] == 3 then
		if msgcontains(message, "yes") then
			npcHandler:say("SO BE IT!", npc, creature)
			player:setVocation(Vocation(vocation[creature]))
			player:setTown(Town(town[creature]))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Town(town[creature]):getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			npcHandler:say("THEN WHAT? {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", npc, creature)
			npcHandler.topic[creature] = 2
		end
	end
	return true
end

local function onAddFocus(creature)
	town[creature] = 0
	vocation[creature] = 0
end

local function onReleaseFocus(creature)
	town[creature] = nil
	vocation[creature] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_FAREWELL, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
