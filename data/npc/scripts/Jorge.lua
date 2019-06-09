 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item2 = {21400, 21466}, -- item1 item que será pedido e que será dado na primeira troca norseman doll
          item3 = {21400, 21467}, -- Abacus
		  item4 = {21400,  21468}, -- Key of Numerous Locks
		  item5 = {21400, 10719}, -- Friendship Amulet
		  item6 = {21400, 21470}, -- The Mexcalibur
		  item7 = {21400, 21471}, -- Orc's Jaw Shredder
		  item8 = {21400, 21472}, -- Frozen Heart
		  item9 = {21400, 24682}, -- Phoenix Statue
		  item10 = {21400, 18527}, -- Dragon Eye
		  item11 = {21400, 18551} -- Noble Sword

}
local counts = {
          count2 = {20, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count3 = {20, 1}, -- count2 quantidade que será pedido e que será dado na segunda troca
		  count4 = {20, 1}, -- count3 quantidade que será pedido e que será dado na segunda troca
		  count5 = {20, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count6 = {20, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count7 = {20, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count8 = {20, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count9 = {20, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count10 = {20, 1}, -- count4 quantidade que será pedido e que será dado na segunda troca
		  count11 = {20, 1} -- count4 quantidade que será pedido e que será dado na segunda troca

}

function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if  msgcontains(msg, 'norseman doll') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You just swap '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemName(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, 'abacus') then
                    if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
                              doPlayerAddItem(cid, items.item3[2], counts.count3[2])
                              selfSay('You just swap '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..' for '.. counts.count3[2] ..' '.. getItemName(items.item3[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, 'key of numerous locks') then
                    if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item4[2], counts.count4[2])
                              selfSay('You just swap '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..' for '.. counts.count4[2] ..' '.. getItemName(items.item4[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, 'friendship amulet') then
                   if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
                              doPlayerAddItem(cid, items.item5[2], counts.count5[2])
                              selfSay('You just swap '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..' for '.. counts.count5[2] ..' '.. getItemName(items.item5[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, 'the mexcalibur') then
                    if getPlayerItemCount(cid, items.item6[1]) >= counts.count6[1] then
                              doPlayerRemoveItem(cid, items.item6[1], counts.count6[1])
                              doPlayerAddItem(cid, items.item6[2], counts.count6[2])
                              selfSay('You just swap '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..' for '.. counts.count6[2] ..' '.. getItemName(items.item6[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, "orc's jaw shredder") then
                    if getPlayerItemCount(cid, items.item7[1]) >= counts.count7[1] then
                              doPlayerRemoveItem(cid, items.item7[1], counts.count7[1])
                              doPlayerAddItem(cid, items.item7[2], counts.count7[2])
                              selfSay('You just swap '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..' for '.. counts.count7[2] ..' '.. getItemName(items.item7[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, 'frozen heart') then
                    if getPlayerItemCount(cid, items.item8[1]) >= counts.count8[1] then
                              doPlayerRemoveItem(cid, items.item8[1], counts.count8[1])
                              doPlayerAddItem(cid, items.item8[2], counts.count8[2])
                              selfSay('You just swap '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..' for '.. counts.count8[2] ..' '.. getItemName(items.item8[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, 'phoenix statue') then
                    if getPlayerItemCount(cid, items.item9[1]) >= counts.count9[1] then
                              doPlayerRemoveItem(cid, items.item9[1], counts.count9[1])
                              doPlayerAddItem(cid, items.item9[2], counts.count9[2])
                              selfSay('You just swap '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..' for '.. counts.count9[2] ..' '.. getItemName(items.item9[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..'.', cid)
                    end

					-- Dolls
					elseif msgcontains(msg, 'dragon eye') then
                    if getPlayerItemCount(cid, items.item10[1]) >= counts.count10[1] then
                              doPlayerRemoveItem(cid, items.item10[1], counts.count10[1])
                              doPlayerAddItem(cid, items.item10[2], counts.count10[2])
                              selfSay('You just swap '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..' for '.. counts.count10[2] ..' '.. getItemName(items.item10[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..'.', cid)
                    end

					elseif msgcontains(msg, 'noble sword') then
                    if getPlayerItemCount(cid, items.item11[1]) >= counts.count11[1] then
                              doPlayerRemoveItem(cid, items.item11[1], counts.count11[1])
                              doPlayerAddItem(cid, items.item11[2], counts.count11[2])
                              selfSay('You just swap '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..' for '.. counts.count11[2] ..' '.. getItemName(items.item11[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..'.', cid)
                    end




          end

          return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
