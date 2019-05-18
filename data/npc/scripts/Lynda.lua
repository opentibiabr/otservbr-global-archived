 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local function creatureSayCallback(cid, type, msg)
	npcHandler:say('Marriage System is disabled.', cid)
    return false
end
 
local function confirmWedding(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
 
    local player = Player(cid)
    local playerStatus = getPlayerMarriageStatus(player:getGuid())
    local candidate = getPlayerSpouse(player:getGuid())
    if playerStatus == PROPACCEPT_STATUS then
      --  local item3 = Item(doPlayerAddItem(cid,ITEM_Meluna_Ticket,2))
        setPlayerMarriageStatus(player:getGuid(), MARRIED_STATUS)
        setPlayerMarriageStatus(candidate, MARRIED_STATUS)
        setPlayerSpouse(player:getGuid(), candidate)
        setPlayerSpouse(candidate, player:getGuid())
        delayedSay('Dear friends and family, we are gathered here today to witness and celebrate the union of ' .. getPlayerNameById(candidate) .. ' and ' .. player:getName() .. ' in marriage.')
        delayedSay('Through their time together, they have come to realize that their personal dreams, hopes, and goals are more attainable and more meaningful through the combined effort and mutual support provided in love, commitment, and family;',5000)
        delayedSay('and so they have decided to live together as husband and wife. And now, by the power vested in me by the Gods of Tibia, I hereby pronounce you husband and wife.',15000)
        delayedSay('*After a whispered blessing opens an hand towards ' .. player:getName() .. '* Take these two engraved wedding rings and give one of them to your spouse.',22000)
        delayedSay('You may now kiss your bride.',28000)
        local item1 = Item(doPlayerAddItem(cid,ITEM_ENGRAVED_WEDDING_RING,1))
        local item2 = Item(doPlayerAddItem(cid,ITEM_ENGRAVED_WEDDING_RING,1))
        item1:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, player:getName() .. ' & ' .. getPlayerNameById(candidate) .. ' forever - married on ' .. os.date('%B %d, %Y.'))
        item2:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, player:getName() .. ' & ' .. getPlayerNameById(candidate) .. ' forever - married on ' .. os.date('%B %d, %Y.'))
    else
        npcHandler:say('Your partner didn\'t accept your proposal, yet', cid)
    end
    return true
end
		-- END --
	local function confirmRemoveEngage(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
   
    local player = Player(cid)
    local playerStatus = getPlayerMarriageStatus(player:getGuid())
    local playerSpouse = getPlayerSpouse(player:getGuid())
    if playerStatus == PROPOSED_STATUS then
		
        npcHandler:say('Are you sure you want to remove your wedding proposal with {' .. getPlayerNameById(playerSpouse) .. '}?', cid)
        node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 3, text = 'Ok, let\'s keep it then.'})
       
        local function removeEngage(cid, message, keywords, parameters, node)
            doPlayerAddItem(cid,ITEM_WEDDING_RING,1)
       doPlayerAddItem(cid,10503,1)
            setPlayerMarriageStatus(player:getGuid(), 0)
            setPlayerSpouse(player:getGuid(), -1)
            npcHandler:say(parameters.text, cid)
            keywordHandler:moveUp(parameters.moveup)
        end
        node:addChildKeyword({'yes'}, removeEngage, {moveup = 3, text = 'Ok, your marriage proposal to {' .. getPlayerNameById(playerSpouse) .. '} has been removed. Take your wedding ring back.'})
    else
        npcHandler:say('You don\'t have any pending proposal to be removed.', cid)
        keywordHandler:moveUp(2)
    end
    return true
end

local function confirmDivorce(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
   
    local player = Player(cid)
    local playerStatus = getPlayerMarriageStatus(player:getGuid())
    local playerSpouse = getPlayerSpouse(player:getGuid())
    if playerStatus == MARRIED_STATUS then
        npcHandler:say('Are you sure you want to divorce of {' .. getPlayerNameById(playerSpouse) .. '}?', cid)
        node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 3, text = 'Great! Marriages should be an eternal commitment.'})
       
        local function divorce(cid, message, keywords, parameters, node)
            local player = Player(cid)
            local spouse = getPlayerSpouse(player:getGuid())
            setPlayerMarriageStatus(player:getGuid(), 0)
            setPlayerSpouse(player:getGuid(), -1)
            setPlayerMarriageStatus(spouse, 0)
            setPlayerSpouse(spouse, -1)
            npcHandler:say(parameters.text, cid)
            keywordHandler:moveUp(parameters.moveup)
        end
        node:addChildKeyword({'yes'}, divorce, {moveup = 3, text = 'Ok, you are now divorced of {' .. getPlayerNameById(playerSpouse) .. '}. Think better next time after marrying someone.'})
    else
        npcHandler:say('You aren\'t married to get a divorce.', cid)
        keywordHandler:moveUp(2)
    end
    return true
end

local node1 = keywordHandler:addKeyword({'marry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to get married? Make sure you have a wedding ring and the wedding outfit box with you.'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'That\'s fine.'})
local node2 = node1:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'And who would you like to marry?'})
node2:addChildKeyword({'[%w]'}, tryEngage, {})

local node3 = keywordHandler:addKeyword({'celebration'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Is your soulmate and friends here with you for the celebration?.'})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then go bring them here!.'})
local node4 = node3:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Good, let\'s {begin} then!.'}) --, confirmWedding, {})
node4:addChildKeyword({'begin'}, confirmWedding, {})


keywordHandler:addKeyword({'remove'}, confirmRemoveEngage, {})

keywordHandler:addKeyword({'divorce'}, confirmDivorce, {})

--keywordHandler:addKeyword({'celebration'}, confirmwedding,{})

npcHandler:setMessage(MESSAGE_GREET, "Welcome in the name of the gods, pilgrim |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Be careful on your journeys.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Be careful on your journeys.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
