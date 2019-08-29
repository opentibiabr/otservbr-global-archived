local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                        npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                npcHandler:onCreatureDisappear(cid)                        end
function onCreatureSay(cid, type, msg)                npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                npcHandler:onThink()                                        end

local playerTopic = {}
local function greetCallback(cid)

        local player = Player(cid)

        npcHandler:say({"Suon's and Bastesh's blessing, dear guest!"}, cid)
        npcHandler:addFocus(cid)
        return true
end
        
local function creatureSayCallback(cid, type, msg)
        if not npcHandler:isFocused(cid) then
                return false
        end

        npcHandler.topic[cid] = playerTopic[cid]
        local player = Player(cid)
        
if player:getStorageValue(Storage.KillmareshQuest.Fafnar.Invetigate) < 1 then
        if msgcontains(msg, "mission") and player:getStorageValue(Storage.KillmareshQuest.Fafnar.Invetigate) < 1 then
                        npcHandler:say({"I'm willing to admit that I need help. And the help of someone who is not from {Issavi} at that. But the task could be dangerous and you would become embroiled in the politics and court intrigues of {Kilmaresh}. Will you help me anyhow?"}, cid)
                        npcHandler.topic[cid] = 2
                        playerTopic[cid] = 2
        elseif msgcontains(msg, "yes") and player:getStorageValue(Storage.KillmareshQuest.Fafnar.Invetigate) < 1 and npcHandler.topic[cid] == 2 then
                        npcHandler:say({"You are a noble soul! So listen: for many decades, over a century actually, the city of Rathleton had an Ambassador here in {Issavi}. ...",
										"{Kilmaresh} and {Oramond} maintain important commercial relations, and for this reason Rathleton has an envoy here. In the past, the relations were good but now ...",
										"I hate to admit it but I heavily suspect that the current {Ambassador} is a traitor and consorts with the forbidden cult of {Fafnar}. I have several hints and {Kallimae} saw it in one of her visions. ...",
										"But the vision of a Kilmareshian seer is no proof they will ever accept in Rathleton. And without proof we can't banish the {Ambassador}, this would cause major diplomatic fallout or even a war. I can't risk that. ...",
										"I need unequivocal evidence that the {Ambassador} conspires with the Fafnar cultists. Please go to his residence in the eastern part of the city and search for letters, journals ... anything that could prove him guilty."}, cid)
                        npcHandler.topic[cid] = 3
                        playerTopic[cid] = 3
                        player:setStorageValue(Storage.KillmareshQuest.Fafnar.Invetigate, 1)
                end

        elseif msgcontains(msg, "mission") and player:getStorageValue(Storage.KillmareshQuest.Fafnar.Invetigate) == 2 then
                        npcHandler:say({"It seems that he destroyed every visible evidence of his treason. That's very unfortunate and I see only one remaining possibility: You need to see the {Ambassador}'s memories. ...",
										"But there is only one way to achieve this: You have to find a Ring of {Secret Thoughts}. Legend has it that a monstrous being called {Urmahlullu} has such a ring. If the myths are true you can find this creature in a subterranean tomb south of Issavi."}, cid)
                        player:setStorageValue(Storage.KillmareshQuest.Fafnar.Invetigate, 3)
                        npcHandler.topic[cid] = 1
                        playerTopic[cid] = 1

        return true
end



npcHandler:setMessage(MESSAGE_WALKAWAY, 'Well, bye then.')

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
