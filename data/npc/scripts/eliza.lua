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

-- SPELLS
keywordHandler:addSpellKeyword({"trainparty"},
	{
		npcHandler = npcHandler,
		spellName = "Train Party",
		price = 4000,
		level = 32,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"protectparty"},
	{
		npcHandler = npcHandler,
		spellName = "Protect Party",
		price = 4000,
		level = 32,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"healparty"},
	{
		npcHandler = npcHandler,
		spellName = "Heal Party",
		price = 4000,
		level = 32,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"enchantparty"},
	{
		npcHandler = npcHandler,
		spellName = "Enchant Party",
		price = 4000,
		level = 32,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)

npcHandler:addModule(FocusModule:new())
