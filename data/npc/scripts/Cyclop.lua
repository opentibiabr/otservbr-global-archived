 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local voices = { {text = 'Trade Items: Crown Armor, Dragon Shield, Devil Helmet, Giant Sword and Soul Orb.'} }
npcHandler:addModule(VoiceModule:new(voices))
 
local items = {
          item5 = {2487, 5887}, -- item1 item que será pedido e que será dado na primeira troca
          item4 = {2516, 5889}, -- item2 item que será pedido e que será dado na segunda troca
		  item3 = {2462, 5888}, -- item3 item que será pedido e que será dado na segunda troca
		  item2 = {2393, 5892}, -- item3 item que será pedido e que será dado na segunda troca
		  
		  item1 = {5944, 6529} -- item3 item que será pedido e que será dado na segunda troca
		 
}
local counts = {
          count5 = {1, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count4 = {1, 1}, -- count2 quantidade que será pedido e que será dado na segunda troca
		  count3 = {1, 1}, -- count3 quantidade que será pedido e que será dado na segunda troca
		  count2 = {1, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  
		  count1 = {1, 3} -- count4 quantidade que será pedido e que será dado na segunda troca
		  
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if msgcontains(msg, 'soul orb') or msgcontains(msg, 'infernal bolt') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('You just swap '.. counts.count1[1] ..' '.. getItemName(items.item1[1]) ..' for '.. counts.count1[2] ..' '.. getItemName(items.item1[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemName(items.item1[1]) ..'.', cid)
                    end

          elseif msgcontains(msg, 'giant sword') or msgcontains(msg, 'huge chunk of crude iron') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You just swap '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemName(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'devil helmet') or msgcontains(msg, 'piece of hell steel') then
                    if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
                              doPlayerAddItem(cid, items.item3[2], counts.count3[2])
                              selfSay('You just swap '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..' for '.. counts.count3[2] ..' '.. getItemName(items.item3[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'dragon shield') or msgcontains(msg, 'piece of draconian steel') then
                    if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item4[2], counts.count4[2])
                              selfSay('You just swap '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..' for '.. counts.count4[2] ..' '.. getItemName(items.item4[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..'.', cid)
                    end
					 
					elseif msgcontains(msg, 'crown armor') or msgcontains(msg, 'piece of royal steel') then
                    if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
                              doPlayerAddItem(cid, items.item5[2], counts.count5[2])
                              selfSay('You just swap '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..' for '.. counts.count5[2] ..' '.. getItemName(items.item5[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..'.', cid)
                    end
					
					
          end
		  
          return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())