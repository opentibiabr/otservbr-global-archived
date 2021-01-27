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
	elseif player:getStorageValue(Storage.TheRookieGuard.Mission02) == 1 then
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

-- Mission 2: Finish

-- Confirm
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

-- Decline
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

-- Mission 3: Reject
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

-- Mission 3: Finish

-- Confirm
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

-- Decline
keywordHandler:addKeyword({"no"}, StdModule.say,
{
	npcHandler = npcHandler,
	text = "Actually I think you have killed enough. You should reply with {yes}!",
	moveup = 1
},
function(player) return player:getStorageValue(Storage.TheRookieGuard.Mission03) == 1 and player:getStorageValue(Storage.TheRookieGuard.RatKills) >= 5 end
)


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")
npcHandler:addModule(FocusModule:new())
