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
	{text = 'Selling all sorts of magic equipment. Come and have a look'}
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"animate dead rune"}, 2316, 375, 1)
shopModule:addBuyableItem({"blank rune"}, 2260, 10, 1)
shopModule:addBuyableItem({"crystal ball"}, 2192, 530, 1)
shopModule:addBuyableItem({"desintegrate rune"}, 2310, 26, 1)
shopModule:addBuyableItem({"energy bomb rune"}, 2262, 203, 1)
shopModule:addBuyableItem({"exercise rod"}, 32388, 262500, 500)
shopModule:addBuyableItem({"exercise wand"}, 32389, 262500, 500)
shopModule:addBuyableItem({"fireball rune"}, 2302, 30, 1)
shopModule:addBuyableItem({"hailstorm rod"}, 2183, 15000, 1)
shopModule:addBuyableItem({"holy missile rune"}, 2295, 16, 1)
shopModule:addBuyableItem({"icicle rune"}, 2271, 30, 1)
shopModule:addBuyableItem({"life ring"}, 2168, 900, 1)
shopModule:addBuyableItem({"magic wall rune"}, 2293, 116, 1)
shopModule:addBuyableItem({"moonlight rod"}, 2186, 1000, 1)
shopModule:addBuyableItem({"necrotic rod"}, 2185, 5000, 1)
shopModule:addBuyableItem({"northwind rod"}, 8911, 7500, 1)
shopModule:addBuyableItem({"paralyze rune"}, 2278, 700, 1)
shopModule:addBuyableItem({"poison bomb rune"}, 32389, 262500, 1)
shopModule:addBuyableItem({"snakebite rod"}, 2182, 500, 1)
shopModule:addBuyableItem({"soulfire rune"}, 2308, 46, 1)
shopModule:addBuyableItem({"springsprout rod"}, 8912, 18000, 1)
shopModule:addBuyableItem({"stone shower rune"}, 2288, 37, 1)
shopModule:addBuyableItem({"terra rod"}, 2181, 10000, 1)
shopModule:addBuyableItem({"thunderstorm rune"}, 2315, 47, 1)
shopModule:addBuyableItem({"underworld rod"}, 8910, 22000, 1)
shopModule:addBuyableItem({"wand of cosmic energy"}, 2189, 10000, 1)
shopModule:addBuyableItem({"wand of decay"}, 2188, 5000, 1)
shopModule:addBuyableItem({"wand of draconia"}, 8921, 7500, 1)
shopModule:addBuyableItem({"wand of dragonbreath"}, 2191, 1000, 1)
shopModule:addBuyableItem({"wand of inferno"}, 2187, 15000, 1)
shopModule:addBuyableItem({"wand of starstorm"}, 8920, 18000, 1)
shopModule:addBuyableItem({"wand of voodoo"}, 8922, 22000, 1)
shopModule:addBuyableItem({"wand of vortex"}, 2190, 500, 1)
shopModule:addBuyableItem({"wild growth rune"}, 2269, 160, 1)

shopModule:addSellableItem({"crystal ball"}, 2192, 190, 1)
shopModule:addSellableItem({"life crystal"}, 2177, 85, 1)
shopModule:addSellableItem({"mind stone"}, 2178, 170, 1)
shopModule:addSellableItem({"spellbook of enlightenment"}, 8900, 4000, 1)
shopModule:addSellableItem({"spellbook of lost souls"}, 8903, 19000, 1)
shopModule:addSellableItem({"spellbook of mind control"}, 8902, 13000, 1)
shopModule:addSellableItem({"spellbook of warding"}, 8901, 8000, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local items = {[1] = 2190, [2] = 2182}
	local itemId = items[player:getVocation():getBase():getId()]
	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		if player:isMage() then
			if player:getStorageValue(Storage.firstMageWeapon) == -1 then
				npcHandler:say('So you ask me for a {' .. ItemType(itemId):getName() .. '} to begin your \z
				adventure?', cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say('What? I have already gave you one {' .. ItemType(itemId):getName() .. '}!', cid)
			end
		else
			npcHandler:say('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(itemId, 1)
			npcHandler:say('Here you are young adept, take care yourself.', cid)
			player:setStorageValue(Storage.firstMageWeapon, 1)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler:say('Ok then.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'magic'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I'm selling runes, life rings, wands, rods and crystal balls. I also buy powerful spellbooks. \z
		If you like to see my offers, ask me for a {trade}."
	}
)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hi there |PLAYERNAME|, and welcome to the {magic} store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. \z
Or do you want to look only at {runes} or {wands}?")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
