 local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end 
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end 
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end 
function onThink()                        npcHandler:onThink()    end 

-- Storage IDs -- 
citizen     = 22001  
hunter        = 22004     
mage        = 22056     
knight        = 22007     
nobleman    = 22009     
summoner    = 22011     
warrior        = 22013     
barbarian    = 22015     
druid        = 22017     
wizard        = 22019     
oriental    = 22021     
pirate        = 22023     
assassin    = 22025     
beggar        = 22027     
shaman        = 22029     
norseman    = 22031     
nightmare    = 22033     
jester        = 22035     
brotherhood    = 22037 
wayfarer = 22039
pumpkin = 22040
yalaharian = 22041
glooth = 22042
rift = 22043
elementalist = 22044
warmaster = 22045

newaddon    = 'Here you are, enjoy your brand new addon!' 
noitems        = 'You do not have all the required items.' 
noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.' 
already        = 'It seems you already have this addon, don\'t you try to mock me son!' 
     
	 
	 
	  -- ELEMENTALIST START -- 
function elementalistFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,elementalist) 
    if addon == -1 then 
        if getPlayerItemCount(cid,13940) >= 1 then 
        if doPlayerRemoveItem(cid,13940,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 432, 2) 
            doPlayerAddOutfit(cid, 433, 2) 
            setPlayerStorageValue(cid,elementalist,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function elementalistSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,elementalist+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,13756) >= 1 then 
        if doPlayerRemoveItem(cid,13756,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 432, 1) 
            doPlayerAddOutfit(cid, 433, 1) 
            setPlayerStorageValue(cid,elementalist+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- ELEMENTALIST END -- 


	 
	 
	  -- rift START -- 
function riftFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,rift) 
    if addon == -1 then 
        if getPlayerItemCount(cid,25378) >= 3 then 
        if doPlayerRemoveItem(cid,25378,3) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 845, 1) 
            doPlayerAddOutfit(cid, 846, 1) 
            setPlayerStorageValue(cid,rift,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function riftSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,rift+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,25172) >= 200 then 
        if doPlayerRemoveItem(cid,25172,200) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 845, 2) 
            doPlayerAddOutfit(cid, 846, 2) 
            setPlayerStorageValue(cid,rift+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- rift END -- 
	 
	 -- GLOOTH START -- 
function GloothFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,glooth) 
    if addon == -1 then 
        if getPlayerItemCount(cid,21400) >= 10 then 
        if doPlayerRemoveItem(cid,21400,10) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 610, 1) 
            doPlayerAddOutfit(cid, 618, 1) 
            setPlayerStorageValue(cid,glooth,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function GloothSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,glooth+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,21400) >= 10 then 
        if doPlayerRemoveItem(cid,21400,10) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 610, 2) 
            doPlayerAddOutfit(cid, 618, 2) 
            setPlayerStorageValue(cid,glooth+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- GLOOTH END -- 


	 
	 -- YALAHAR START -- 
function YalaharianFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,yalaharian) 
    if addon == -1 then 
        if getPlayerItemCount(cid,21400) >= 10 then 
        if doPlayerRemoveItem(cid,21400,10) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 324, 1) 
            doPlayerAddOutfit(cid, 325, 1) 
            setPlayerStorageValue(cid,yalaharian,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function YalaharianSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,yalaharian+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,21400) >= 10 then 
        if doPlayerRemoveItem(cid,21400,10) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 324, 2) 
            doPlayerAddOutfit(cid, 325, 2) 
            setPlayerStorageValue(cid,yalaharian+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- YALAHAR END -- 


	 -- HALLOWEN START -- 
function PumpkinFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,pumpkin) 
    if addon == -1 then 
        if getPlayerItemCount(cid,21400) >= 20 then 
        if doPlayerRemoveItem(cid,21400,20) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 759, 1) 
            doPlayerAddOutfit(cid, 760, 1) 
            setPlayerStorageValue(cid,pumpkin,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function PumpkinSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,pumpkin+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,21400) >= 20 then 
        if doPlayerRemoveItem(cid,21400,20) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 759, 2) 
            doPlayerAddOutfit(cid, 760, 2) 
            setPlayerStorageValue(cid,pumpkin+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- HALLOWEN END -- 

-- WARMASTER START -- 
function WarmasterFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,warmaster) 
    if addon == -1 then 
        if getPlayerItemCount(cid,11116) > 0 then 
        if doPlayerRemoveItem(cid,11116, 1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 335, 1) 
            doPlayerAddOutfit(cid, 336, 1) 
            setPlayerStorageValue(cid,warmaster,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function WarmasterSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,warmaster+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,11115) > 0 then 
        if doPlayerRemoveItem(cid,11115,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 335, 2) 
            doPlayerAddOutfit(cid, 336, 2) 
            setPlayerStorageValue(cid,warmaster+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

-- CITIZEN START -- 
function CitizenFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,citizen) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5878) >= 100 then 
        if doPlayerRemoveItem(cid,5878,100) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 128, 1) 
            doPlayerAddOutfit(cid, 136, 1) 
            setPlayerStorageValue(cid,citizen,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function CitizenSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,citizen+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5890) >= 100 and getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,2480) >= 1 then 
        if doPlayerRemoveItem(cid,5890,100) and doPlayerRemoveItem(cid,5902,50) and doPlayerRemoveItem(cid,2480,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 128, 2) 
            doPlayerAddOutfit(cid, 136, 2) 
            setPlayerStorageValue(cid,citizen+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- CITIZEN END -- 

-- HUNTER START -- 
function HunterFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,hunter) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5947) >= 1 and getPlayerItemCount(cid,5876) >= 100 and getPlayerItemCount(cid,5948) >= 100 and getPlayerItemCount(cid,5891) >= 5 and getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5888) >= 1 and getPlayerItemCount(cid,5889) >= 1 then 
        if doPlayerRemoveItem(cid,5947,1) and doPlayerRemoveItem(cid,5876,100) and doPlayerRemoveItem(cid,5948,100) and doPlayerRemoveItem(cid,5891,5) and doPlayerRemoveItem(cid,5887,1) and doPlayerRemoveItem(cid,5888,1) and doPlayerRemoveItem(cid,5889,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 129, 1)
