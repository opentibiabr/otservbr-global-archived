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

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({"energy soil"}, 8303, 2000, 1)
shopModule:addSellableItem({"eternal flames"}, 8304, 5000, 1)
shopModule:addSellableItem({"flawless ice crystal"}, 8300, 5000, 1)
shopModule:addSellableItem({"glimmering soil"}, 8299, 2000, 1)
shopModule:addSellableItem({"mother soil"}, 8305, 5000, 1)
shopModule:addSellableItem({"iced soil"}, 8302, 2000, 1)
shopModule:addSellableItem({"natural soil"}, 8298, 2000, 1)
shopModule:addSellableItem({"neutral matter"}, 8310, 5000, 1)
shopModule:addSellableItem({"pure energy"}, 8306, 5000, 1)

local voices = {
	{ text = "...the arithmetical paradox has the same value in a metaphysical way, then..." },
	{ text = "Oh my! Alverus!! Did you really...?!?! I have to recalculate it to make sure that I made no mistake." },
	{ text = "<mumbles>" },
	{ text = "...the minimum square deviation could cause a dislocation, in a matter of fact..." },
	{ text = "...it could be possible to bring the sphere to a destination where..." },
	{ text = "Yes, that's it! The elementary particle are corresponding to the... the ... UNBELIEVEABLE!!!" }
}

npcHandler:addModule(VoiceModule:new(voices))

