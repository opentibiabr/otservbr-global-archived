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

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.TheIceIslands.Questline) < 37 then
		npcHandler:say("Uhhhh...", cid)
		return false
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "story") then
		local player = Player(cid)
		if player:getStorageValue(Storage.TheIceIslands.Questline) == 37 then
			npcHandler:say({
				"I was captured and tortured to death by the cultists here. \z
				They worship a being that they call Ghazbaran ...",
				"In his name they have claimed the mines and started to melt the ice to free an army of vile \z
				demons that have been frozen here for ages ...",
				"Their plan is to create a new demon army for their master to conquer the world. Hjaern and the \z
				other shamans must learn about it! Hurry before its too late."
			}, cid)
			player:setStorageValue(Storage.TheIceIslands.Questline, 38)
			player:setStorageValue(Storage.TheIceIslands.Mission10, 2) -- Questlog Formorgar Mines 2: Ghostwhisperer
			player:setStorageValue(Storage.TheIceIslands.Mission11, 1) -- Questlog Formorgar Mines 3: The Secret
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ahhhh! At last someone that can listen to my {story}!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Uhhh....")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Uhhh....")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
