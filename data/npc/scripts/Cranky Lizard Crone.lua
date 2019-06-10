 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end

-- Storage IDs --
wayfarer = 22039

newaddon    = 'Here you are, enjoy your brand new addon!'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'



--WAYFARER START --
function WayfarerFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,wayfarer)
    if addon == -1 then
        if getPlayerItemCount(cid,12657) >= 1 then
        if doPlayerRemoveItem(cid,12657,1) then
            selfSay(newaddon, cid)

            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 366, 1)
            doPlayerAddOutfit(cid, 367, 1)
            setPlayerStorageValue(cid,wayfarer,1)
        end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
    end

end

function WayfarerSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,wayfarer+1)
    if addon == -1 then
        if getPlayerItemCount(cid,12656) >= 1 then
        if doPlayerRemoveItem(cid,12656,1) then
            selfSay(newaddon, cid)

            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 366, 2)
            doPlayerAddOutfit(cid, 367, 2)
            setPlayerStorageValue(cid,wayfarer+1,1)
        end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
    end

end
-- WAYFARER END --


keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the following outfit: {Wayfarer}."})

keywordHandler:addKeyword({'wayfarer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask about {first addon} or {second addon}."})

keywordHandler:addKeyword({'outfit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask about {first addon} or {second addon}."})

keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask about {first addon} or {second addon}."})

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "llected all the required pieces, say 'yes' and voila - you got yourself an addon!"})

	node1 = keywordHandler:addKeyword({'first addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first wayfarer addon you need to give me the Old Cape. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, WayfarerFirst, {})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

	node2 = keywordHandler:addKeyword({'second addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second wayfarer addon you need to give me the Sedge Hat. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, WayfarerSecond, {})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


 npcHandler:addModule(FocusModule:new())