local greetMsg = {
	"...if the expected constant is higher than... Hmmm, who are you?? What do you want?",
	"...then I could transform a spell to bend... How can anyone expect me to work under these conditions?? \z
	What do you want?",
	"...if my calculations are correct, I will be able to revive... Arrgghh!! What do you want?"
}

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, greetMsg[math.random(#greetMsg)])
	npcHandler.topic[cid] = 0
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "alverus") then
		npcHandler:say({
			"It happened while he carried out an experiment concerning the creation of the elemental {shrines}. \z
			I still get goose bumps just by thinking of it. ...",
			"You need to know about the process of creating an elemental shrine to understand it completely, \z
			but I don't want to go into detail now. ...",
			"Anyway, his spell had a different outcome than he had planned. He accidentally created an Ice Overlord, \z
			pure living elemental ice, who froze him in a blink of an eye."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "shrine") then
		npcHandler:say({
			"The creation of the elemental shrines is a really complex matter. \z
			They are actually nodes, locations where the matching elemental sphere is very close. ...",
			"The shrine itself is like a portal between our world and the elemental {sphere} and \z
			enables us to use the elemental energy emerging from it."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "sphere") and player:getLevel() >= 80 then
		npcHandler:say({
			"There are four spheres we know of: ice, fire, earth and energy. ....<mumbles> Hmmm, should \z
			I ask or not?....The heck with it! Now that you know about the spheres ...",
			"I found a way to visit them. It's VERY dangerous and there is a decent chance that you won't come back \z
			BUT if you succeed you'll write history!!! Ask me about that {mission} if you're interested."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "mission") or msgcontains(msg, "quest") then
		local value = player:getStorageValue(Storage.ElementalSphere.QuestLine)
		if value < 1 then
			if player:getLevel() >= 80 then
				if player:isSorcerer() then
					npcHandler:say({
						"Okay, listen closely: First of all, you need to gather 20 enchanted rubies in order \z
						to go to the fire sphere. Deep under the academy, one floor below the elemental shrines, \z
						there is a machine. Put the gems in there and activate it. ...",
						"Once you got there, find a way to gather elemental fire in any form. \z
						You will face fire elementals, that's for sure, but I don't know how the fire is stored. ...",
						"Anyway, there should be a way to use that elemental fire and strengthen one of the \z
						elementals. If my calculations are right, you will create a Fire Overlord who \z
						hopefully will consist of some sort of 'concentrated' fire or something similar. ...",
						"THAT'S what we need!! Are you in on it?"
					}, cid)
				elseif player:isDruid() then
					npcHandler:say({
						"Okay, listen closely: First of all, you need to gather 20 enchanted emeralds in order to \z
						go to the earth sphere. Deep under the academy, one floor below the elemental shrines, \z
						there is a machine. Put the gems in there and activate it. ...",
						"Once you got there, find a way to gather elemental earth in any form. \z
						You will face earth elementals, that's for sure, but \z
						I don't know how the earth is stored. ...",
						"Anyway, there should be a way to use that elemental earth and strengthen one \z
						of the elementals. If my calculations are right, you will create an Earth Overlord \z
						who hopefully will consist of some sort of 'concentrated' earth or something similar. ...",
						"THAT'S what we need!! Are you in on it?"
					}, cid)
				elseif player:isPaladin() then
					npcHandler:say({
						"Okay, listen closely: First of all, you need to gather 20 enchanted sapphires in \z
						order to go to the ice sphere. Deep under the academy, one floor below the elemental shrines, \z
						there is a machine. Put the gems in there and activate it. ...",
						"Once you got there, find a way to gather elemental ice in any form. \z
						You will face ice elementals, that's for sure, but I don't know how the ice is stored. ...",
						"Anyway, there should be a way to use that elemental ice and strengthen \z
						one of the elementals. If my calculations are right, you will create an \z
						Ice Overlord who hopefully will consist of some sort of 'concentrated' \z
						ice or something similar. ...",
						"THAT'S what we need!! Are you in on it?"
					}, cid)
				elseif player:isKnight() then
					npcHandler:say({
						"Okay, listen closely: First of all, you need to gather 20 enchanted amethysts in order \z
						to go to the energy sphere. Deep under the academy, one floor below the elemental shrines, \z
						there is a machine. Put the gems in there and activate it. ...",
						"Once you got there, find a way to gather elemental energy in any form. \z
						You will face energy elementals, that's for sure, but \z
						I don't know how the energy is stored. ...",
						"Anyway, there should be a way to use that energy and strengthen one of the elementals. \z
						If my calculations are right, you will create an Energy Overlord who \z
						hopefully will consist of some sort of 'concentrated' energy. ...",
						"THAT'S what we need!! Are you in on it?"
					}, cid)
				end
			else
				npcHandler:say("I'm sorry this task is highly dangerous and I need experienced people for it.", cid)
				npcHandler.topic[cid] = 0
				return false
			end
			npcHandler.topic[cid] = 1
		elseif value == 1 then
			if player:getItemCount(player:isSorcerer() and 8304 or 
			player:isDruid() and 8305 or player:isPaladin() and 8300 or 
			player:isKnight() and 8306) > 0 then
				player:setStorageValue(Storage.ElementalSphere.QuestLine, 2)
				npcHandler:say({
					"Impressive!! Let me take a look.......Ahh, " .. (player:isSorcerer() and "an ETERNAL FLAME! \z
					Now you need to find a knight, a druid, and a paladin who also completed \z
					this first task. ..." or player:isDruid() and "MOTHER SOIL! Now you need to find a knight, \z
					a paladin, and a sorcerer who also completed this first \z
					task. ..." or player:isPaladin() and "a FLAWLESS ICE CRYSTAL! Now you need to find \z
					a knight, a druid, and a sorcerer who also completed this first \z
					task. ..." or player:isKnight() and "PURE ENERGY! Now you need to find a druid, a paladin, \z
					and a sorcerer who also completed this first task. ..."),
					"Go down in the cellar again. I prepared a room under the academy where it should be safe. \z
					Your task is to charge the machines with the elemental substances and \z
					summon the LORD OF THE ELEMENTS. ...",
					"When you use an obsidian knife on it's corpse you hopefully get some of \z
					the precious neutral matter. It's the only way to revive my dear friend Alverus!!"
				}, cid)
			else
				npcHandler:say("You need some kind of pure elemental soil from \z
				the " .. (player:isSorcerer() and "Fire" or player:isDruid() and \z
				"Earth" or player:isPaladin() and "Ice" or player:isKnight() and "Energy") .. " \z
				Overlord. Come back when you've got it.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif value == 2 then
			if player:removeItem(8310, 1) and \z
			player:getStorageValue(Storage.ElementalSphere.QuestLine) < 3 then
				npcHandler:say("AMAZING!! I'm going to start immediately with the research. \z
				If it turns out the way I expect it, Alverus will be revived soon!! Here, \z
				take this as a reward and try to collect more of this substance. \z
				I'll make you a good offer, I promise. ", cid)
				player:addItem(player:isSorcerer() and 8867 or \z
				player:isDruid() and 8869 or \z
				player:isPaladin() and 8853 or \z
				player:isKnight() and 8883, 1)
				player:setStorageValue(Storage.ElementalSphere.QuestLine, 3)
			end
		end
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "yes") then
		player:setStorageValue(Storage.ElementalSphere.QuestLine, 1)
		npcHandler:say("Good, don't waste time! Come back here when you have the elemental object!", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "How dare you asking me this?!? I'm Arkulius - \z
		Master of Elements, the HEADMASTER of this academy!!"
	}
)
keywordHandler:addKeyword({'name'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I'm Arkulius - Master of Elements, the headmaster of this academy."
	}
)
keywordHandler:addKeyword({'help'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I have better things to do than helping you. See that ice statue over there? \z
		My dear friend Alverus needs to be revived!"
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Time is an illusion and completely irrelevant to me."
	}
)
keywordHandler:addKeyword({'weapon'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Weapons are for those people who aren't able to use their heads or \z
		better what's INSIDE their heads. No offence <coughs>."
	}
) -- < Knight; FIXME !!!
keywordHandler:addKeyword({'pits of inferno'}, StdModule.say, 
	{
	npcHandler = npcHandler, 
	text = "Yeye, I believe you almost feel like home among all those brainless creatures!"
	}
)

npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and please stay away, okay?")
npcHandler:setMessage(MESSAGE_FAREWELL, "At last! Good things come to those who wait.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
