local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end

local voices = {
	{text = "No smuggling aboard this ship! Only 20 pieces of any creature product allowed!"},
	{text = "No fear! The Sea Cat will ship you safely to the mainland!"},
	{text = "All aboard! Prepare to sail!" },
	{text = "Come hell or high water, we'll reach any port I sail you to!"},
	{text = "This island is too small. I need sea water around me."}
}

npcHandler:addModule(VoiceModule:new(voices))

--From topic of the citys name to topic of the "yes" msg
local topicTable = {
	[9] = 19,
	[10] = 20,
	[11] = 21,
	[12] = 22,
	[13] = 23,
	[14] = 24,
	[15] = 25,
	[16] = 26,
	[17] = 27
}

--From topic of final msg "yes" to select town
local townTable = {
	[19] = TOWNS_LIST.AB_DENDRIEL,
	[20] = TOWNS_LIST.ANKRAHMUN,
	[21] = TOWNS_LIST.CARLIN,
	[22] = TOWNS_LIST.DARASHIA,
	[23] = TOWNS_LIST.EDRON,
	[24] = TOWNS_LIST.LIBERTY_BAY,
	[25] = TOWNS_LIST.PORT_HOPE,
	[26] = TOWNS_LIST.THAIS,
	[27] = TOWNS_LIST.VENORE
}

local freeTown = {
	["venore"] = TOWNS_LIST.VENORE,
	["thais"] = TOWNS_LIST.THAIS,
	["carlin"] = TOWNS_LIST.CARLIN,
	["ab'dendriel"] = TOWNS_LIST.AB_DENDRIEL
}

--Venore town
local venoreTown = Town(TOWNS_LIST.VENORE)

