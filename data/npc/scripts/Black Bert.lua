local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Psst! Over here!'} }
npcHandler:addModule(VoiceModule:new(voices))

local function getTable(player)
	local itemsList = {}
	local buyList = {
		{name = "Almanac of Magic", id = 10942, buy = 600},		-- Almanac of Magic
		{name = "Animal Fetish", id = 10154, buy = 10000},		-- Animal Fetish
		{name = "Baby Rotworm", id = 10943, buy = 600},		-- Baby Rotworm
		{name = "Bale of White Cloth", id = 7500, buy = 6000},		-- Bale of White Cloth
		{name = "Bill", id = 2329, buy = 8000},		-- Bill
		{name = "Blood Crystal", id = 9369, buy = 50000},		-- Blood Crystal
		{name = "Bloodkiss Flower", id = 10159, buy = 10000},		-- Bloodkiss Flower
		{name = "Bundle of Rags", id = 10109, buy = 5000},		-- Bundle of Rags
		{name = "Carrying Device", id = 10615, buy = 1000},		-- Carrying Device
		{name = "Cigar", id = 7499, buy = 2000},		-- Cigar
		{name = "Cookbook", id = 2347, buy = 150},			-- Cookbook
		{name = "Damaged Logbook", id = 14338, buy = 40000},		-- Damaged Logbook
		{name = "Dark Essence", id = 14352, buy = 17000},		-- Dark Essence
		{name = "Deep Crystal", id = 10158, buy = 13000},		-- Deep Crystal
		{name = "Elemental Crystal", id = 10169, buy = 8000},		-- Elemental Crystal
		{name = "Empty Beer Bottle", id = 11397, buy = 600},		-- Empty Beer Bottle
		{name = "Exploding Cookie", id = 8111, buy = 100},			-- Exploding Cookie
		{name = "Exquisite Silk", id = 12501, buy = 4000},		-- Exquisite Silk
		{name = "Exquisite Wood", id = 12503, buy = 4000},		-- Exquisite Wood
		{name = "Faded Last Will", id = 12500, buy = 600},		-- Faded Last Will
		{name = "Family Brooch", id = 4845, buy = 1000},		-- Family Brooch
		{name = "Family Signet Ring", id = 7708, buy = 15000},		-- Family Signet Ring
		{name = "Fan Club Membership Card", id = 10308, buy = 10000},		-- Fan Club Membership Card
		{name = "Filled Carrying Device", id = 10616, buy = 1000},		-- Filled Carrying Device
		{name = "Fishnapped Goldfish", id = 8766, buy = 7000},		-- Fishnapped Goldfish
		{name = "Flask of Crown Polisher", id = 10926, buy = 700},		-- Flask of Crown Polisher
		{name = "Flask of Extra Greasy Oil", id = 11106, buy = 1000},		-- Flask of Extra Greasy Oil
		{name = "Flask of Poison", id = 10760, buy = 1000},		-- Flask of Poison
		{name = "Flexible Dragon Scale", id = 12506, buy = 4000},		-- Flexible Dragon Scale
		{name = "Formula for a Memory Potion", id = 14351, buy = 5000},		-- Formula for a Memory Potion
		{name = "Funeral Urn", id = 4858, buy = 6000},		-- Funeral Urn
		{name = "Ghost Charm", id = 9737, buy = 20000},       -- Ghost Charm
		{name = "Ghost's Tear", id = 9662, buy = 50000},		-- Ghost's Tear
		{name = "Giant Ape's Hair", id = 4843, buy = 24000},		-- Giant Ape's Hair
		{name = "Golem Blueprint", id = 10165, buy = 13500},		-- Golem Blueprint
		{name = "Golem Head", id = 10173, buy = 25000},		-- Golem Head
		{name = "Headache Pill", id = 10454, buy = 350},		-- Headache Pill
		{name = "Letterbag", id = 2330, buy = 8000},		-- Letterbag
		{name = "Lump of Clay", id = 12285, buy = 1000},		-- Lump of Clay
		{name = "Machine Crate", id = 10307, buy = 8500},		-- Machine Crate
		{name = "Magic Crystal", id = 12508, buy = 4000},		-- Magic Crystal
		{name = "Mago Mechanic Core", id = 10167, buy = 13000},		-- Mago Mechanic Core
		{name = "Map to the Unknown", id = 10928, buy = 650},		-- Map to the Unknown
		{name = "Memory Crystal", id = 7281, buy = 500},			-- Memory Crystal
		{name = "Memory Stone", id = 4852, buy = 3000},		-- Memory Stone
		{name = "Mystic Root", id = 12507, buy = 4000},		-- Mystic Root
		{name = "Nautical Map", id = 10225, buy = 5250},		-- Nautical Map
		{name = "Old Iron", id = 12505, buy = 4000},		-- Old Iron
		{name = "Old Power Core", id = 10170, buy = 13000},		-- Old Power Core
		{name = "Plans for a Strange Device", id = 10613, buy = 1000},		-- Plans for a Strange Device
		{name = "Rare Crystal", id = 11104, buy = 1000},		-- Rare Crystal
		{name = "Sacred Earth", id = 12297, buy = 1000},		-- Sacred Earth
		{name = "Shadow Orb", id = 10155, buy = 12500},		-- Shadow Orb
		{name = "Sheet of Tracing Paper", id = 4854, buy = 500},			-- Sheet of Tracing Paper
		{name = "Suspicious Signet Ring", id = 7697, buy = 15000},		-- Suspicious Signet Ring
		{name = "Snake Destroyer", id = 4846, buy = 8000},		-- Snake Destroyer
		{name = "Soul Contract", id = 10945, buy = 666},		-- Soul Contract
		{name = "Special Flask", id = 14323, buy = 5000},		-- Special Flask
		{name = "Spectral Cloth", id = 12502, buy = 4000},		-- Spectral Cloth
		{name = "Spectral Dress", id = 4847, buy = 15000},		-- Spectral Dress
		{name = "Spyreport", id = 2345, buy = 3000},		-- Spyreport
		{name = "Stabilizer", id = 10166, buy = 12500},		-- Stabilizer
		{name = "Strange Powder", id = 15389, buy = 5000},		-- Strange Powder
		{name = "Strong Sinew", id = 12504, buy = 4000},		-- Strong Sinew
		{name = "Tear of Daraman", id = 2346, buy = 16000},		-- Tear of Daraman
		{name = "Technomancer Beard", id = 7699, buy = 5000},		-- Technomancer Beard
		{name = "The Alchemists' Formulas", id = 9733, buy = 8000},		-- The Alchemists' Formulas
		{name = "The Ring of the Count", id = 8752, buy = 10000},		-- The Ring of the Count
		{name = "Toy Mouse", id = 7487, buy = 16000},		-- Toy Mouse
		{name = "Universal Tool", id = 10944, buy = 550},		-- Universal Tool
		{name = "Unworked Sacred Wood", id = 12295, buy = 1000},		-- Unworked Sacred Wood
		{name = "Whisper Moss", id = 4838, buy = 18000},		-- Whisper Moss
		{name = "Worm Queen Tooth", id = 10157, buy = 12500},		-- Worm Queen Tooth
		{name = "Wrinkled Parchment", id = 14336, buy = 4000}		-- Wrinkled Parchment
	}

		for i = 1, #buyList do
			table.insert(itemsList, buyList[i])
		end
	return itemsList
