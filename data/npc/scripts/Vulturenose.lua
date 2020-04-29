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

	if msgcontains(msg, 'enter') then
		if player:getStorageValue(Storage.TheShatteredIsles.RaysMission3) == 1 and player:getStorageValue(Storage.TheShatteredIsles.AccessToYavern) < 0 then
            if player:getItemCount(6096) > 0 and player:getItemCount(6095) > 0 and player:getItemCount(5918) > 0 and player:getItemCount(5462) > 0 then
                npcHandler:say('Hey, I rarely see a dashing pirate like you! Get in, matey!', cid)
                player:setStorageValue(Storage.TheShatteredIsles.AccessToYavern, 1)
            end
		end
    end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())
