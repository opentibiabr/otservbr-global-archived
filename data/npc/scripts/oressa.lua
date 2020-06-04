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
	{text = "You can't take it all with you - sell your Dawnport things before \z
		you receive the gear of your definite vocation!"},
	{text = "Leave all Dawnport things behind you and choose your destiny!"},
	{text = "Come to me if you need healing!"},
	{text = "Choose your vocation and explore the mainland!"},
	{text = "Talk to me to choose your definite vocation! Become a knight, paladin, druid or sorcerer!"},
	{text = "World needs brave adventurers like you. Choose your vocation and sail to the mainland!"},
	{text = "Poisoned? Bleeding? Wounded? I can help!"}
}

npcHandler:addModule(VoiceModule:new(voices))

-- Basic keywords
keywordHandler:addKeyword({"name"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am Oressa Fourwinds, the {healer}. "
	}
)
keywordHandler:addKeyword({"healer"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "If you are hurt my child, I will {heal} your wounds."
	}
)
keywordHandler:addKeyword({"job"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can {heal} you if you are hurt. I can also help you choose your {vocation}. "
	}
)
keywordHandler:addKeyword({"doors"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Behind each of those doors, the equipment and skills of one vocation lies - \z
		sorcerer, paladin, knight or druid. ...",
		"When you have reached level 8, you can choose your definite vocation. You have to talk to me to receive it, \z
		and then you may open one of the doors, take up your vocation's gear, and leave the island. But be aware: ...",
		"Once you have chosen your vocation and stepped through a door, you cannot go back or choose a different vocation. \z
		So choose well!"
	}
)
keywordHandler:addKeyword({"inigo"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "He has seen much, and likes to help the younger ones. If you have questions about what to do, \z
			or whom to ask for anything, go to Inigo."
	}
)
keywordHandler:addKeyword({"richard"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Found a new way of living and took to it like a fish to water."
	}
)
keywordHandler:addKeyword({"coltrayne"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Ah. Some wounds never heal. <sighs> Shipwrecked in body and mind. Nowhere to go, so he doesn't leave."
	}
)
keywordHandler:addKeyword({"morris"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "He broods over problems he won't share. But maybe you can help him with a little quest or two."
	}
)
keywordHandler:addKeyword({"hamish"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "He lives only for his experiments and potions"
	}
)
keywordHandler:addKeyword({"dawnport"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
			"This is a strange place. Many beings are called to it. I dreamed of it long before I came here. ...",
			"Something spoke to me, telling me I had to be its voice; a voice of the Oracle here for the sake of \z
			the adventurers that would come to defend {World} against evil and need to {choose} their destiny."
		}
	}
)
keywordHandler:addKeyword({"rookgaard"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I have heard of it, yes."
	}
)

--From topic of vocation to topic of the "yes" msg (choosing vocation)
local topicTable = {
	[5] = VOCATION.ID.KNIGHT,
	[6] = VOCATION.ID.PALADIN,
	[7] = VOCATION.ID.DRUID,
	[8] = VOCATION.ID.SORCERER
}

