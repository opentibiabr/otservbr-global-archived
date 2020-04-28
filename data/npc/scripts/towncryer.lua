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
	{ text = "Hear me! Hear me! The mage Wyrdin in the Edron academy is looking for brave adventurers to undertake a task!" },
	{ text = "Hear me! Hear me! The postmaster's guild has open spots for aspiring postmen! Contact Kevin Postner at the post office in the plains south of Kazordoon!" },
	{ text = "Hear me! Hear me! The inquisition is looking for daring people to fight evil! Apply at the inquisition headquarters next to the Thaian jail!" },
	{ text = "Hear me! Hear me! Stand and deliver! That's what they shout, robbing banks in main's coastal towns and then hide out. Catch the thieves and make us proud, bring back the gold to please the crowd!" },
	{ text = "Hear me! Hear me! A river is flooding, south of the outlaw base. Explore a new isle, an unknown place. Don't be afraid, but ready your blade." },
	{ text = "Hear me! Hear me! The volcano on Goroma is spitting fire. Creatures are spawning, strong and dire. Lava is heading up the land. Adventurer, be careful or it will be your last stand!" },
	{ text = "Hear me! Hear me! It is Kingsday, people, let us celebrate and sing! Decorate Thais and let the bells ring! Come to the arena to hear the swords cling. Let us rejoice! Hail to the King!" },
	{ text = "Hear me! Hear me! North of the Queen's town, the royal trees are cut down. Will you deal with the suspect or report such kind of disrespect?" },
	{ text = "Hear me! Hear me! Noodles is gone, the King in despair! Find the little rascal, look everywhere. Bring him back to get rewarded for your care!" },
	{ text = "Hear me! Hear me! Ankrahmun's desert is the nomads' land. Find their camp in the golden sand, and a treasure may be close at hand!" },
	{ text = "Hear me! Hear me! What a lucky and beautiful day! Visit Carlin, Ankrahmun, or Liberty Bay. Yasir, the oriental trader might be there. Gather your creature products, for this chance is rare." },
	{ text = "Hear me! Hear me! In Zao Steppe the river runs deep. If you catch a strange fish it is yours to keep." },
	{ text = "Hear me! Hear me! Tiquanda's elephants are terrified, the Ape God's footsteps are a scary sight. So hunt for theirs tusks while they are filled with fright!" },
	{ text = "Hear me! Hear me! Mammoths silently watch as the snow melts away. It reveals special flowers which are not meant to stay. Grow their seeds to brighten up your day!" },
	{ text = "Hear me! Hear me! The witch Wyda seems to be bored. Pay her a visit but sharpen your sword. She might come up with a terrible surprise, are you brave enough to believe your eyes?" }
}

npcHandler:addModule(VoiceModule:new(voices))
