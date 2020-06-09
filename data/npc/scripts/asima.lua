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

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({"empty potion flask"}, 7634, 5, 1)
shopModule:addSellableItem({"empty potion flask"}, 7635, 8, 1)
shopModule:addSellableItem({"empty potion flask"}, 7636, 10, 1)
shopModule:addSellableItem({"spellwand"}, 7735, 299, 1)
shopModule:addSellableItem({"vial"}, 2006, 5, 1)

shopModule:addBuyableItem({"avalanche rune"}, 2274, 57, 1)
shopModule:addBuyableItem({"blank rune"}, 2260, 10, 1)
shopModule:addBuyableItem({"chameleon rune"}, 2291, 210, 1)
shopModule:addBuyableItem({"convince creature rune"}, 2290, 80, 1)
shopModule:addBuyableItem({"cure poison rune"}, 2266, 65, 1)
shopModule:addBuyableItem({"destroy field rune"}, 2261, 15, 1)
shopModule:addBuyableItem({"energy field rune"}, 2277, 38, 1)
shopModule:addBuyableItem({"energy wall rune"}, 2279, 85, 1)
shopModule:addBuyableItem({"exercise rod"}, 32388, 262500, 500)
shopModule:addBuyableItem({"exercise wand"}, 32389, 262500, 500)
shopModule:addBuyableItem({"explosion rune"}, 2313, 31, 1)
shopModule:addBuyableItem({"fire bomb rune"}, 2305, 55, 1)
shopModule:addBuyableItem({"fire field rune"}, 2301, 28, 1)
shopModule:addBuyableItem({"fire wall rune"}, 2303, 61, 1)
shopModule:addBuyableItem({"great fireball rune"}, 2304, 57, 1)
shopModule:addBuyableItem({"great health potion"}, 7591, 225, 1)
shopModule:addBuyableItem({"great mana potion"}, 7590, 144, 1)
shopModule:addBuyableItem({"great spirit potion"}, 8472, 228, 1)
shopModule:addBuyableItem({"hailstorm rod"}, 2183, 15000, 1)
shopModule:addBuyableItem({"health potion"}, 7618, 50, 1)
shopModule:addBuyableItem({"heavy magic missile rune"}, 2311, 12, 1)
shopModule:addBuyableItem({"intense healing rune"}, 2265, 95, 1)
shopModule:addBuyableItem({"light magic missile rune"}, 2287, 4, 1)
shopModule:addBuyableItem({"mana potion"}, 7620, 56, 1)
shopModule:addBuyableItem({"moonlight rod"}, 2186, 1000, 1)
shopModule:addBuyableItem({"necrotic rod"}, 2185, 5000, 1)
shopModule:addBuyableItem({"northwind rod"}, 8911, 7500, 1)
shopModule:addBuyableItem({"poison field rune"}, 2285, 21, 1)
shopModule:addBuyableItem({"poison wall rune"}, 2289, 52, 1)
shopModule:addBuyableItem({"snakebite rod"}, 2182, 500, 1)
shopModule:addBuyableItem({"spellbook"}, 2175, 150, 1)
shopModule:addBuyableItem({"springsprout rod"}, 8912, 18000, 1)
shopModule:addBuyableItem({"stalagmite rune"}, 2292, 12, 1)
shopModule:addBuyableItem({"strong health potion"}, 7588, 115, 1)
shopModule:addBuyableItem({"strong mana potion"}, 7589, 93, 1)
shopModule:addBuyableItem({"sudden death rune"}, 2268, 135, 1)
shopModule:addBuyableItem({"supreme health potion"}, 26031, 625, 1)
shopModule:addBuyableItem({"terra rod"}, 2181, 10000, 1)
shopModule:addBuyableItem({"ultimate healing rune"}, 2273, 175, 1)
shopModule:addBuyableItem({"ultimate health potion"}, 8473, 379, 1)
shopModule:addBuyableItem({"ultimate mana potion"}, 26029, 438, 1)
shopModule:addBuyableItem({"ultimate spirit potion"}, 26030, 438, 1)
shopModule:addBuyableItem({"underworld rod"}, 8910, 22000, 1)
shopModule:addBuyableItem({"wand of cosmic energy"}, 2189, 10000, 1)
shopModule:addBuyableItem({"wand of decay"}, 2188, 5000, 1)
shopModule:addBuyableItem({"wand of draconia"}, 8921, 7500, 1)
shopModule:addBuyableItem({"wand of dragonbreath"}, 2191, 1000, 1)
shopModule:addBuyableItem({"wand of inferno"}, 2187, 15000, 1)
shopModule:addBuyableItem({"wand of starstorm"}, 8920, 18000, 1)
shopModule:addBuyableItem({"wand of voodoo"}, 8922, 22000, 1)
shopModule:addBuyableItem({"wand of vortex"}, 2190, 500, 1)

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
				npcHandler:say('So you ask me for a {' .. ItemType(itemId):getName() .. '} \z
				to begin your adventure?', cid)
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

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
