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

    if msgcontains(msg, 'gift') then
        npcHandler:say('I grant you the Ranger Outfit! Wear it with pride as the true explorer you are.', cid)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addAchievement('Waypoint Explorer')
        player:addOutfit(684)
        player:addOutfitAddon(684, 1)
        player:addOutfitAddon(684, 2)
    end
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Waypoint Island, |PLAYERNAME|. You've done well in discovering all of my waypoints! Because of your diligence, I would like to give you a {gift} to commemorate the occasion.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Come back soon, traveller.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon, traveller.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
