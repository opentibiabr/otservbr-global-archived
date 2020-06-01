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
	{ text = "I should provide more cookies for the ogres. They're looking at me so hungrily." },
	{ text = "What an interesting speck of land. I have to write down all this in my essay." },
	{ text = "Hm, guess I haven't found all new plants in this secluded part of the world yet." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"flour"}, 2692, 30, 1)
shopModule:addBuyableItem({"hoe"}, 2552, 15, 1)
shopModule:addBuyableItem({"juice squeezer"}, 5865, 100, 1)
shopModule:addBuyableItem({"kitchen knife"}, 2566, 20, 1)
shopModule:addBuyableItem({"rope"}, 2120, 50, 1)
shopModule:addBuyableItem({"shovel"}, 2554, 50, 1)
shopModule:addBuyableItem({"vial"}, 2006, 20, 1)
shopModule:addBuyableItem({"vial of beer"}, 2006, 2, 1, 6)

shopModule:addSellableItem({"black pearl"}, 2144, 280, 1)
shopModule:addSellableItem({"onyx chip"}, 24849, 500, 1)
shopModule:addSellableItem({"opal"}, 24850, 500, 1)
shopModule:addSellableItem({"small ruby"}, 2147, 250, 1)
shopModule:addSellableItem({"small topaz"}, 9970, 200, 1)
shopModule:addSellableItem({"white pearl"}, 2143, 160, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Larek. Some call me Larek the Wayfarer, because of my voyages to many faraway lands."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I like to think of myself as a discoverer and explorer of unknown regions and cultures. At the moment I'm acting as a kind of merchant. It is a convenient way to get Vuzrog's permission to live here for a time without getting eaten."})
keywordHandler:addKeyword({"Vuzrog's"}, StdModule.say, {npcHandler = npcHandler, text = "He's the chieftain of the Bloody Skulls tribe and, to be honest, he is the exemplary ogre: big, strong, always hungry, blunt and not very clever."})
keywordHandler:addKeyword({'chieftain'}, StdModule.say, {npcHandler = npcHandler, text = "The strongest male ogre is a tribe's chieftain. For the Bloody Skulls this is Vuzrog, at least at the moment. But Ghorza seems to expect that a younger ogre will challenge him soon."})
keywordHandler:addKeyword({'Bloody Skulls'}, StdModule.say, {npcHandler = npcHandler, text = "That's the tribe living in this village. They are one of the settled clans, whilst others are still nomadic. In addition, they seem to be the only tribe so far that tolerates humans."})
keywordHandler:addKeyword({'Ghorza'}, StdModule.say, {npcHandler = npcHandler, text = "Ghorza is the tribe's shaman. I have the impression that she is a rather unusual ogress, because she's interested in humans not only in the sense of a tasty snack. She seems to think that we could be useful to her and the tribe."})
keywordHandler:addKeyword({'shaman'}, StdModule.say, {npcHandler = npcHandler, text = "The shaman is very important for an ogre tribe. Often, but not always, the shaman is an elder ogress. She cares for the spiritual welfare of the tribe, appeases the spirits, blesses newborn ogre-children and the like."})
keywordHandler:addKeyword({'benefit'}, StdModule.say, {npcHandler = npcHandler, text = "Ogres value food above all things. They like meat or beer, but as I found out they also adore sweets! They're downright scoffing them. But they don't know how to make cookies or candy. And at this point the humans come in."})
keywordHandler:addKeyword({'Krailos'}, StdModule.say, {npcHandler = npcHandler, text = "Krailos is this vast grassland and steppe you are standing in, and is mainly populated by ogres. The region is located north of Oramond, bordered by high mountains to the south and a wild sea to the east, west and north."})
keywordHandler:addKeyword({'ogres'}, StdModule.say, {npcHandler = npcHandler, text = "The ogres are simple, warlike people, more interested in a fight and good food than in politics. Ogres like conflict; they are impulsive and quick to anger. They prefer to solve conflicts through combat rather than words."})
keywordHandler:addKeyword({'Oramond'}, StdModule.say, {npcHandler = npcHandler, text = "Oramond lies south of here, separated from Krailos by a high mountain chain. It's very different from the ogre lands, but also dangerous. Many minotaurs live there."})
keywordHandler:addKeyword({'secluded'}, StdModule.say, {npcHandler = npcHandler, text = "Krailos is surrounded by many underwater shelves. They make it difficult for ships to reach the coast unscathed. At the rugged shores you may find the one or other shipwreck."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "An honorable death is not the highest purpose in an ogre'€™s life, but rather a fulfilled life, which primarily means enough food and a comfortable hut. Food carries great weight in ogre life and society."})
keywordHandler:addKeyword({'interest'}, StdModule.say, {npcHandler = npcHandler, text = "Ogres value food above all things. They like meat or beer, but as I found out they also adore sweets! They're downright scoffing them. But they don't know how to make cookies or candy. And at this point the humans come in."})
keywordHandler:addKeyword({'society'}, StdModule.say, {npcHandler = npcHandler, text = "The ogres are a tribal people, divided into several different clans. Leader of a tribe is usually the strongest male ogre. The chieftain is supported by an ogre-shaman. If the shaman is female, the two are often, but not necessarily, a couple."})
keywordHandler:addKeyword({'history'}, StdModule.say, {npcHandler = npcHandler, text = "Once a sophisticated, but peaceful grassland empire existed on this peninsula. It was noted for its advanced architecture and philosophy."})
keywordHandler:addKeyword({'goblins'}, StdModule.say, {npcHandler = npcHandler, text = "There are quite a few goblins living here in Krailos. I suppose they originally arrived as stowaways on the ships that now and then burst at Krailos' rocky shores. Most of these goblins are kept as slaves by the ogres."})
keywordHandler:addKeyword({'forbidden'}, StdModule.say, {npcHandler = npcHandler, text = "The humans who lived here so long ago worshipped the suns of our world. Not only the calm and considerate Suon but also his reckless and wild sister Fafnar. As far as I found out, the veneration of these two aspects was in balance for a long time."})
keywordHandler:addKeyword({'Suon'}, StdModule.say, {npcHandler = npcHandler, text = "Suon is one of the two suns of our world, considered as one of the gods, the son of Fardos, by many. Some call him the Life-Bringing Sun and believe that he observes creation with love and blesses us with warmth and growth."})
keywordHandler:addKeyword({'Fafnar'}, StdModule.say, {npcHandler = npcHandler, text = "Fafnar is one of the two suns of our world, considered as one of the gods, the daughter of Fardos, by many. Some call her the Scorching Sun and believe that she observes creation with hate and jealousy."})
keywordHandler:addKeyword({'Fardos'}, StdModule.say, {npcHandler = npcHandler, text = "Fardos is considered the creator, often called the Great Observer. Many people believe that it was his doing that we possess divine souls."})
keywordHandler:addKeyword({'Great Hunger'}, StdModule.say, {npcHandler = npcHandler, text = "Ogres worhip the Great Hunger, a kind of spirit being they believe will eat up the entire world if not fed regularly. Therefore they often perform rites of sacrifice - with food but also with living creatures, to feed this entity."})

npcHandler:setMessage(MESSAGE_GREET, "Greetings!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