doPlayerAddOutfit(cid, 137, 1)			
            setPlayerStorageValue(cid,hunter,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function HunterSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,hunter+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5875) >= 1 then 
        if doPlayerRemoveItem(cid,5875,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 129, 2) 
			doPlayerAddOutfit(cid, 137, 2)
            setPlayerStorageValue(cid,hunter+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- HUNTER END -- 

-- MAGE START -- 
function MageFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,mage) 
    if addon < 2 then 
        if getPlayerSex(cid) == 0 then -- PLAYERSEX == 0 é female
        if getPlayerItemCount(cid,5958) >= 1 then 
        if doPlayerRemoveItem(cid,5958,1) then 
            selfSay(newaddon, cid) 
                  
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 138, 1) 
            --doPlayerAddOutfit(cid, 130, 1) 
            setPlayerStorageValue(cid,mage,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        elseif getPlayerSex(cid) == 1 then -- PLAYERSEX == 1 é male
        if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then 
        if doPlayerRemoveItem(cid,2181,1) and doPlayerRemoveItem(cid,2182,1) and doPlayerRemoveItem(cid,2183,1) and doPlayerRemoveItem(cid,2185,1) and doPlayerRemoveItem(cid,2186,1) and doPlayerRemoveItem(cid,2187,1) and doPlayerRemoveItem(cid,2188,1) and doPlayerRemoveItem(cid,2189,1) and doPlayerRemoveItem(cid,2190,1) and doPlayerRemoveItem(cid,2191,1) and doPlayerRemoveItem(cid,5904,10) and doPlayerRemoveItem(cid,2193,20) and doPlayerRemoveItem(cid,5809,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 130, 1) 
            doPlayerAddOutfit(cid, 138, 1) 
            setPlayerStorageValue(cid,mage,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function MageSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,mage+1)  
    if addon < 2 then 
        if getPlayerSex(cid) == 0 then -- PLAYERSEX == 0 é female
        if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then 
        if doPlayerRemoveItem(cid,5894,70) and doPlayerRemoveItem(cid,5911,20) and doPlayerRemoveItem(cid,5883,40) and doPlayerRemoveItem(cid,5922,35) and doPlayerRemoveItem(cid,5886,10) and doPlayerRemoveItem(cid,5881,60) and doPlayerRemoveItem(cid,5882,40) and doPlayerRemoveItem(cid,5904,15) and doPlayerRemoveItem(cid,5905,30) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 138, 2) 
            --doPlayerAddOutfit(cid, 130, 2) 
            setPlayerStorageValue(cid,mage+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        elseif getPlayerSex(cid) == 1 then -- PLAYERSEX == 1 é male
        if getPlayerItemCount(cid,5903) >= 1 then 
        if doPlayerRemoveItem(cid,5903,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 130, 2) 
            doPlayerAddOutfit(cid, 138, 2) 
            setPlayerStorageValue(cid,mage+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- MAGE END -- 

-- KNIGHT START -- 
function KnightFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,knight) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5880) >= 100 then 
        if doPlayerRemoveItem(cid,5892,1) and doPlayerRemoveItem(cid,5880,100) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 131, 1) 
            doPlayerAddOutfit(cid, 139, 1) 
            setPlayerStorageValue(cid,knight,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function KnightSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,knight+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5893) >= 100 and getPlayerItemCount(cid,5924) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5887) >= 1 then 
        if doPlayerRemoveItem(cid,5893,100) and doPlayerRemoveItem(cid,5924,1) and doPlayerRemoveItem(cid,5885,1) and doPlayerRemoveItem(cid,5887,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 131, 2) 
            doPlayerAddOutfit(cid, 139, 2) 
            setPlayerStorageValue(cid,knight+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- KNIGHT END -- 

-- NOBLEMAN START -- 
function NoblemanFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,nobleman) 
    if addon == -1 then 
        if player_money >= 150000 then 
        if doPlayerRemoveMoney(cid,150000) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 132, 1) 
            doPlayerAddOutfit(cid, 140, 1) 
            setPlayerStorageValue(cid,nobleman,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function NoblemanSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,nobleman+1) 
    if addon == -1 then 
        if player_money >= 150000 then 
        if doPlayerRemoveMoney(cid,150000) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 132, 2) 
            doPlayerAddOutfit(cid, 140, 2) 
            setPlayerStorageValue(cid,nobleman+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- NOBLEMAN END -- 

-- SUMMONER START -- 
function SummonerFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,summoner) 
    if addon == -1 then 
        if getPlayerSex(cid) == 1 then 
        if getPlayerItemCount(cid,5958) >= 1 then 
        if doPlayerRemoveItem(cid,5958,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 133, 1) 
            doPlayerAddOutfit(cid, 141, 1) 
            setPlayerStorageValue(cid,summoner,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        elseif getPlayerSex(cid) == 0 then 
        if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then 
        if doPlayerRemoveItem(cid,2181,1) and doPlayerRemoveItem(cid,2182,1) and doPlayerRemoveItem(cid,2183,1) and doPlayerRemoveItem(cid,2185,1) and doPlayerRemoveItem(cid,2186,1) and doPlayerRemoveItem(cid,2187,1) and doPlayerRemoveItem(cid,2188,1) and doPlayerRemoveItem(cid,2189,1) and doPlayerRemoveItem(cid,2190,1) and doPlayerRemoveItem(cid,2191,1) and doPlayerRemoveItem(cid,5904,10) and doPlayerRemoveItem(cid,2193,20) and doPlayerRemoveItem(cid,5809,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 133, 1) 
            doPlayerAddOutfit(cid, 141, 1) 
            setPlayerStorageValue(cid,summoner,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function SummonerSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,summoner+2) 
    if addon == -1 then 
        if getPlayerSex(cid) == 1 then -- PLAYERSEX == 1 é male
        if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then 
        if doPlayerRemoveItem(cid,5894,70) and doPlayerRemoveItem(cid,5911,20) and doPlayerRemoveItem(cid,5883,40) and doPlayerRemoveItem(cid,5922,35) and doPlayerRemoveItem(cid,5886,10) and doPlayerRemoveItem(cid,5881,60) and doPlayerRemoveItem(cid,5882,40) and doPlayerRemoveItem(cid,5904,15) and doPlayerRemoveItem(cid,5905,30) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 133, 2) 
            --doPlayerAddOutfit(cid, 141, 2) 
            setPlayerStorageValue(cid,summoner+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        elseif getPlayerSex(cid) == 0 then -- PLAYERSEX == 0 é female
        if getPlayerItemCount(cid,5903) >= 1 then 
        if doPlayerRemoveItem(cid,5903,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 133, 2) 
            doPlayerAddOutfit(cid, 141, 2) 
            setPlayerStorageValue(cid,summoner+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- SUMMONER END -- 

-- WARRIOR START -- 
function WarriorFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,warrior) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5925) >= 100 and getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5919) >= 1 then 
        if doPlayerRemoveItem(cid,5925,100) and doPlayerRemoveItem(cid,5899,100) and doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,5919,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 134, 1) 
            doPlayerAddOutfit(cid, 142, 1) 
            setPlayerStorageValue(cid,warrior,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function WarriorSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,warrior+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5880) >= 100 then 
        if doPlayerRemoveItem(cid,5887,1) and doPlayerRemoveItem(cid,5880,100) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 134, 2) 
            doPlayerAddOutfit(cid, 142, 2) 
            setPlayerStorageValue(cid,warrior+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- WARRIOR END -- 

-- BARBARIAN START -- 
function BarbarianFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,barbarian) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then 
        if doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,5885,1) and doPlayerRemoveItem(cid,5911,50) and doPlayerRemoveItem(cid,5910,50) and doPlayerRemoveItem(cid,5886,10) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 143, 1) 
            doPlayerAddOutfit(cid, 147, 1) 
            setPlayerStorageValue(cid,barbarian,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function BarbarianSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,barbarian+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 and getPlayerStorageValue(cid,barbarian) then 
        if doPlayerRemoveItem(cid,5880,100) and doPlayerRemoveItem(cid,5892,1) and doPlayerRemoveItem(cid,5893,50) and doPlayerRemoveItem(cid,5876,50) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 143, 2) 
            doPlayerAddOutfit(cid, 147, 2) 
            setPlayerStorageValue(cid,barbarian+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- BARBARIAN END -- 

-- DRUID START -- 
function DruidFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,druid) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5897) >= 50 and getPlayerItemCount(cid,5896) >= 50 then 
        if doPlayerRemoveItem(cid,5897,50) and doPlayerRemoveItem(cid,5896,50) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 144, 1) 
            doPlayerAddOutfit(cid, 148, 1) 
            setPlayerStorageValue(cid,druid,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function DruidSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,druid+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5937) >= 1 and getPlayerItemCount(cid,5939) >= 1 and getPlayerItemCount(cid,5906) >= 100 and getPlayerItemCount(cid,5942) >= 1 and getPlayerItemCount(cid,5940) >= 1 then 
        if doPlayerRemoveItem(cid,5937,1) and doPlayerRemoveItem(cid,5939,1) and doPlayerRemoveItem(cid,5906,100) and doPlayerRemoveItem(cid,5942,1) and doPlayerRemoveItem(cid,5940,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 144, 2) 
            doPlayerAddOutfit(cid, 148, 2) 
            setPlayerStorageValue(cid,druid+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- DRUID END -- 

-- WIZARD START -- 
function WizardFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,wizard) 
    if addon == -1 then 
        if getPlayerItemCount(cid,2488) >= 1 and getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and getPlayerItemCount(cid,2536) >= 1 then 
        if doPlayerRemoveItem(cid,2488,1) and doPlayerRemoveItem(cid,2123,1) and doPlayerRemoveItem(cid,2492,1) and doPlayerRemoveItem(cid,2536,1) then 
            selfSay(newaddon, cid) 
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 145, 1) 
            doPlayerAddOutfit(cid, 149, 1) 
            setPlayerStorageValue(cid,wizard,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function WizardSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,wizard+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5922) >= 50 and getPlayerStorageValue(cid,wizard) then 
        if doPlayerRemoveItem(cid,5922,50) and getPlayerStorageValue(cid,wizard) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 145, 2) 
            doPlayerAddOutfit(cid, 149, 2) 
            setPlayerStorageValue(cid,wizard+1,1) 
        end 
        else 
            selfSay(noitems2, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- WIZARD END -- 

-- ORIENTAL START -- 
function OrientalFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,oriental) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5945) >= 1 then 
        if doPlayerRemoveItem(cid,5945,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 146, 1) 
            doPlayerAddOutfit(cid, 150, 1) 
            setPlayerStorageValue(cid,oriental,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function OrientalSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,oriental+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5883) >= 100 and getPlayerItemCount(cid,5895) >= 100 and getPlayerItemCount(cid,5891) >= 2 and getPlayerItemCount(cid,5912) >= 100 then 
        if doPlayerRemoveItem(cid,5883,100) and doPlayerRemoveItem(cid,5895,100) and doPlayerRemoveItem(cid,5891,2) and doPlayerRemoveItem(cid,5912,100) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 146, 2) 
            doPlayerAddOutfit(cid, 150, 2) 
            setPlayerStorageValue(cid,oriental+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- ORIENTAL END -- 

-- PIRATE START -- 
function PirateFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,pirate) 
    if addon == -1 then 
        if getPlayerItemCount(cid,6126) >= 100 and getPlayerItemCount(cid,6097) >= 100 and getPlayerItemCount(cid,6098) >= 100 then 
        if doPlayerRemoveItem(cid,6126,100) and doPlayerRemoveItem(cid,6097,100) and doPlayerRemoveItem(cid,6098,100) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 151, 1) 
            doPlayerAddOutfit(cid, 155, 1) 
            setPlayerStorageValue(cid,pirate,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function PirateSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,pirate+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,6099) >= 1 and getPlayerItemCount(cid,6100) >= 1 and getPlayerItemCount(cid,6101) >= 1 and getPlayerItemCount(cid,6102) >= 1 then 
        if doPlayerRemoveItem(cid,6099,1) and doPlayerRemoveItem(cid,6100,1) and doPlayerRemoveItem(cid,6101,1) and doPlayerRemoveItem(cid,6102,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 151, 2) 
            doPlayerAddOutfit(cid, 155, 2) 
            setPlayerStorageValue(cid,pirate+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- PIRATE END -- 

-- ASSASSIN START -- 
function AssassinFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,assassin) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5913) >= 50 and getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5909) >= 50 and getPlayerItemCount(cid,5886) >= 10 then 
        if doPlayerRemoveItem(cid,5912,50) and doPlayerRemoveItem(cid,5910,50) and doPlayerRemoveItem(cid,5911,50) and doPlayerRemoveItem(cid,5913,50) and doPlayerRemoveItem(cid,5914,50) and doPlayerRemoveItem(cid,5909,50) and doPlayerRemoveItem(cid,5886,10) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 152, 1) 
            doPlayerAddOutfit(cid, 156, 1) 
            setPlayerStorageValue(cid,assassin,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function AssassinSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,assassin+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5930) >= 1 and getPlayerItemCount(cid,5804) >= 1 then 
        if doPlayerRemoveItem(cid,5930,1) and doPlayerRemoveItem(cid,5804,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 152, 2) 
            doPlayerAddOutfit(cid, 156, 2) 
            setPlayerStorageValue(cid,assassin+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- ASSASSIN END -- 

-- BEGGAR START -- 
function BeggarFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,beggar) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5883) >= 100 and player_money >= 20000 then 
        if doPlayerRemoveItem(cid,5883,100) and doPlayerRemoveMoney(cid,20000) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 153, 1) 
            doPlayerAddOutfit(cid, 157, 1) 
            setPlayerStorageValue(cid,beggar,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function BeggarSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,beggar+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,6107) >= 1 then 
        if doPlayerRemoveItem(cid,6107,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 153, 2) 
            doPlayerAddOutfit(cid, 157, 2) 
            setPlayerStorageValue(cid,beggar+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- BEGGAR END -- 

-- SHAMAN START -- 
function ShamanSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,shaman+6) 
    if addon == -1 then 
        if getPlayerItemCount(cid,3955) >= 5 and getPlayerItemCount(cid,5015) >= 1 then 
        if doPlayerRemoveItem(cid,3955,5) and doPlayerRemoveItem(cid,5015,1) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 154, 2) 
            doPlayerAddOutfit(cid, 158, 2) 
            setPlayerStorageValue(cid,shaman,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function ShamanFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,shaman+4) 
    if addon == -1 then 
        if getPlayerItemCount(cid,3966) >= 5 and getPlayerItemCount(cid,3967) >= 5 then 
        if doPlayerRemoveItem(cid,3966,5) and doPlayerRemoveItem(cid,3967,5) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 154, 1) 
            doPlayerAddOutfit(cid, 158, 1) 
            setPlayerStorageValue(cid,shaman+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- SHAMAN END -- 

-- NORSEMAN START -- 
function NorsemanFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,norseman) 
    if addon == -1 then 
        if getPlayerItemCount(cid,7290) >= 5 then 
        if doPlayerRemoveItem(cid,7290,5) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 251, 1) 
            doPlayerAddOutfit(cid, 252, 1) 
            setPlayerStorageValue(cid,norseman,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function NorsemanSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,norseman+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,7290) >= 10 then 
        if doPlayerRemoveItem(cid,7290,10) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 251, 2) 
            doPlayerAddOutfit(cid, 252, 2) 
            setPlayerStorageValue(cid,norseman+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- NORSEMAN END -- 

-- NIGHTMARE START -- 
function NightmareFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,nightmare) 
    if addon == -1 then 
        if getPlayerItemCount(cid,6500) >= 500 then 
        if doPlayerRemoveItem(cid,6500,500) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 268, 1) 
            doPlayerAddOutfit(cid, 269, 1) 
            setPlayerStorageValue(cid,nightmare,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function NightmareSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,nightmare+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,6500) >= 1500 then 
        if doPlayerRemoveItem(cid,6500,1500) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 268, 2) 
            doPlayerAddOutfit(cid, 269, 2) 
			doPlayerAddItem(cid, 6391, 1)
            setPlayerStorageValue(cid,nightmare+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- NIGHTMARE END -- 

-- JESTER START -- 
function JesterFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,jester) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5879) >= 1 and getPlayerItemCount(cid,5878) >= 4 then 
        if doPlayerRemoveItem(cid,5879,1) and doPlayerRemoveItem(cid,5878,4) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 273, 1) 
            doPlayerAddOutfit(cid, 270, 1) 
            setPlayerStorageValue(cid,jester,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function JesterSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,jester+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,5909) >= 5 then 
        if doPlayerRemoveItem(cid,5909,5) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 273, 2) 
            doPlayerAddOutfit(cid, 270, 2) 
            setPlayerStorageValue(cid,jester+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- JESTER END -- 

-- BROTHERHOOD START -- 
function BrotherhoodFirst(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,brotherhood) 
    if addon == -1 then 
        if getPlayerItemCount(cid,6500) >= 500 then 
        if doPlayerRemoveItem(cid,6500,500) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 278, 1) 
            doPlayerAddOutfit(cid, 279, 1) 
            setPlayerStorageValue(cid,brotherhood,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 

function BrotherhoodSecond(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if isPremium(cid) then 
    addon = getPlayerStorageValue(cid,brotherhood+1) 
    if addon == -1 then 
        if getPlayerItemCount(cid,6500) >= 1500 then 
        if doPlayerRemoveItem(cid,6500,1500) then 
            selfSay(newaddon, cid) 
              
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 278, 2) 
            doPlayerAddOutfit(cid, 279, 2) 
			doPlayerAddItem(cid, 6433, 1)
            setPlayerStorageValue(cid,brotherhood+1,1) 
        end 
        else 
            selfSay(noitems, cid) 
        end 
    else 
        selfSay(already, cid) 
    end 
    end 

end 
-- BROTHERHOOD END -- 

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


keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the following outfits: Citizen, Hunter, Mage, Knight, Nobleman, Summoner, Warrior, Barbarian, Druid, Wizard, Oriental, Pirate, Assassin, Beggar, Shaman, Norseman, Elementalist, Nightmare, Jester and Brotherhood."}) 
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first hunter addon' or 'second hunter addon' where you replace 'hunter' with whatever outfit you'd like to achieve the addons for. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"}) 

 node1 = keywordHandler:addKeyword({'first citizen addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first citizen addon you need to give me 100 minotaur leathers. Do you have them with you?'}) 
    node1:addChildKeyword({'yes'}, CitizenFirst, {}) 
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node2 = keywordHandler:addKeyword({'second citizen addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first hunter addon you need to give me 100 chicken feathers, 50 honeycombs and a legion helmet. Do you have them with you?'}) 
    node2:addChildKeyword({'yes'}, CitizenSecond, {}) 
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node3 = keywordHandler:addKeyword({'first hunter addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first hunter addon you need to give me  Elane Crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, a piece of royal steel, a piece of hell steel and a piece of draconian steel. Do you have them with you?'}) 
    node3:addChildKeyword({'yes'}, HunterFirst, {}) 
    node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node4 = keywordHandler:addKeyword({'second hunter addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second hunter addon you need to give me a pair of sniper gloves. Do you have them with you?'}) 
    node4:addChildKeyword({'yes'}, HunterSecond, {}) 
    node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node5 = keywordHandler:addKeyword({'first mage addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first mage addon you need to give me a winning lottery ticket if you are a female. Otherwise, you need to give me all kind of wands and rods, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'}) 
    node5:addChildKeyword({'yes'}, MageFirst, {}) 
    node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node6 = keywordHandler:addKeyword({'second mage addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second mage addon you need to give me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts if you are a female. Otherwise, you need to give me a ferumbras\' hat. Do you have them with you?'}) 
    node6:addChildKeyword({'yes'}, MageSecond, {}) 
    node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node7 = keywordHandler:addKeyword({'first knight addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first knight addon you need to give me a chunk of crude iron and 100 iron ores. Do you have it with you?'}) 
    node7:addChildKeyword({'yes'}, KnightFirst, {}) 
    node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node8 = keywordHandler:addKeyword({'second knight addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second knight addon you need to give me 100 perfect behemoth fangs, a damaged steel helmet, warrior\'s sweat and a royal steel. Do you have them with you?'}) 
    node8:addChildKeyword({'yes'}, KnightSecond, {}) 
    node8:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 
     
 node9 = keywordHandler:addKeyword({'first nobleman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first nobleman addon you need to give me 150,000 gold pieces. Do you have it with you?'}) 
    node9:addChildKeyword({'yes'}, NoblemanFirst, {}) 
    node9:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node10 = keywordHandler:addKeyword({'second nobleman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second nobleman addon you need to give me 150,000 gold pieces. Do you have them with you?'}) 
    node10:addChildKeyword({'yes'}, NoblemanSecond, {}) 
    node10:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node11 = keywordHandler:addKeyword({'first summoner addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = '{[MALE]} To achieve the first summoner addon you need to give me a winning lottery ticket. {[FEMALE]} You need to give me all kind of wands and rods, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'}) 
    node11:addChildKeyword({'yes'}, SummonerFirst, {}) 
    node11:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node12 = keywordHandler:addKeyword({'second summoner addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = '{[MALE]} To achieve the second summoner addon you need to give me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts. {[FEMALE]} You need to give me a ferumbras\' hat. Do you have them with you?'}) 
    node12:addChildKeyword({'yes'}, SummonerSecond, {}) 
    node12:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 
     
 node13 = keywordHandler:addKeyword({'first warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first warrior addon you need to give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?'}) 
    node13:addChildKeyword({'yes'}, WarriorFirst, {}) 
    node13:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node14 = keywordHandler:addKeyword({'second warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second warrior addon you need to give me 100 iron ores and a piece of royal steel. Do you have them with you?'}) 
    node14:addChildKeyword({'yes'}, WarriorSecond, {}) 
    node14:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node15 = keywordHandler:addKeyword({'first barbarian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first barbarian addon you need to give me a fighting spirit, the warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spool of yarns. Do you have them with you?'}) 
    node15:addChildKeyword({'yes'}, BarbarianFirst, {}) 
    node15:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node16 = keywordHandler:addKeyword({'second barbarian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second barbarian addon you need to give me 100 iron ore, a chunk of crude iron, 50 behemoth fangs and 50 lizard leathers. Do you have them with you?'}) 
    node16:addChildKeyword({'yes'}, BarbarianSecond, {}) 
    node16:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node17 = keywordHandler:addKeyword({'first druid addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first druid addon you need to give me 50 wolf paws and 50 bear paws. Do you have them with you?'}) 
    node17:addChildKeyword({'yes'}, DruidFirst, {}) 
    node17:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node18 = keywordHandler:addKeyword({'second druid addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second druid addon you need to give me Botanist Container, Ceiron\'s waterskin, 100 demon dusts, a blessed wooden stake and Ceirons wolf tooth chain. Do you have them with you?'}) 
    node18:addChildKeyword({'yes'}, DruidSecond, {}) 
    node18:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node19 = keywordHandler:addKeyword({'first wizard addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first wizard addon you need to give me a dragon scale mail, a pair of crown legs, a medusa shield and a ring of the sky. Do you have them with you?'}) 
    node19:addChildKeyword({'yes'}, WizardFirst, {}) 
    node19:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node20 = keywordHandler:addKeyword({'second wizard addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second wizard addon you need to give me 50 holy orchids. Do you have them with you?'}) 
    node20:addChildKeyword({'yes'}, WizardSecond, {}) 
    node20:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node21 = keywordHandler:addKeyword({'first oriental addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first oriental addon you need to give me a mermaid comb. Do you have it with you?'}) 
    node21:addChildKeyword({'yes'}, OrientalFirst, {}) 
    node21:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node22 = keywordHandler:addKeyword({'second oriental addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second oriental addon you need to give me 100 ape furs, 100 fish fins, 2 enchanted chicken wings and 100 blue pieces of cloth. Do you have them with you?'}) 
    node22:addChildKeyword({'yes'}, OrientalSecond, {}) 
    node22:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node23 = keywordHandler:addKeyword({'first pirate addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first pirate addon you need to give me 100 hooks, 100 peg legs and 100 eye patches. Do you have them with you?'}) 
    node23:addChildKeyword({'yes'}, PirateFirst, {}) 
    node23:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node24 = keywordHandler:addKeyword({'second pirate addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second pirate addon you need to give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'}) 
    node24:addChildKeyword({'yes'}, PirateSecond, {}) 
    node24:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node25 = keywordHandler:addKeyword({'first assassin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first assassin addon you need to give me 50 Blue Piece of Cloths, 50 Green Piece of Cloths, 50 Red Piece of Cloths, 50 Brown Piece of Cloths, 50 Yellow Piece of Cloths, 50 White Piece of Cloths and 10 Spool of Yarns. Do you have them with you?'}) 
    node25:addChildKeyword({'yes'}, AssassinFirst, {}) 
    node25:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node26 = keywordHandler:addKeyword({'second assassin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second assassin addon you need to give me 1 Behemoth Claw and 1 Nose Ring. Do you have them with you?'}) 
    node26:addChildKeyword({'yes'}, AssassinSecond, {}) 
    node26:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node27 = keywordHandler:addKeyword({'first beggar addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first beggar addon you need to give me 100 ape furs and 20,000 gold pieces. Do you have them with you?'}) 
    node27:addChildKeyword({'yes'}, BeggarFirst, {}) 
    node27:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node28 = keywordHandler:addKeyword({'second beggar addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second beggar addon you need to give me simon the beggar\'s staff. Do you have it with you?'}) 
    node28:addChildKeyword({'yes'}, BeggarSecond, {}) 
    node28:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node29 = keywordHandler:addKeyword({'second shaman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second shaman addon you need to give me 5 dworf voodoo dolls and a mandrake. Do you have them with you?'}) 
    node29:addChildKeyword({'yes'}, ShamanSecond, {}) 
    node29:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node30 = keywordHandler:addKeyword({'first shaman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first shaman addon you need to give me 5 banana staffs and 5 tribal masks. Do you have them with you?'}) 
    node30:addChildKeyword({'yes'}, ShamanFirst, {}) 
    node30:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node31 = keywordHandler:addKeyword({'first norseman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first norseman addon you need to give me 5 shards. Do you have them with you?'}) 
    node31:addChildKeyword({'yes'}, NorsemanFirst, {}) 
    node31:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node32 = keywordHandler:addKeyword({'second norseman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second norseman addon you need to give me 10 shards. Do you have them with you?'}) 
    node32:addChildKeyword({'yes'}, NorsemanSecond, {}) 
    node32:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node33 = keywordHandler:addKeyword({'first nightmare addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first nightmare addon you need to give me 500 demonic essences. Do you have them with you?'}) 
    node33:addChildKeyword({'yes'}, NightmareFirst, {}) 
    node33:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node34 = keywordHandler:addKeyword({'second nightmare addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second nightmare addon you need to give me 1500 demonic essences (you will receive Nightmare Shield). Do you have them with you?'}) 
    node34:addChildKeyword({'yes'}, NightmareSecond, {}) 
    node34:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node35 = keywordHandler:addKeyword({'first jester addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first jester addon you need to give me a giant spider silk and 4 minotaur leathers. Do you have them with you?'}) 
    node35:addChildKeyword({'yes'}, JesterFirst, {}) 
    node35:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node36 = keywordHandler:addKeyword({'second jester addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second jester addon you need to give me 5 white piece of cloth. Do you have them with you?'}) 
    node36:addChildKeyword({'yes'}, JesterSecond, {}) 
    node36:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node37 = keywordHandler:addKeyword({'first brotherhood addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first brotherhood addon you need to give me 500 demonic essences. Do you have them with you?'}) 
    node37:addChildKeyword({'yes'}, BrotherhoodFirst, {}) 
    node37:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

 node38 = keywordHandler:addKeyword({'second brotherhood addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second brotherhood addon you need to give me 1500 demonic essences (you will receive Necromancer Shield). Do you have them with you?'}) 
    node38:addChildKeyword({'yes'}, BrotherhoodSecond, {}) 
    node38:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node39 = keywordHandler:addKeyword({'first wayfarer addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first wayfarer addon you need to give me the Old Cape. Do you have them with you?'}) 
    node39:addChildKeyword({'yes'}, WayfarerFirst, {}) 
    node39:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node40 = keywordHandler:addKeyword({'second wayfarer addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second wayfarer addon you need to give me the Sedge Hat. Do you have them with you?'}) 
    node40:addChildKeyword({'yes'}, WayfarerSecond, {}) 
    node40:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	
	node41 = keywordHandler:addKeyword({'first pumpkin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first pumpkin addon you need to give me 20 Silver Raid Tokens. Do you have them with you?'}) 
    node41:addChildKeyword({'yes'}, PumpkinFirst, {}) 
    node41:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node42 = keywordHandler:addKeyword({'second pumpkin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second pumpkin addon you need to give me 20 Silver Raid Tokens. Do you have them with you?'}) 
    node42:addChildKeyword({'yes'}, PumpkinSecond, {}) 
    node42:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node43 = keywordHandler:addKeyword({'first yalaharian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first Yalaharian addon you need to give me 10 Silver Raid Tokens. Do you have them with you?'}) 
    node43:addChildKeyword({'yes'}, YalaharianFirst, {}) 
    node43:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node44 = keywordHandler:addKeyword({'second yalaharian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second Yalaharian addon you need to give me 10 Silver Raid Tokens. Do you have them with you?'}) 
    node44:addChildKeyword({'yes'}, YalaharianSecond, {}) 
    node44:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	
	node45 = keywordHandler:addKeyword({'first glooth addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first Glooth addon you need to give me 10 Silver Raid Tokens. Do you have them with you?'}) 
    node45:addChildKeyword({'yes'}, GloothFirst, {}) 
    node45:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node46 = keywordHandler:addKeyword({'second glooth addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second Glooth addon you need to give me 10 Silver Raid Tokens. Do you have them with you?'}) 
    node46:addChildKeyword({'yes'}, GloothSecond, {}) 
    node46:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	
	node47 = keywordHandler:addKeyword({'first rift warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first Rift Warrior addon you need to give me 3 Gold Tokens. Do you have them with you?'}) 
    node47:addChildKeyword({'yes'}, riftFirst, {}) 
    node47:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node48 = keywordHandler:addKeyword({'second rift warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second Rift Warrior addon you need to give me 200 Silver Tokens. Do you have them with you?'}) 
    node48:addChildKeyword({'yes'}, riftSecond, {}) 
    node48:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 
 -- elementalist 
    node49 = keywordHandler:addKeyword({'first elementalist addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first Elementalist addon you need to give me 1 Elemental Spikes. Do you have them with you?'}) 
    node49:addChildKeyword({'yes'}, elementalistFirst, {}) 
    node49:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

	node50 = keywordHandler:addKeyword({'second elementalist addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second Elementalist addon you need to give me 1 Mages Cap. Do you have them with you?'}) 
    node50:addChildKeyword({'yes'}, elementalistSecond, {}) 
    node50:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 
-- elementalist end
-- warmaster
    node49 = keywordHandler:addKeyword({'first warmaster addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first Warmaster addon you need to give me 1 Serpent Crest. Do you have them with you?'}) 
    node49:addChildKeyword({'yes'}, WarmasterFirst, {}) 
    node49:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 

    node50 = keywordHandler:addKeyword({'second warmaster addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second Warmaster addon you need to give me 1 Tribal Crest. Do you have them with you?'}) 
    node50:addChildKeyword({'yes'}, WarmasterSecond, {}) 
    node50:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 
-- warmaster end

 npcHandler:addModule(FocusModule:new()) 