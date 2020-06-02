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
	{ text = "Interesting equinox there. Maybe that was what caused the floods?" },
	{ text = "Teaching spells to the brave sorcerers wandering the lands." },
	{ text = "Ah, the mysteries of the living and the dead." }
}

-- SPELLS FOR SORCERER
keywordHandler:addSpellKeyword({"apprenticesstrike"},
	{
		npcHandler = npcHandler,
		spellName = "Apprentice's Strike",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"lighthealing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"findperson"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magicrope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"curepoison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energystrike"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Strike",
		price = 800,
		level = 12,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"greatlight"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"terrastrike"},
	{
		npcHandler = npcHandler,
		spellName = "Terra Strike",
		price = 800,
		level = 13,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"flamestrike"},
	{
		npcHandler = npcHandler,
		spellName = "Flame Strike",
		price = 800,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magicshield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"icestrike"},
	{
		npcHandler = npcHandler,
		spellName = "Ice Strike",
		price = 800,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"deathstrike"},
	{
		npcHandler = npcHandler,
		spellName = "Death Strike",
		price = 800,
		level = 16,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firewave"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wave",
		price = 850,
		level = 18,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"intensehealing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"stronghaste"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Haste",
		price = 1300,
		level = 20,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energybeam"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Beam",
		price = 1000,
		level = 23,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"creatureillusion"},
	{
		npcHandler = npcHandler,
		spellName = "Creature Illusion",
		price = 1000,
		level = 23,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"summoncreature"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Creature",
		price = 2000,
		level = 25,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ignite"},
	{
		npcHandler = npcHandler,
		spellName = "Ignite",
		price = 1500,
		level = 26,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ultimatelight"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Light",
		price = 1600,
		level = 26,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"greatenergybeam"},
	{
		npcHandler = npcHandler,
		spellName = "Great Energy Beam",
		price = 1800,
		level = 29,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ultimatehealing"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Healing",
		price = 1000,
		level = 30,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"electrify"},
	{
		npcHandler = npcHandler,
		spellName = "Electrify",
		price = 2500,
		level = 34,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"invisible"},
	{
		npcHandler = npcHandler,
		spellName = "Invisible",
		price = 2000,
		level = 35,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energywave"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wave",
		price = 2500,
		level = 38,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"lightning"},
	{
		npcHandler = npcHandler,
		spellName = "Lightning",
		price = 5000,
		level = 55,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"strongflamestrike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Flame Strike",
		price =6000,
		level = 70,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"strongenergystrike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Energy Strike",
		price = 6000,
		level = 70,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"curse"},
	{
		npcHandler = npcHandler,
		spellName = "Curse",
		price = 6000,
		level = 75,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"summonthundergiant"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Thundergiant",
		price = 50000,
		level = 200,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"poisonfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Field Rune",
		price = 300,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firefieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Field Rune",
		price = 500,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"lightmagicmissilerune"},
	{
		npcHandler = npcHandler,
		spellName = "Light Magic Missile Rune",
		price = 500,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"destroyfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energyfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Field Rune",
		price = 700,
		level = 18,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"disintegraterune"},
	{
		npcHandler = npcHandler,
		spellName = "Disintegrate Rune",
		price = 900,
		level = 21,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"stalagmiterune"},
	{
		npcHandler = npcHandler,
		spellName = "stalagmite rune",
		price = 1400,
		level = 24,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"heavymagicmissilerune"},
	{
		npcHandler = npcHandler,
		spellName = "Heavy Magic Missile Rune",
		price = 1500,
		level = 25,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"soulfirerune"},
	{
		npcHandler = npcHandler,
		spellName = "Soulfire Rune",
		price = 1800,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firebombrune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"animatedeadrune"},
	{
		npcHandler = npcHandler,
		spellName = "Animate Dead Rune",
		price = 1200,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"fireballrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fireball Rune",
		price = 1600,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"thunderstormrune"},
	{
		npcHandler = npcHandler,
		spellName = "Thunderstorm Rune",
		price = 1100,
		level = 28,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"poisonwallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Wall Rune",
		price = 1600,
		level = 29,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"greatfireballrune"},
	{
		npcHandler = npcHandler,
		spellName = "Great Fireball Rune",
		price = 1200,
		level = 30,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"explosionrune"},
	{
		npcHandler = npcHandler,
		spellName = "Explosion Rune",
		price = 1800,
		level = 31,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magicwallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Wall Rune",
		price = 2100,
		level = 32,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firewallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wall Rune",
		price = 2000,
		level = 33,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energybombrune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Bomb Rune",
		price = 2300,
		level = 37,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energywallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wall Rune",
		price = 2500,
		level = 41,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"suddendeathrune"},
	{
		npcHandler = npcHandler,
		spellName = "Sudden Death Rune",
		price = 3000,
		level = 45,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)

keywordHandler:addKeyword({"healing spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{lighthealing}', '{curepoison}', '{intensehealing}' and '{ultimatehealing}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{findperson}', '{magicrope}', '{levitate}', '{light}', '{greatlight}', '{haste}', '{magicshield}', \z
		'{stronghaste}', '{creatureillusion}', '{summoncreature}', '{ultimatelight}', '{invisible}', and '{summonthundergiant}'."
		
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{apprenticesstrike}', '{energystrike}', '{terrastrike}', '{flamestrike}', '{icestrike}',\z
		'{deathstrike}', '{firewave}', '{energybeam}', '{ignite}', '{greatenergybeam}', '{electrify}', '{energywave}', \z
		'{energywave}', '{lightning}', '{strongflamestrike}', '{strongenergystrike}' and '{Curse}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poisonfieldrune}', '{firefieldrune}', '{lightmagicmissilerune}', '{destroyfieldrune}', \z
		'{energyfieldrune}', '{disintegraterune}', '{stalagmiterune}', '{heavymagicmissilerune}', '{soulfirerune}', \z
		'{firebombrune}', '{fireballrune}', '{animatedeadrune}', '{thunderstormrune}', '{poisonwallrune}', '{greatfireballrune}', \z
		'{explosionrune}', '{magicwallrune}', '{firewallrune}', '{energybombrune}', '{energywallrune}' and '{suddendeathrune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells}, {attack spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end


	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 10050) == 16) then
			selfSay("Ahhhhhhhh! Find and investigate the hideout, the mission 17", cid)
			setPlayerStorageValue(cid, 10050, 17)

		end

		else
		selfSay("Ahhhhhhhh! ", cid)

	end

	return true
end
npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
