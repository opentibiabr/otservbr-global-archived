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
	{text = 'Talk to me if you want to help protecting the village.'},
	{text = 'Rookgaard needs your help more than ever.'}
}
npcHandler:addModule(VoiceModule:new(voices))

local function greetCallback(cid)
	local player = Player(cid)
	-- Reject start missions
	if player:getStorageValue(Storage.TheRookieGuard.Mission02) == -1 and player:getLevel() > 5 then
		npcHandler:say("Welcome, adventurer |PLAYERNAME|. Thank you for offering your help - but you are already too experienced to start this quest. Just go on hunting monsters, you'll be better off that way.", cid)
		return false
	-- Not started mission 2
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission02) == -1 then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome, adventurer |PLAYERNAME|. These are dire times for Rookgaard... have you come to help in our {mission}?")
	-- Not finished mission 2
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission02) >= 1 and player:getStorageValue(Storage.TheRookieGuard.Mission02) <= 3 then
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. Your task is still not done - do you remember everything you need to do?")
	-- Finishing mission 2
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission02) == 4 then
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. I've heard a loud rumbling from the roof - I hope the stones didn't fall on your toes. Have you loaded at least two catapults?")
	-- Finished mission 2 but not started mission 3
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission02) == 5 and player:getStorageValue(Storage.TheRookieGuard.Mission03) == -1 then
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. Actually I have some more equipment I could give to you, but first I want to see how you fight. You have fought before, haven't you?")
	-- Not finished or finishing mission 3
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission03) == 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome back, |PLAYERNAME|. Are you done with the 5 rats I asked you to kill?")
	-- Started but not finished mission 4
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission04) >= 1 and player:getStorageValue(Storage.TheRookieGuard.Mission04) <= 4 then
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. Right now I don't need your help. I heard that Lily south-west of here requires assistance though.")
	-- Finishing mission 4
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission04) == 5 then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome back, |PLAYERNAME|. Glad to see you made it back in one piece. I hope you're not too exhausted, because I could use your {help} again.")
	-- Finished mission 4 but not started mission 5
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission04) == 6 and player:getStorageValue(Storage.TheRookieGuard.Mission05) == -1 then
		npcHandler:setMessage(MESSAGE_GREET, "Oh, hello |PLAYERNAME|! Have you made up your mind about sneaking into the tarantula's lair and retrieving a sample of her web? Are you up for it?")
	else
		npcHandler:say("|PLAYERNAME|, the only thing left for you to do here is to talk to the oracle above the academy and leave for the Isle of Destiny. Thanks again for your great work and good luck on your journeys!", cid)
		return false
	end
	return true
end

-- Mission 2: Start
local mission2 = keywordHandler:addKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"Have you ever heard of Kraknaknork? He's a powerful orc shaman who has recently risen from the orc tribe and started to terrorise Rookgaard. Maybe we can kill several birds with one stone. Listen: ...",
		"What would you say about you defeat Kraknaknork, save Rookgaard and earn some experience and better equipment on the way? Sounds good?"
	}
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission02) == -1 end
)
keywordHandler:addAliasKeyword({"mission"})

-- Mission 2: Reject
keywordHandler:addKeyword({"no"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = "Well, if you change your mind you know where to find me. Remember that if you help Rookgaard, Rookgaard might be able to help you.",
	ungreet = true
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission02) == -1 end
)

local mission02Reject = KeywordNode:new({"no"}, StdModule.say, {npcHandler = npcHandler, text = 'OK, dude!'})

-- Mission 2: Accept
local mission2Accept = mission2:addChildKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"Great. We best start by reinforcing our defences. There are four large catapults positioned on roofs high over the village. If you want to fight, you have to build up some muscles. ...",
		"Go into the barn just a few steps to the north-west of here and down the ladder into the cellar. You'll find a huge stone pile down there. Use it to pick up one of the big stones. ...",
		"Carry one stone to at least two of the four catapults located on Norma's roof to the north, this academy and Obi's roof to the south. ...",
		"Use the stone on the catapult to load it. You can load each catapult only once, so try spotting two different catapults. Have you understood all of that?"
	}
},
nil,
function(player)
	player:setStorageValue(Storage.TheRookieGuard.Questline, 1)
	player:setStorageValue(Storage.TheRookieGuard.Mission02, 1)
	player:addMapMark({x = 32082, y = 32182, z = 7}, MAPMARK_FLAG, "Barn")
	player:addMapMark({x = 32097, y = 32181, z = 7}, MAPMARK_BAG, "Norma's Bar")
	player:addMapMark({x = 32105, y = 32203, z = 7}, MAPMARK_BAG, "Obi's Shop")
