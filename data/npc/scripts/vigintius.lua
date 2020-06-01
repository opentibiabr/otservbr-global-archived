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
	{ text = "Mysterious inscription underneath Thais discovered! Member of Explorer Society still missing!"},
	{ text = "Wanna dig for some treasures? Grab your shovel or buy one here!" },
	{ text = "Come here, buy some tasty food and drinks!" },
	{ text = "Enjoy the festivities here on Vigintia Island!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 3, 1)
shopModule:addBuyableItem({"mango"}, 5097, 8, 1)
shopModule:addBuyableItem({"party cake"}, 6280, 50, 1)
shopModule:addBuyableItem({"pineapple"}, 12415, 12, 1)
shopModule:addBuyableItem({"shovel"}, 8722, 10, 1)

keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "You've been around a while, sometimes even in disguise - not that you could fool me <wink> <wink>. But imagine, there are still places to be discovered! Do you remember that one place, you never figured out how to enter?"})
keywordHandler:addKeyword({'disguise'}, StdModule.say, {npcHandler = npcHandler, text = "C'mon man. We all get curious about other vocations now and then. Nothing to be ashamed of! Thing is, everything is about fun in the end, isn't it?"})
keywordHandler:addKeyword({'fun'}, StdModule.say, {npcHandler = npcHandler, text = "Yeah, man. Fun is what this is all about! Speaking of fun, sorry I tested that voodoo doll of yours lately. I heard it made you dizzy as a dwarf after a family reunion! I never thought it would actually work"})
keywordHandler:addKeyword({'sorry'}, StdModule.say, {npcHandler = npcHandler, text = "Do you remember that thing that you could have sworn that you'd put it in your depot, but then it was gone? - Well I ate it! Sorry man, I was so drunk."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, text = "The battle against the dragons! I won, man! And the loot was quite decent! Of course I almost died because of the wine prank, but hey, we all almost die now and then, don't we?"})
keywordHandler:addKeyword({'almost'}, StdModule.say, {npcHandler = npcHandler, text = "Do you remember that time you almost died? Or the other time? Or the other? Hm, thinking about it, you 'almost die' an awful lot. Take better care, man! Would hate to loot your corpse one day."})
keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, text = "Boy, you don't know, but you had some really baaaad luck with your loot, y'know? I've peeked into the tables and I've seen you were soooo close to the loot jackpot at least three times. That's what I call bad luck."})
keywordHandler:addKeyword({'ignorance'}, StdModule.say, {npcHandler = npcHandler, text = "You still remember those times when you were a rookie, don't ya? Well I do and you were one of the rookiest rookies I've ever seen - and I've seen my share, man."})
keywordHandler:addKeyword({'worse'}, StdModule.say, {npcHandler = npcHandler, text = "Yeah, like that one guy that was getting on your nerves in that dungeon. Some people can really be a pain. Can't remember how things turned out back then but I'm pretty sure you remember it quite well <wink>! Ah all those memories."})
keywordHandler:addKeyword({'memories'}, StdModule.say, {npcHandler = npcHandler, text = "There are so many of them! Like that crazy guy in this one city, wasn't it - Thais? I've definitely seen my share of crazy stuff but that guy was as nuts as a coconut."})
keywordHandler:addKeyword({'entertaining'}, StdModule.say, {npcHandler = npcHandler, text = "Yeah, just remember all the hunts, the cool people you've met and that guy you befriended? Of course you do, man! That's what this is all about after all!"})
keywordHandler:addKeyword({'Explorer'}, StdModule.say, {npcHandler = npcHandler, text = "I heard that a member of the Explorer Society was in fact searching for the First Dragon. What a foolish endeavour - please excuse this comment. A romantic idea and a brave venture but seriously: the First Dragon. It is just a myth!"})
keywordHandler:addKeyword({'First Dragon'}, StdModule.say, {npcHandler = npcHandler, text = "The dragon was ancient beyond compare. Eventually even he had to succumb to old age and flew to the dragon cemetery to die there. Or so it is told."})
keywordHandler:addKeyword({'cave'}, StdModule.say, {npcHandler = npcHandler, text = "I don't know exactly where it is. Someone told me you have to pass some tunnels full of orcs, somewhere underneath the king's castle. But that might be just gossip."})
keywordHandler:addKeyword({'inscription'}, StdModule.say, {npcHandler = npcHandler, text = "I heard that a member of the Explorer Society was in fact searching for the First Dragon. What a foolish endeavour - please excuse this comment. A romantic idea and a brave venture but seriously: the First Dragon. It is just a myth!"})
keywordHandler:addKeyword({'can knockdown'}, StdModule.say, {npcHandler = npcHandler, text = "Interested in a little game of action? I prepared a bunch of cans just over there - took me a while to build this architectural masterpiece but the more important question is: what does it take you to tear them down? So?"})

npcHandler:setMessage(MESSAGE_GREET, "Hi there, |PLAYERNAME|. It's always a joy to follow your newest heroic deeds in Tibia. Oh, and did you hear about the missing member of the Explorer Society? There are rumours about a mysterious inscription underneath Thais.")
npcHandler:setMessage(MESSAGE_FAREWELL, "You're already leaving? Well, enjoy the party then!")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
