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

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if npcHandler.topic[cid] == 0 then
		if msgcontains(msg, 'outfit') then
			npcHandler:say({
				'I\'m tired of all these young unskilled wannabe heroes. Every Tibian can show his skills or \z
				actions by wearing a special outfit. To prove oneself worthy of the demon outfit, \z
				this is how it goes: ...',
				'The base outfit will be granted for completing the annihilator quest, which isn\'t \z
				much of a challenge nowadays, in my opinion. Anyway ...',
				'The shield however will only be granted to those adventurers who have finished the \z
				demon helmet quest. ...',
				'Well, the helmet is for those who really are tenacious and have hunted down all 6666 demons \z
				and finished the demon oak as well. ...',
				'Are you interested?'
			}, cid)
			npcHandler.topic[cid] = 1
		elseif msgcontains(msg, 'cookie') then
			if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) == 31
					and player:getStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.AvarTar) ~= 1 then
				npcHandler:say('Do you really think you could bribe a hero like me with a meagre cookie?', cid)
				npcHandler.topic[cid] = 3
			end
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('So you want to have the demon outfit, hah! Let\'s have a look first if you really \z
			deserve it. Tell me: {base}, {shield} or {helmet}?', cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 3 then
			if not player:removeItem(8111, 1) then
				npcHandler:say('You have no cookie that I\'d like.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:setStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.AvarTar, 1)
			if player:getCookiesDelivered() == 10 then
				player:addAchievement('Allow Cookies?')
			end

			Npc():getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			npcHandler:say('Well, you won\'t! Though it looks tasty ...What the ... WHAT DO YOU THINK YOU ARE? \z
			THIS IS THE ULTIMATE INSULT! GET LOST!', cid)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		end
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 3 then
			npcHandler:say('I see.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'base') then
			if player:getStorageValue(Storage.AnnihilatorDone) == 1 then
				player:addOutfit(541)
				player:addOutfit(542)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.AnnihilatorDone, 2)
				npcHandler:say('Receive the base outfit, |PLAYERNAME|.', cid)
			else
				npcHandler:say('You need to complete annihilator quest first, |PLAYERNAME|.', cid)
				npcHandler.topic[cid] = 2
			end
		elseif msgcontains(msg, 'shield') then
			if player:getStorageValue(Storage.AnnihilatorDone) == 2 and 
			player:getStorageValue(Storage.QuestChests.DemonHelmetQuestDemonHelmet) == 1 then
				player:addOutfitAddon(541, 1)
				player:addOutfitAddon(542, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.QuestChests.DemonHelmetQuestDemonHelmet, 2)
				npcHandler:say('Receive the shield, |PLAYERNAME|.', cid)
			else
				npcHandler:say('The shield will only be granted to those adventurers who have finished the \z
				demon helmet quest, |PLAYERNAME|.', cid)
				npcHandler.topic[cid] = 2
			end
		elseif msgcontains(msg, 'helmet') then
			if player:getStorageValue(Storage.AnnihilatorDone) == 2 and 
			player:getStorageValue(Storage.DemonOak.Done) == 3 then
				player:addOutfitAddon(541, 2)
				player:addOutfitAddon(542, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.DemonOak.Done, 4)
				npcHandler:say('Receive the helmet, |PLAYERNAME|.', cid)
			else
				npcHandler:say('The helmet is for those who have hunted down all 6666 demons and finished the \z
				demon oak as well, |PLAYERNAME|.', cid)
				npcHandler.topic[cid] = 2
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm Avar Tar, slayer of monsters, saviour of princesses, and defender of the weak."
	}
)
keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm a professional hero."
	}
)
keywordHandler:addKeyword({'hero'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I think I'm the greatest hero in Tibia, but my humility forbids me to make an issue out of it."
	}
)
keywordHandler:addKeyword({'tibia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I've seen it all and done it all ... at least twice."
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It's 9:45 am right now."
	}
)
keywordHandler:addKeyword({'ferumbras'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I fought him several times, sometimes he killed me, sometimes I killed him. \z
		I'd say we are even right now, but I'm getting better and more powerful each day."
	}
)
keywordHandler:addKeyword({'triangle of terror'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "They might be a nice way for weaker heroes to prove their skill."
	}
)
keywordHandler:addKeyword({'orshabaal'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Don't be afraid! As long as I stand guard here, the beast won't reach the town!"
	}
)
keywordHandler:addKeyword({'excalibug'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am sure it's hidden in a vault of the Nightmare Knights beneath the Plains of Havoc. \z
		I'm planning an expedition to go there and to rout out the Ruthless Seven, but I have to save the world first."
	}
)
keywordHandler:addKeyword({'ruthless seven'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Oh come on. Let the noobs take care of them. Call me if they are fourteen or so."
	}
)
keywordHandler:addKeyword({'quest'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm on a quest for the Thaian king ... as usual."
	}
)
keywordHandler:addKeyword({'king'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm on a quest for the Thaian king ... as usual."
	}
)
keywordHandler:addKeyword({'sword of fury'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Ah, my trusty old sword. I left it on Rookgaard years ago when I left for the main continent."
	}
)
keywordHandler:addKeyword({'thais'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "If I had time, I would restore peace in this once proud city, but there's too much to do \z
		before I can start that quest."
	}
)
keywordHandler:addKeyword({'carlin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I saved the women there once or twice."
	}
)
keywordHandler:addKeyword({'magic'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I had to master the magic of all 4 vocations for one of the quests."
	}
)
keywordHandler:addKeyword({'news'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "There is a great evil lurking beneath this isle ... and beneath the Plains of Havoc, \z
		and in the ancient necropolis, and beneath the Ghostlands ... well basically everywhere."
	}
)
keywordHandler:addKeyword({'rookgaard'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Rookgaard is full of memories of my first heroic accomplishments ...",
            "I heard that after all these years, the minotaur mage there refuses to leave his room as he is \z
			still afraid of me."
    }}
)
keywordHandler:addKeyword({'demons'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Demons know and fear my name! It's not always easy to be a hero, you know?"
	}
)
keywordHandler:addKeyword({'bonelord language'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "29639 46781! 9063376290 3222011 677 80322429 67538 14805394, 6880326 677 63378129 \z
		337011 72683 149630 4378! 453 639 578300 986372 2953639! I know it’s rather short, but still, \z
		this poem I like best."
	}
)

npcHandler:setMessage(MESSAGE_GREET, 'Greetings, traveller |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'See you later, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'See you later, |PLAYERNAME|.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