end
)

mission2Accept:addChildKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = "Awesome! Off to work with you. I've marked the barn on your map.",
	ungreet = true
})

mission2Accept:addChildKeyword({"no"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"Let me explain again then. We best start by reinforcing our defences. There are four large catapults positioned on roofs high over the village. If you want to fight, you have to build up some muscles. ...",
		"Go into the barn just a few steps to the north-west of here and down the ladder into the cellar. You'll find a huge stone pile down there. Use it to pick up one of the big stones. ...",
		"Carry one stone to at least two of the four catapults located on Norma's roof to the north, this academy and Obi's roof to the south. ...",
		"Use the stone on the catapult to load it. You can load each catapult only once, so try spotting two different catapults. Have you understood all of that?"
	},
	moveup = 1
})

-- Mission 2: Finish - Confirm
keywordHandler:addKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"Well done! The villagers are much safer now that the catapults are ready to fire. You also look like you've built some muscles. ...",
		"Great - so the piece of equipment I just gave you will not go to waste. Take this studded shield and put it to good use! ...",
		"Actually I have some more equipment I could give to you, but first I want to see how you fight. You have fought before, haven't you?"
	},
	reset = true
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission02) == 4 end,
function(player)
	player:setStorageValue(Storage.TheRookieGuard.Mission02, 5)
	player:addItemEx(Game.createItem(2526, 1), true, CONST_SLOT_WHEREEVER)
end
)

-- Mission 2: Finish - Decline
keywordHandler:addKeyword({"no"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = "Oh, but you have... you should say {yes}!",
	moveup = 1
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission02) == 4 end
)

-- Mission 3: Start
local mission3 = keywordHandler:addKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"Ah, that came with confidence. Suited monsters to do some basic fighting would be rats - they actually fight back, but they don't hit that hard. Just make sure you wear your new studded shield and a sword. ...",
		"You can find rats in the sewers. In case you might think so, this task is not a lame excuse to help us with some rat infestation, we got the rat population quite under control. ...",
		"So, back to the topic - please kill 5 rats and then come back to me. Shouldn't be too hard, should it? Just pay attention they don't trap you in a narrow passage and take on one at a time. ...",
		"If you run low on health, go on full defence - click the little shield icon - and leave the dungeon. Nothing corwardish about running, because dying hurts. Are you ready to go?"
	}
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission02) == 5 and player:getStorageValue(Storage.TheRookieGuard.Mission03) == -1 end
)

-- Mission 3: Accept
mission3:addChildKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"Nice. I've marked two rat dungeons on your map. Kill 5 rats and return to me. Smart adventurers try to face one creature at a time - use the environment to your advantage. ...",
		"If you should happen to forget how many you have killed in the meantime, simply check your questlog. ...",
		"Once you reach level 8, you should leave this island. While it is possible to reach higher levels, this quest is meant to be played up to level 8. ...",
		"No need to be scared, just saying you don't need to plan large hunting sessions while helping me with this mission or kill more rats than I've asked you to. So, good hunting!"
	}
},
nil,
function(player)
	player:setStorageValue(Storage.TheRookieGuard.Mission03, 1)
	player:setStorageValue(Storage.TheRookieGuard.RatKills, 0)
	player:addMapMark({x = 32097, y = 32205, z = 7}, MAPMARK_GREENSOUTH, "Rat Dungeon")
	player:addMapMark({x = 32041, y = 32228, z = 7}, MAPMARK_GREENSOUTH, "Rat Dungeon")
	-- TODO: Manually ungreet (StdModule.say ungreet = true remove the message when is used doNPCTalkALot due events are cancelled)
end
)

-- Mission 3: Decline
mission3:addChildKeyword({"no"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"I'll explain it again then. Suited monsters to do some basic fighting would be rats - they actually fight back, but they don't hit that hard. Just make sure you wear your new studded shield and a sword. ...",
		"You can find rats in the sewers. In case you might think so, this task is not a lame excuse to help us with some rat infestation, we got the rat population quite under control. ...",
		"So, back to the topic - please kill 5 rats and then come back to me. Shouldn't be too hard, should it? Just pay attention they don't trap you in a narrow passage and take on one at a time. ...",
		"If you run low on health, go on full defence - click the little shield icon - and leave the dungeon. Nothing corwardish about running, because dying hurts. Are you ready to go?"
	},
	moveup = 1
})

-- Mission 3: Complain not finished
keywordHandler:addKeyword({"yes"}, nil,
{},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission03) == 1 and player:getStorageValue(Storage.TheRookieGuard.RatKills) < 5 end,
function(player)
	local ratKills = player:getStorageValue(Storage.TheRookieGuard.RatKills)
	-- Dynamic reply
	npcHandler:say("You still need to kill " .. (5 - ratKills) .. " more rats. Come back once you've killed enough for some experience and equipment!", player.uid)
