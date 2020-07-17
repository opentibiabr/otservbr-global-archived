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
	{text = "All aboard! Prepare to sail!"},
	{text = "Come hell or high water, we'll reach any port I sail you to!"},
	{text = "This island is too small. I need sea water around me."}
}

npcHandler:addModule(VoiceModule:new(voices))

--From topic of the citys name to topic of the "yes" msg
local topicTable = {
	[3] = 13,
	[4] = 14,
	[5] = 15,
	[6] = 16,
	[7] = 17,
	[8] = 18,
	[9] = 19,
	[10] = 20,
	[11] = 21,
	[12] = 22,
	[13] = 23
}

--From topic of final msg "yes" to select town
local townTable = {
	[13] = TOWNS_LIST.AB_DENDRIEL,
	[14] = TOWNS_LIST.ANKRAHMUN,
	[15] = TOWNS_LIST.CARLIN,
	[16] = TOWNS_LIST.DARASHIA,
	[17] = TOWNS_LIST.EDRON,
	[18] = TOWNS_LIST.KAZORDOON,
	[19] = TOWNS_LIST.LIBERTY_BAY,
	[20] = TOWNS_LIST.PORT_HOPE,
	[21] = TOWNS_LIST.SVARGROND,
	[22] = TOWNS_LIST.THAIS,
	[23] = TOWNS_LIST.VENORE
}

local function greetCallback(cid)
	local player = Player(cid)
	npcHandler:setMessage(
		MESSAGE_GREET,
		"Well, well, a new " ..
			player:getVocation():getName():lower() .. "! \z
		Want me to bring you somewhere nice? Just say {yes}."
	)
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "yes") and npcHandler.topic[cid] == 0 then
		npcHandler:say("Good. Got all you want to take to the mainland, {yes}? Gear, limbs, loot?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		npcHandler:say(
			"Well, I can tell you stuff about {Ab'Dendriel}, {Ankrahmun}, {Carlin}, \z
			{Darashia}, {Edron}, {Kazordoon}, {Liberty Bay}, {Port Hope}, {Svargrond}, {Thais}, {Venore} or {Yalahar}.",
			cid
		)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "ab'dendriel") and npcHandler.topic[cid] == 2 then
		npcHandler:say(
			{
				"Main city of the elves - lots of trees, bug milk and stuff that easily burns ...",
				"... Sorry, just thinking aloud. Ahem. Very cosy and safe I guess if you're fond of nature. \z
					I can {sail} there if you like."
			},
			cid,
			false,
			true,
			10
		)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "ankrahmun") and npcHandler.topic[cid] == 2 then
		if player:isPremium() then
			npcHandler:say(
				"Only for premium travelers! Desert pyramid city close to the ocean, \z
		some underground tombs where I heard it's not bad hunting. I can {sail} there if you like.",
				cid
			)
			npcHandler.topic[cid] = 4
		else
			npcHandler:say("You are not a premium account..", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "carlin") and npcHandler.topic[cid] == 2 then
		npcHandler:say(
			"A city ruled by forthright independent women. Very clean and safe, \z
			but also very strict on the booze, alas. But if that's what you like... I can {sail} there if you like.",
			cid
		)
		npcHandler.topic[cid] = 5
	elseif msgcontains(msg, "darashia") and npcHandler.topic[cid] == 2 then
		if player:isPremium() then
			npcHandler:say(
				"Only for premium travelers! One of the two desert cities. \z
			Built around a lovely oasis. Lions, dragons... decent location for a newcomer. I can {sail} there if you like.",
				cid
			)
			npcHandler.topic[cid] = 6
		else
			npcHandler:say("You are not a premium account..", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "edron") and npcHandler.topic[cid] == 2 then
		if player:isPremium() then
			npcHandler:say(
				"Only for premium travelers! Quiet little castle city on an island in the north-eastern \z
			part of Tibia. Trolls, goblins, rotworms... good place for starters, too. I can {sail} there if you like.",
				cid
			)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say("You are not a premium account..", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "kazordoon") and npcHandler.topic[cid] == 2 then
		npcHandler:say("The underground dwarven city. Doesn't have a real harbour, so I can't bring you there, sorry.", cid)
		npcHandler.topic[cid] = 8
	elseif msgcontains(msg, "liberty bay") and npcHandler.topic[cid] == 2 then
		if player:isPremium() then
			npcHandler:say(
				"Only for premium travelers! Liberty Bay is on an island group in the South Seas. \z
			Ah, home sweet home. Err. I mean, it's pirates galore. Good deal of tortoises, too. \z
			Just be careful, then it's a good hunting location. I can {sail} there if you like.",
				cid
			)
			npcHandler.topic[cid] = 9
		else
			npcHandler:say("You are not a premium account..", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "port hope") and npcHandler.topic[cid] == 2 then
		if player:isPremium() then
			npcHandler:say(
				{
					"Only for premium travelers! Port Hope is an outpost right in the middle of the jungle. ...",
					"Apes, bananas, hydras, tarantulas... Who'd want to go there? \z
				Except for crazy adventurers like these guys here on the island, obviously. Still, I can {sail} there if you like."
				},
				cid,
				false,
				true,
				10
			)
			npcHandler.topic[cid] = 10
		else
			npcHandler:say("You are not a premium account..", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "svargrond") and npcHandler.topic[cid] == 2 then
		if player:isPremium() then
			npcHandler:say(
				"Negative, can't bring you there. \z
			You gotta pass some sort of Barbarian test before they let you live there. \z
			Still, you should go there sometime, I heard it's quite interesting.",
				cid
			)
			npcHandler.topic[cid] = 11
		else
			npcHandler:say("You are not a premium account..", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "thais") and npcHandler.topic[cid] == 2 then
		npcHandler:say(
			"Old-school city. Actually the oldest main city in Tibia. \z
			Be careful on those streets, there are bandits everywhere. But I can {sail} there if you like.",
			cid
		)
		npcHandler.topic[cid] = 12
	elseif msgcontains(msg, "venore") and npcHandler.topic[cid] == 2 then
		npcHandler:say(
			"Hohoh, one of the richest cities, filled with merchants and LOOT! Err. \z
			I mean, it is HIGHLY recommendable for unexperienced and first-time adventurers. \z
			Don't know why they built it over a stinking swamp though. I can {sail} there if you like.",
			cid
		)
		npcHandler.topic[cid] = 13
	elseif msgcontains(msg, "sail") then
		for index, value in pairs(topicTable) do
			if npcHandler.topic[cid] == index then
				npcHandler:say("So, you've decided on your new home city?", cid)
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
				npcHandler:say(
					"Cast off! Don't forget to talk to the guide at the port for directions to nearest bars... \z
					err, shops and bank and such!",
					cid
				)
				npcHandler.topic[cid] = 0
			end
		end
	else
		npcHandler:say(
			"Kid, listen. Answering with a clear {yes} will get you much further in World. \z
			Most people are not as sharp-eared as I am. Got that?",
			cid
		)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(
	MESSAGE_FAREWELL,
	"You sure you want to spend time on this piece of rock? \z
I can show you the world! Huh."
)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new())
