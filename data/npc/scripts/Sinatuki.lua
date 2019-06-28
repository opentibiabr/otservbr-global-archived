local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'Chuqua'}, StdModule.say, {npcHandler = npcHandler, text = "Chuqua jamjam!! Tiyopa Sinatuki?"})

local fishsID = {7158,7159}

function creatureSayCallback(cid, type, msg)

local player = Player(cid)

          if(not npcHandler:isFocused(cid)) then
                    return false
          end
		  	  
		  if msgcontains(msg, 'Nupi') then	
		  
                if  player:getStorageValue(Storage.BarbarianTest.Questline) >= 3 and player:getStorageValue(Storage.TheIceIslands.Questline) >=5 then
				
                    for i=1, #fishsID do 

				        if getPlayerItemCount(cid, fishsID[i]) >= 100 then

                              doPlayerRemoveItem(cid,fishsID[i], 100) 							  
                              doPlayerAddItem(cid, 7290, 5)
                              selfSay('Jinuma, suvituka siq chuqua!! Nguraka, nguraka! <happily takes the food from you and gives you five glimmering crystals> ', cid)
							  break
                        elseif getPlayerItemCount(cid, fishsID[i]) >= 99 then
						      doPlayerRemoveItem(cid,fishsID[i], 99) 							  
                              doPlayerAddItem(cid, 7290, 5)
							  selfSay('Jinuma, suvituka siq chuqua!! Nguraka, nguraka! <happily takes the food from you> ', cid)
							  break
					    else selfSay('Kisavuta! <giggles>', cid) 
						      
						end
						
					end	
                end
	      end
		  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