local function greetCallback(cid)
	local player = Player(cid)
	npcHandler:setMessage(MESSAGE_GREET, "Well, well, a new ".. player:getVocation():getName():lower() .."! \z
		Want me to bring you somewhere nice? Just say {yes}.")
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "yes") and npcHandler.topic[cid] == 0 or npcHandler.topic[cid] == 10 then
		npcHandler:say("Good. Got all you want to take to the mainland, {yes}? Gear, limbs, loot?", cid)
		npcHandler.topic[cid] = 1
	elseif not msgcontains(msg, "yes") and not msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
		npcHandler:say("Errr... was that a foreign language? Could you just answer with a clear {yes} or {no}?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
		npcHandler:say("While you take time to ponder, I will just stroll over there \z
			and pretend not to listen to you thinking.", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 0 then
		npcHandler:say("What? Then what DO you want? Learn about the main World {cities}?", cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "cities") and npcHandler.topic[cid] == 3
	or npcHandler.topic[cid] == 0 or npcHandler.topic[cid] == 8 then
		npcHandler:say("Well, I can tell you stuff about {Ab'Dendriel}, {Ankrahmun}, {Carlin}, \z
			{Darashia}, {Edron}, {Kazordoon}, {Liberty Bay}, {Port Hope}, {Svargrond}, {Thais}, {Venore} or {Yalahar}.", cid)
		npcHandler.topic[cid] = 5
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 3 then
		npcHandler:say("Good. Want to know about {Ab'Dendriel}, {Ankrahmun}, {Carlin}, {Darashia}, \z
			{Edron}, {Kazordoon}, {Liberty Bay}, {Port Hope}, {Svargrond}, {Thais}, {Venore} or {Yalahar}?", cid)
		npcHandler.topic[cid] = 6
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 3 then
		npcHandler:say("So you know it all, huh? Where do you want me to bring you to, kid? \z
			{Ab'Dendriel}, {Carlin}, {Thais} or {Venore}?", cid)
		npcHandler.topic[cid] = 7
	elseif msgcontains(msg, "sail") and npcHandler.topic[cid] == 0 then
		npcHandler:say("So, you've decided on your new home city? Which one will it be?", cid)
		npcHandler.topic[cid] = 7
	elseif player:isPremium() == false then
		local cityNames = freeTown[msg:lower()]
		if cityNames then
			local townId = Town(cityNames)
			if player:getTown() ~= townId then
				player:setTown(townId)
				player:teleportTo(townId:getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:setStorageValue(Storage.Dawnport.Mainland, 1)
				npcHandler:say("Cast off! Don't forget to talk to the guide at the port for directions to nearest bars... \z
					err, shops and bank and such!", cid)
				npcHandler.topic[cid] = 0
				return true
			end
		else
			npcHandler:say("What? Whatever that is, it's not a port I sail to. {Ab'Dendriel}, \z
			{Carlin}, {Thais} or {Venore}?", cid)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2 then
		npcHandler:say(
			{
				"Quick learner, good answer. For inexperienced newcomers, I'd recommend the city of {Venore}. \z
					Great place to start! ...",
				"Though I can tell you about the other main World {cities} too, if you wish. So, ready to set sail for {Venore}?"
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 8
	elseif msgcontains(msg, "venore") and npcHandler.topic[cid] == 8 then
		player:setTown(venoreTown)
		player:teleportTo(venoreTown:getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(Storage.Dawnport.Mainland, 1)
		npcHandler:say("Cast off! Don't forget to talk to the guide at the port for directions to nearest bars... \z
			err, shops and bank and such!", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, "ab'dendriel") and npcHandler.topic[cid] == 5 then
		npcHandler:say(
			{
				"Main city of the elves - lots of trees, bug milk and stuff that easily burns ...",
				"... Sorry, just thinking aloud. Ahem. Very cosy and safe I guess if you're fond of nature. \z
					I can {sail} there if you like."
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 9
	elseif msgcontains(msg, "ankrahmun") and npcHandler.topic[cid] == 5 then
		npcHandler:say("Only for premium travellers! Desert pyramid city close to the ocean, \z
		some underground tombs where I heard it's not bad hunting. I can {sail} there if you like.",
		cid)
		npcHandler.topic[cid] = 10
	elseif msgcontains(msg, "carlin") and npcHandler.topic[cid] == 5 then
		npcHandler:say("A city ruled by forthright independent women. Very clean and safe, \z
			but also very strict on the booze, alas. But if that's what you like... I can {sail} there if you like.", cid)
		npcHandler.topic[cid] = 11
	elseif msgcontains(msg, "darashia") and npcHandler.topic[cid] == 5 then
		npcHandler:say("Only for premium travellers! One of the two desert cities. \z
			Built around a lovely oasis. Lions, dragons... decent location for a newcomer. I can {sail} there if you like.", cid)
		npcHandler.topic[cid] = 12
	elseif msgcontains(msg, "edron") and npcHandler.topic[cid] == 5 then
		npcHandler:say("Only for premium travellers! Quiet little castle city on an island in the north-eastern \z
			part of Tibia. Trolls, goblins, rotworms... good place for starters, too. I can {sail} there if you like.", cid)
		npcHandler.topic[cid] = 13
	elseif msgcontains(msg, "kazordoon") and npcHandler.topic[cid] == 5 then
		npcHandler:say("The underground dwarven city. Doesn't have a real harbour, so I can't bring you there, sorry.", cid)
		npcHandler.topic[cid] = 5
	elseif msgcontains(msg, "liberty bay") and npcHandler.topic[cid] == 5 then
		npcHandler:say("Only for premium travellers! Liberty Bay is on an island group in the South Seas. \z
			Ah, home sweet home. Err. I mean, it's pirates galore. Good deal of tortoises, too. \z
			Just be careful, then it's a good hunting location. I can {sail} there if you like.", cid)
		npcHandler.topic[cid] = 14
	elseif msgcontains(msg, "port hope") and npcHandler.topic[cid] == 5 then
		npcHandler:say(
			{
				"Only for premium travellers! Port Hope is an outpost right in the middle of the jungle. ...",
				"Apes, bananas, hydras, tarantulas... Who'd want to go there? \z
				Except for crazy adventurers like these guys here on the island, obviously. Still, I can {sail} there if you like.",
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 15
	elseif msgcontains(msg, "svargrond") and npcHandler.topic[cid] == 5 then
		npcHandler:say("Negative, can't bring you there. \z
			You gotta pass some sort of Barbarian test before they let you live there. \z
			Still, you should go there sometime, I heard it's quite interesting.", cid)
		npcHandler.topic[cid] = 5
	elseif msgcontains(msg, "thais") and npcHandler.topic[cid] == 5 then
		npcHandler:say("Old-school city. Actually the oldest main city in Tibia. \z
			Be careful on those streets, there are bandits everywhere. But I can {sail} there if you like.", cid)
		npcHandler.topic[cid] = 16
	elseif msgcontains(msg, "venore") and npcHandler.topic[cid] == 5 then
		npcHandler:say("Hohoh, one of the richest cities, filled with merchants and LOOT! Err. \z
			I mean, it is HIGHLY recommendable for unexperienced and first-time adventurers. \z
			Don't know why they built it over a stinking swamp though. I can {sail} there if you like.", cid)
		npcHandler.topic[cid] = 17
	elseif msgcontains(msg, "sail") then
		for index, value in pairs(topicTable) do
			if npcHandler.topic[cid] == index then
				npcHandler:say("So, you've decided on your new home city? Which one will it be?", cid)
				npcHandler.topic[cid] = value
			end
		end
	elseif msgcontains(msg, "yes") then
		for index, value in pairs(townTable) do
			local townId = Town(value)
			if npcHandler.topic[cid] == index then
				player:setTown(townId)
				player:teleportTo(townId:getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:setStorageValue(Storage.Dawnport.Mainland, 1)
				npcHandler:say("Cast off! Don't forget to talk to the guide at the port for directions to nearest bars... \z
					err, shops and bank and such!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	else
		npcHandler:say("Kid, listen. Answering with a clear {yes} or {no} will get you much further in Tibia. \z
			Most people are not as sharp-eared as I am. Got that?", cid)
		npcHandler.topic[cid] = 10
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "You sure you want to spend time on this piece of rock? \z
I can show you the world! Huh.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new())