end

local function setNewTradeTable(table)
	local items, item = {}
	for i = 1, #table do
		item = table[i]
		items[item.id] = {itemId = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = 0, realName = item.name}
	end
	return items
end

local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(cid)
	local items = setNewTradeTable(getTable(player))
	if not ignoreCap and player:getFreeCapacity() < ItemType(items[item].itemId):getWeight(amount) then
		return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You don\'t have enough cap.')
	end
	if not doPlayerRemoveMoney(cid, items[item].buyPrice * amount) then
		selfSay("You don't have enough money.", cid)
	else
		player:addItem(items[item].itemId, amount)
		return player:sendTextMessage(MESSAGE_INFO_DESCR, 'Bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
	end
	return true
end

local function onSell(cid, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(cid)
	local items = setNewTradeTable(getTable(player))
	if items[item].sellPrice and player:removeItem(items[item].itemId, amount) then
		player:addMoney(items[item].sellPrice * amount)
		return player:sendTextMessage(MESSAGE_INFO_DESCR, 'Sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
	else
		selfSay("You don't have item to sell.", cid)
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if msgcontains(msg, "trade") then
		local player = Player(cid)
		local items = setNewTradeTable(getTable(player))
		openShopWindow(cid, getTable(player), onBuy, onSell)
		npcHandler:say("Keep in mind you won't find better offers here. Just browse through my wares.", cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'It was a pleasure to help you, |PLAYERNAME|.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
