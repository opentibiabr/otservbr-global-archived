local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Storage IDs -- 
local goldenOutfit = Storage.goldenOutfit
local goldenFirstAddon = Storage.goldenFirstAddon
local goldenSecondAddon = Storage.goldenSecondAddon 
		
local baseOutfit = 500000000
local firstOutfit = 250000000
local secondOutfit = 250000000

newaddon    = 'Here you are, enjoy your brand new addon!' 
newoutfit    = 'Take this armor as a token of great gratitude. Let us forever remember this day, my friend!' 
noitems        = 'You do not have all the required items.' 
noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.' 
already        = 'It seems you already have this addon, don\'t you try to mock me son!' 
newaddonprimeiro        = 'Take this boots as a token of great gratitude. Let us forever remember this day, my friend!' 
newaddonsegundo        = 'Take this helmet as a token of great gratitude. Let us forever remember this day, my friend!' 
      
function goldenoutfit(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 

    if isPremium(cid) then  
		local player = Player(cid)
		if not player:hasOutfit(1211) and not player:hasOutfit(1210) then 
			if  player:removeMoneyNpc(baseOutfit) then  
				selfSay(newoutfit, cid)  
				doSendMagicEffect(getCreaturePosition(cid), 13) 
				doPlayerAddOutfit(cid, 1211)  --- female
				doPlayerAddOutfit(cid, 1210)  --- male
				setPlayerStorageValue(cid,goldenOutfit,1) 
			else 
				selfSay(noitems, cid) 
			end 
		else 
			selfSay(already, cid) 
		end 
    end 
end

function primeiroaddon(cid, message, keywords, parameters, node) 


    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 
	
    if isPremium(cid) then
		local player = Player(cid)
		if not player:hasOutfit(1211, 1) and not player:hasOutfit(1210, 1) then 
			if  player:removeMoneyNpc(firstOutfit) then  
				selfSay(newaddonprimeiro, cid)  
				doSendMagicEffect(getCreaturePosition(cid), 13) 
				doPlayerAddOutfit(cid, 1211,1)  --- female
				doPlayerAddOutfit(cid, 1210,1)  --- male
				setPlayerStorageValue(cid,goldenFirstAddon,1) 
			else 
				selfSay(noitems, cid) 
			end 
		else 
			selfSay(already, cid) 
		end 
	end
end

function segundoaddon(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 

    if isPremium(cid) then  
		local player = Player(cid)
		if not player:hasOutfit(1211, 2) and not player:hasOutfit(1210, 2) then 
			if  player:removeMoneyNpc(secondOutfit) then  
				selfSay(newaddonsegundo, cid)  
				doSendMagicEffect(getCreaturePosition(cid), 13) 
				doPlayerAddOutfit(cid, 1211, 2)  --- female
				doPlayerAddOutfit(cid, 1210, 2)  --- male
				setPlayerStorageValue(cid,goldenSecondAddon, 1) 
			else 
				selfSay(noitems, cid) 
			end 
		else 
			selfSay(already, cid) 
		end 
    end
end
   
local node2 = 
keywordHandler:addKeyword({'outfit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'In exchange for a truly generous donation I will offer a special outfit. Do you want to make a donation?\nExcellent! Now, let me explain.\n If you donate 1.000.000.000 gold pieces, you will be entitled to wear a unique outfit...\nYou will be entitled to wear the {armor} for 500.000.000 gold pieces, {boots} for an additional 250.000.000 and the {helmet} for another 250.000.000 gold pieces. ...\nWhat will it be?'})
node2:addChildKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wold like to donate 500.000.000 gold pieces which in return will entitle you to wear a unique armor?', reset = false})
node2:addChildKeyword({'yes'}, goldenoutfit, {}) 
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

local node3 = 
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wold like to donate 250.000.000 gold pieces which in return will entitle you to wear a unique helmet?'})
node3:addChildKeyword({'yes'}, segundoaddon, {})   
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

local node4 = 
keywordHandler:addKeyword({'boots'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wold like to donate 250.000.000 gold pieces which in return will entitle you to wear a unique boots?'})
node4:addChildKeyword({'yes'}, primeiroaddon, {}) 
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})
 
-- Promotion
local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})
npcHandler:addModule(FocusModule:new())