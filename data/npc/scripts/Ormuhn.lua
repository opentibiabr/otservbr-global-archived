local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addSpellKeyword({'find', 'person'}, {npcHandler = npcHandler, spellName = 'Find Person', price = 80, level = 8, vocation = 4})
keywordHandler:addSpellKeyword({'great', 'light'}, {npcHandler = npcHandler, spellName = 'Great Light', price = 500, level = 13, vocation = 4})
keywordHandler:addSpellKeyword({'light'}, {npcHandler = npcHandler, spellName = 'Light', price = 0, level = 8, vocation = 4})
keywordHandler:addSpellKeyword({'magic', 'rope'}, {npcHandler = npcHandler, spellName = 'Magic Rope', price = 200, level = 9, vocation = 4})
keywordHandler:addSpellKeyword({'cure', 'poison'}, {npcHandler = npcHandler, spellName = 'Cure Poison', price = 150, level = 10, vocation = 4})
keywordHandler:addSpellKeyword({'intense', 'wound', 'cleansing'}, {npcHandler = npcHandler, spellName = 'Intense Wound Cleansing', price = 6000, level = 80, vocation = 4})
keywordHandler:addSpellKeyword({'wound', 'cleansing'}, {npcHandler = npcHandler, spellName = 'Wound Cleansing', price = 0, level = 8, vocation = 4})
keywordHandler:addSpellKeyword({'levitate'}, {npcHandler = npcHandler, spellName = 'Levitate', price = 500, level = 12, vocation = 4})
keywordHandler:addSpellKeyword({'haste'}, {npcHandler = npcHandler, spellName = 'Haste', price = 600, level = 14, vocation = 4})
keywordHandler:addSpellKeyword({'brutal', 'strike'}, {npcHandler = npcHandler, spellName = 'Brutal Strike', price = 1000, level = 16, vocation = 4})
keywordHandler:addSpellKeyword({'charge'}, {npcHandler = npcHandler, spellName = 'Charge', price = 1300, level = 25, vocation = 4})
keywordHandler:addSpellKeyword({'whirlwind', 'throw'}, {npcHandler = npcHandler, spellName = 'Whirlwind Throw', price = 1500, level = 28, vocation = 4})
keywordHandler:addSpellKeyword({'groundshaker'}, {npcHandler = npcHandler, spellName = 'Groundshaker', price = 1500, level = 33, vocation = 4})
keywordHandler:addSpellKeyword({'fierce', 'berserk'}, {npcHandler = npcHandler, spellName = 'Fierce Berserk', price = 7500, level = 90, vocation = 4})
keywordHandler:addSpellKeyword({'berserk'}, {npcHandler = npcHandler, spellName = 'Berserk', price = 2500, level = 35, vocation = 4})
keywordHandler:addSpellKeyword({'inflict', 'wound'}, {npcHandler = npcHandler, spellName = 'Inflict Wound', price = 2500, level = 40, vocation = 4})
keywordHandler:addSpellKeyword({'cure', 'bleeding'}, {npcHandler = npcHandler, spellName = 'Cure Bleeding', price = 2500, level = 45, vocation = 4})
keywordHandler:addSpellKeyword({'intense', 'recovery'}, {npcHandler = npcHandler, spellName = 'Intense Recovery', price = 10000, level = 100, vocation = 4})
keywordHandler:addSpellKeyword({'recovery'}, {npcHandler = npcHandler, spellName = 'Recovery', price = 4000, level = 50, vocation = 4})
keywordHandler:addSpellKeyword({'front', 'sweep'}, {npcHandler = npcHandler, spellName = 'Front Sweep', price = 4000, level = 70, vocation = 4})
keywordHandler:addSpellKeyword({'annihilation'}, {npcHandler = npcHandler, spellName = 'Annihilation', price = 20000, level = 110, vocation = 4})

keywordHandler:addKeyword({'healing', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Bruise Bane}', '{Cure Bleeding}', '{Wound Cleansing}', '{Cure Poison}', '{Intense Wound Cleansing}', '{Recovery}' and '{Intense Recovery}'."})
keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = {"In this category I have '{Whirlwind Throw}', '{Groundshaker}', '{Berserk}' and '{Fierce Berserk}' as well as ...", "'{Brutal Strike}', '{Front Sweep}', '{Inflict Wound}' and '{Annihilation}'"}})
keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Light}', '{Find Person}', '{Magic Rope}', '{Levitate}', '{Haste}', '{Charge}' and '{Great Light}'."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {healing spells}, {attack spells} and {support spells}. What kind of spell do you wish to learn? You can also tell me for which level you would like to learn a spell, if you prefer that.'})

npcHandler:addModule(FocusModule:new())