local slots = {
	1, 2, 4, 5, 6, 7, 8, 9, 10
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local health = player:getHealth()
	-- Heal and help dialog
	if msgcontains(msg, "heal") and npcHandler.topic[cid] == 0 then
		if health < 40 or player:getCondition(CONDITION_POISON) then
			if health < 40 then
				player:addHealth(40 - health)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
			if player:getCondition(CONDITION_POISON) then
				player:removeCondition(CONDITION_POISON)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
			npcHandler:say("You are hurt, my child. I will heal your wounds.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "help") and npcHandler.topic[cid] == 0 then
		if player:getCondition(CONDITION_POISON) == nil or health > 40 then
			return npcHandler:say("You do not need any healing right now.", cid)
		end
		if health < 40 or player:getCondition(CONDITION_POISON) then
			if health < 40 then
				player:addHealth(40 - health)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
			if player:getCondition(CONDITION_POISON) then
				player:removeCondition(CONDITION_POISON)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
			npcHandler:say("You are hurt, my child. I will heal your wounds.", cid)
			npcHandler.topic[cid] = 0
		end
	-- Vocation dialog
	elseif npcHandler.topic[cid] == 0 and msgcontains(msg, "vocation") then
		npcHandler:say(
			{
				"A vocation is your profession and destiny, determining your skills and way of fighting. \z
					There are four vocations in Tibia: {knight}, {sorcerer}, {paladin} or {druid}. \z
					Each one has its unique special abilities. ... ",
				"When you leave the outpost through one of the four gates upstairs, you will be equipped with \z
					training gear of a specific vocation in order to defend yourself against the monsters outside. ... ",
				"You can try them out as often as you wish to. When you have gained enough experience to reach level 8, \z
					you are ready to choose the definite vocation that is to become your destiny. ... ",
				"Think carefully, as you can't change your vocation later on! You will have to choose your vocation in order \z
					to leave Dawnport for the main continent through one of these {doors} behind me. ... ",
				"Talk to me again when you are ready to choose your vocation, and I will set you on your way. "
			},
			cid, false, true, 10)
		npcHandler.topic[cid] = 1
	-- Choosing dialog start
	elseif msgcontains(msg, "choosing") or msgcontains(msg, "choose") and npcHandler.topic[cid] == 0 then
		if player:getLevel() >= 8 then
			npcHandler:say("I'll help you decide. \z
				Tell me: Do you like to keep your {distance}, or do you like {close} combat?", cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say(
				{
					"A vocation is your profession and destiny, determining your skills and way of fighting. \z
						There are four vocations in Tibia: {knight}, {sorcerer}, {paladin} or {druid}. \z
						Each one has its unique special abilities. ... ",
					"When you leave the outpost through one of the four gates upstairs, you will be equipped with \z
						training gear of a specific vocation in order to defend yourself against the monsters outside. ... ",
					"You can try them out as often as you wish to. When you have gained enough experience to reach level 8, \z
						you are ready to choose the definite vocation that is to become your destiny. ... ",
					"Think carefully, as you can't change your vocation later on! You will have to choose your vocation in order \z
						to leave Dawnport for the main continent through one of these {doors} behind me. ... ",
					"Talk to me again when you are ready to choose your vocation, and I will set you on your way. "
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "distance") and npcHandler.topic[cid] == 2 then
		npcHandler:say("Tell me: Do you prefer to fight with {bow} and {spear}, or do you want to cast {magic}?", cid)
		npcHandler.topic[cid] = 3
	-- knight
	elseif msgcontains(msg, "close") and npcHandler.topic[cid] == 2 then
		npcHandler:say(
			{
				"Then you should choose the {vocation} of a knight and become a valiant fighter with sword and shield. ...",
				"Knights are the toughest of all vocations. They can take more damage and carry more items than the other \z
					vocations, but they will deal less damage than paladins, druids or sorcerers. ...",
				"Knights can wield one- or two-handed swords, axes and clubs, and they can cast a few spells to draw a \z
					monster's attention to them. ...",
				"So tell me: DO YOU WISH TO BECOME A VALIANT KNIGHT? Answer with a proud {YES} if that is your choice!"
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 5
	-- Paladin
	elseif msgcontains(msg, "bow") or msgcontains(msg, "spear") and npcHandler.topic[cid] == 3 then
		npcHandler:say(
			{
				"Then you should join the ranks of the paladins, noble hunters and rangers of the wild, who rely on the \z
					swiftness of movement and ranged attacks. ...",
				"Paladins are jacks of all trades. They are tougher than the magically gifted and can carry more items \z
					than druids or sorcerers, but they can take not as much damage as a knight can. ...",
				"Paladins deal more damage than knights but less than druids or sorcerers, and have the longest range \z
					in their distance attacks. ...",
				"They can also use holy magic to slay the unholy and undead in particular. ...",
				"DO YOU WISH TO BECOME A DARING PALADIN? Answer with a proud {YES} if that is your choice!"
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 6
	-- Mage
	elseif msgcontains(msg, "magic") and npcHandler.topic[cid] == 3 then
		npcHandler:say("Tell me: Do you prefer to {heal} and cast the power of nature and ice, or do you want to rain \z
			fire and {death} on your foes?", cid)
		npcHandler.topic[cid] = 4
	-- Druid
	elseif msgcontains(msg, "heal") and npcHandler.topic[cid] == 4 then
		npcHandler:say(
			{
				"Then you should learn the ways of the druids, healers and powerful masters of natural magic. ...",
				"Druids can heal their friends and allies, but they can also cast powerful ice and earth magic \z
					to kill their enemies. They can do a little energy, fire or death damage as well. ...",
				"Druids cannot take much damage or carry many items, but they deal \z
					much more damage than paladins or knights. ...",
				"So tell me: DO YOU WISH TO BECOME A SAGACIOUS DRUID? Answer with a proud {YES} if that is your choice!"
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 7
	-- Sorcerer
	elseif msgcontains(msg, "death") and npcHandler.topic[cid] == 4 then
		npcHandler:say(
			{
				"Then you should become a sorcerer, a mighty wielder of deathly energies and arcane fire. ...",
				"Sorcerers are powerful casters of magic. They use fire, energy and death magic to lay low their enemies. \z
					They can do a little ice or earth damage as well. ...",
				"Sorcerers cannot take much damage or carry many items, \z
					but they deal much more damage than paladins or knights. ...",
				"So tell me: DO YOU WISH TO BECOME A POWERFUL SORCERER? Answer with a proud {YES} if that is your choice!"
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 8
	-- Choosing dialog start
	elseif msgcontains(msg, "decided") and npcHandler.topic[cid] == 0 then
		npcHandler:say("So tell me, which {vocation} do you want to choose: {knight}, {sorcerer}, {paladin} or {druid}?", cid)
	-- Say vocations name
	elseif msgcontains(msg, "sorcerer") and npcHandler.topic[cid] == 0 then
		if player:getLevel() >= 8 then
			npcHandler:say(
				{
					"Sorcerers are powerful casters of death, energy and fire magic. \z
					They can do a little ice or earth damage as well. ...",
					"Sorcerers cannot take much damage or carry many items, but they deal more damage than paladins or knights, \z
					and can target several enemies. ...",
					"So tell me: DO YOU WISH TO BECOME A POWERFUL SORCERER? Answer with a proud {YES} if that is your choice!"
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 8
		else
			npcHandler:say(
				{
					"Sorcerers are powerful casters of death, energy and fire magic. \z
					They can do a little ice or earth damage as well. ...",
					"Sorcerers cannot take much damage or carry many items, but they deal more damage than paladins or knights, \z
					and can target several enemies. ..."
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "druid") and npcHandler.topic[cid] == 0 then
		if player:getLevel() >= 8 then
			npcHandler:say(
				{
					"Druids are healers and powerful masters of ice and earth magic. \z
					They can also do a little energy, fire or death damage as well. ... ",
					"Druids cannot take much damage or carry many items, but they deal more damage than paladins or knights, \z
						and can target several enemies. ... ",
					"So tell me: DO YOU WISH TO BECOME A SAGACIOUS DRUID? Answer with a proud {YES} if that is your choice!"
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say(
				{
					"Druids are healers and powerful masters of ice and earth magic. \z
					They can also do a little energy, fire or death damage as well. ... ",
					"Druids cannot take much damage or carry many items, but they deal more damage than paladins or knights, \z
					and can target several enemies. ... ",
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "paladin") and npcHandler.topic[cid] == 0 then
		if player:getLevel() >= 8 then
			npcHandler:say(
				{
					"Paladins are sturdy distance fighters. They are tougher than druids or sorcerers and can carry more 	items, \z
						but they are less tough than a knight. ... ",
					"Paladins have the longest attack range, and can deal the most damage on a single target. ... ",
					"They can also use holy magic to slay the unholy and undead in particular. ... ",
					"So tell me: DO YOU WISH TO BECOME A DARING PALADIN? Answer with a proud {YES} if that is your choice!"
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 6
		else
			npcHandler:say(
				{
					"Paladins are sturdy distance fighters. They are tougher than druids or sorcerers and can carry more 	items, \z
						but they are less tough than a knight. ... ",
					"Paladins have the longest attack range, and can deal the most damage on a single target. ... ",
					"They can also use holy magic to slay the unholy and undead in particular. ... "
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "knight") and npcHandler.topic[cid] == 0 then
		if player:getLevel() >= 8 then
			npcHandler:say(
				{
					"Knights are stalwart melee fighters, the toughest of all vocations. They can take more damage and carry \z
						more items than the other vocations, but they will deal less damage than paladins, druids or sorcerers. ... ",
					"Knights can wield one- or two-handed swords, axes and clubs, and they can cast a few spells to draw a \z
						monster's attention to them. ... ",
					"If you want to be a tough melee fighter who can resist much longer than anyone else, \z
						you should consider choosing the knight vocation.",
					"DO YOU WISH TO BECOME A VALIANT KNIGHT? Answer with a proud {YES} if that is your choice!"
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 5
		else
			npcHandler:say(
				{
					"Knights are stalwart melee fighters, the toughest of all vocations. They can take more damage and carry \z
						more items than the other vocations, but they will deal less damage than paladins, druids or sorcerers. ... ",
					"Knights can wield one- or two-handed swords, axes and clubs, and they can cast a few spells to draw a \z
						monster's attention to them. ... ",
					"If you want to be a tough melee fighter who can resist much longer than anyone else, \z
						you should consider choosing the knight vocation."
				},
			cid, false, true, 10)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 5
	or npcHandler.topic[cid] == 6
	or npcHandler.topic[cid] == 7
	or npcHandler.topic[cid] == 8 then
		for index, value in pairs(topicTable)do
			if npcHandler.topic[cid] == index then
				if player:getStorageValue(Storage.Dawnport.DoorVocation) == -1 then
					player:setVocation(Vocation(value))
					player:setStorageValue(Storage.Dawnport.DoorVocation, value)
				else
					npcHandler.topic[cid] = 0
					return true
				end
			end
		end
		-- Cycle through the slots table and store the slot id in slot
		for index, value in pairs(slots) do
			-- Get the player's slot item and store it in item
			local item = player:getSlotItem(value)
			-- If the item exists meaning its not nil then continue
			if item and not table.contains({2480}, item:getId()) then
				item:remove()
			end
		end
		local container = player:getSlotItem(CONST_SLOT_BACKPACK)
		local allowedIds = {
				2050, 2051, 2052, 2053,
				2054, 2055, 2056, 2120,
				2148, 2420, 2480, 2553,
				2554, 2580, 5710, 8722,
				8723
			}
		local toBeDeleted = {}
		if container and container:getSize() > 0 then
			for i = 0, container:getSize() do
				if player:getMoney() > 500 then
					player:removeMoney(math.abs(500 - player:getMoney()))
				end
				local item = container:getItem(i)
				if item then
					if not table.contains(allowedIds, item:getId()) then
						toBeDeleted[#toBeDeleted + 1] = item.uid
					end
				end
			end
			if #toBeDeleted > 0 then
				for i, v in pairs(toBeDeleted) do
					local item = Item(v)
					if item then
						item:remove()
					end
				end
			end
		end
		npcHandler:say(
			{
				"SO BE IT. CAST OFF YOUR TRAINING GEAR AND RISE, NOBLE ".. player:getVocation():getName():upper() .. "! ...",
				"Go through the second door from the right. Open the chest and take the equipment inside \z
					before you leave to the north. ...",
				"Take the ship to reach the Mainland. Farewell, friend and good luck in all you undertake!"
			},
		cid, false, true, 10)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome, young adventurer. Tell me if you need help in \z
	{choosing} your {vocation}, or if you have {decided} on the {vocation} you want to choose.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, child.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())