end
)

-- Mission 3: Finish - Confirm
keywordHandler:addKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"Good job. Here's your promised reward - a sabre. You can replace your wooden sword with it, if you still have it - the sabre does more damage. ...",
		"If you look at a piece of equipment, you can check its stats. By the way, if you use sword weapons such as sabres or swords, you are training your 'sword fighting skill'. ...",
		"This is quite important if you plan on becoming a melee fighter - the better your sword fighting skill, the higher the damage you do will be. ...",
		"There are also club and axe type weapons - they train different skills, so maybe you should choose one type of weapon you always want to use. It doesn't make that much difference, but swords often have a good balance between offence and defence. ...",
		"Anyway, I think you're well enough equipped now to leave the village of Rookgaard for another small task. Find Lily south-west of here, she will tell you what she needs done."
	}
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission03) == 1 and player:getStorageValue(Storage.TheRookieGuard.RatKills) >= 5 end,
function(player)
	player:setStorageValue(Storage.TheRookieGuard.Mission03, 2)
	player:setStorageValue(Storage.TheRookieGuard.Mission04, 1)
	player:addExperience(30, true)
	player:addItemEx(Game.createItem(2385, 1), true, CONST_SLOT_WHEREEVER)
	-- TODO: Manually ungreet (StdModule.say ungreet = true remove the message when is used doNPCTalkALot due events are cancelled)
end
)

-- Mission 3: Finish - Decline
keywordHandler:addKeyword({"no"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = "Actually I think you have killed enough. You should reply with {yes}!",
	moveup = 1
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission03) == 1 and player:getStorageValue(Storage.TheRookieGuard.RatKills) >= 5 end
)

-- Mission 4: Finish - Confirm
keywordHandler:addKeyword({"help"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"That's the spirit Rookgaard needs. Listen, while you were gone I thought about a way to weaken and fight Kraknaknork - that orc shaman who terrorises Rookgaard. ...",
		"Even if we could make our way into his stronghold past all his minions, we cannot hope to defeat him as long as he is powerful enough to summon demons and access other dimensions. ...",
		"While studying the fauna of Rookgaard I came across an interesting specimen that might help us in our battle. Deep in the underground tunnels, there is a spider queen - a tarantula, who is bigger and deadlier than all the other spiders here. ...",
		"Her web is enormous - and causes a strong paralysis. If you could get a small sample of her web, I might be able to craft a trap that we can use to paralyse the orcs so you can get past their defences. ...",
		"Do you dare sneak into the tarantula's lair and retrieve a sample of her web?"
	}
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission04) == 5 end,
function(player)
	player:setStorageValue(Storage.TheRookieGuard.Mission04, 6)
end
)

-- Mission 4: Finish - No Confirm
keywordHandler:addKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = "What do you mean? If you're ready to {help} me again, just say so."
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission04) == 5 end
)
keywordHandler:addAliasKeyword({"no"})

-- Mission 5: Accept
keywordHandler:addKeyword({"yes"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = {
		"That's very courageous. I'll mark the spider lair on your map. If you leave the village to the north again like before, but walk north-west and cross the bridge, you will find it. ...",
		"Listen, I have some more important information regarding your task. It will likely be dark in the cave, so maybe you'll want to buy a torch or two from Al Dee's shop to the left of the barn. ...",
		"The spider queen is far too strong for you to fight and if she catches you, you might end up in her stomach. The good news is that she is almost blind and relies on her sense of smelling to find her prey. ...",
		"Deep in her lair you'll find some blue greasy stones. If you use them, you'll rub some of the smelly grease on your body. From that moment on you'll be invisible to her, but only for a short time. ...",
		"If you run into her lair, you should have enough time to retrieve a sample of her web before she catches you. Just USE one of her intact cobwebs in her lair. Good luck!"
	}
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission04) == 6 and player:getStorageValue(Storage.TheRookieGuard.Mission05) == -1 end,
function(player)
	player:setStorageValue(Storage.TheRookieGuard.Mission05, 1)
	--player:addMapMark({x = 32082, y = 32182, z = 7}, MAPMARK_FLAG, "Barn")
end
)

-- Mission 5: Decline
keywordHandler:addKeyword({"no"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = "Well, if you change your mind, let me know.",
	ungreet = true
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission04) == 6 and player:getStorageValue(Storage.TheRookieGuard.Mission05) == -1 end
)


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")
npcHandler:addModule(FocusModule:new())
