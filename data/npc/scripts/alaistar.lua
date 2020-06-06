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
	{ text = "Interesting creature product. It could boost the new formula I have in mind..." },
	{ text = "Now where are those notes on the new potion?" },
	{ text = "Judging by Baribas' remark on the quality of his latest sample, I wonder if he did not \z
    miscalculate the coefficient of the formula..." },
	{ text = "<sigh> So much to do, so little time..." },
	{ text = "Now where's that new specimen I collected?" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"great health potion"}, 7591, 225, 1)
shopModule:addBuyableItem({"great mana potion"}, 7590, 144, 1)
shopModule:addBuyableItem({"great spirit potion"}, 8472, 228, 1)
shopModule:addBuyableItem({"health potion"}, 7618, 50, 1)
shopModule:addBuyableItem({"mana potion"}, 7620, 56, 1)
shopModule:addBuyableItem({"strong health potion"}, 7588, 115, 1)
shopModule:addBuyableItem({"strong mana potion"}, 7589, 93, 1)
shopModule:addBuyableItem({"supreme health potion"}, 26031, 625, 1)
shopModule:addBuyableItem({"ultimate health potion"}, 8473, 379, 1)
shopModule:addBuyableItem({"ultimate mana potion"}, 26029, 438, 1)
shopModule:addBuyableItem({"ultimate spirit potion"}, 26030, 438, 1)

shopModule:addSellableItem({"cowbell"}, 23575, 210, 1)
shopModule:addSellableItem({"empty potion flask"}, 7634, 5, 1)
shopModule:addSellableItem({"empty potion flask"}, 7635, 5, 1)
shopModule:addSellableItem({"empty potion flask"}, 7636, 5, 1)
shopModule:addSellableItem({"execowtioner mask"}, 23572, 240, 1)
shopModule:addSellableItem({"giant pacifier"}, 23570, 170, 1)
shopModule:addSellableItem({"glob of glooth"}, 23553, 125, 1)
shopModule:addSellableItem({"glooth injection tube"}, 23474, 350, 1)
shopModule:addSellableItem({"metal jaw"}, 23564, 260, 1)
shopModule:addSellableItem({"metal toe"}, 23569, 430, 1)
shopModule:addSellableItem({"mooh'tah shell"}, 23573, 110, 1)
shopModule:addSellableItem({"moohtant horn"}, 23571, 140, 1)
shopModule:addSellableItem({"necromantic rust"}, 23567, 390, 1)
shopModule:addSellableItem({"poisoned fang"}, 23566, 130, 1)
shopModule:addSellableItem({"seacrest hair"}, 24170, 260, 1)
shopModule:addSellableItem({"seacrest pearl"}, 24116, 400, 1)
shopModule:addSellableItem({"seacrest scale"}, 24169, 150, 1)
shopModule:addSellableItem({"slime heart"}, 23565, 160, 1)
shopModule:addSellableItem({"slimy leaf tentacle"}, 23568, 320, 1)
shopModule:addSellableItem({"vial"}, 2006, 5, 1)

npcHandler:setMessage(MESSAGE_GREET, "Hi there and welcome to my little {magic} shop.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "However.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. Or do you want to look only at \z
{potions}, {wands} or {runes}?")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
