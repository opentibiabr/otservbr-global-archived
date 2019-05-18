 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "sam sent me") or msgcontains(msg, "sam send me") then
		if player:getStorageValue(Storage.SamsOldBackpack) == 1 then
			npcHandler:say({
				"Oh, so its you, he wrote me about? Sadly I have no dwarven armor in stock. But I give you the permission to retrive one from the mines. ...",
				"The problem is, some giant spiders made the tunnels where the storage is their new home. Good luck."
			}, cid)
			player:setStorageValue(Storage.SamsOldBackpack, 2)
		end
	elseif msgcontains(msg, "measurements") then
		if player:getStorageValue(Storage.postman.Mission07) >= 1 then
			npcHandler:say("Hm, well I guess its ok to tell you ... <tells you about Lokurs measurements> ", cid)
			player:setStorageValue(Storage.postman.Mission07, player:getStorageValue(Storage.postman.Mission07) + 1)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
