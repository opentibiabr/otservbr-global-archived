local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
     npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
     npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
     npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
     npcHandler:onThink()
end

-- ID, Count, Price
local eventShopItems = {
     ["small stamina refill"] = {22473, 1, 100},
     ["zaoan chess box"] = {18339, 1, 100},
     ["pannier backpack"] = {19159, 1, 70},
     ["green light"] = {21217, 1, 70},
     ["blood herb"] = {3734, 3, 10},
     ["draken doll"] = {12044, 1, 70},
     ["bear doll"] = {3001, 1, 70}
}

local function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
          return false
     end

     local player = Player(cid)
     msg = string.lower(msg)
     if (msg == "event shop") then
          npcHandler:say("In our website enter in {Events} => {Events Shop}.", cid)
     end

     if (eventShopItems[msg]) then
          npcHandler.topic[cid] = 0
          local itemId, itemCount, itemPrice = eventShopItems[msg][1], eventShopItems[msg][2], eventShopItems[msg][3]
          if (player:getItemCount(14112) > 0) then
               npcHandler:say("You want buy {" ..msg.. "} for " ..itemPrice.. "x?", cid)
               npcHandler.topic[cid] = msg
          else
               npcHandler:say("You don't have " ..itemPrice.. " {Bar of Gold(s)}!", cid)
               return true
          end
     end

     if (eventShopItems[npcHandler.topic[cid]]) then
          local itemId, itemCount, itemPrice = eventShopItems[npcHandler.topic[cid]][1], eventShopItems[npcHandler.topic[cid]][2], eventShopItems[npcHandler.topic[cid]][3]
          if (msg == "no" or
               msg == "n�o") then
               npcHandler:say("So... what you want?", cid)
               npcHandler.topic[cid] = 0
          elseif (msg == "yes" or
                    msg == "sim") then
               if (player:getItemCount(14112) >= itemPrice) then
                    npcHandler:say("You bought {" ..npcHandler.topic[cid].."} " ..itemCount.. "x for " ..itemPrice.. " {Bar of Gold(s)}!", cid)
                    player:removeItem(14112, itemPrice)
                    player:addItem(itemId, itemCount)
               else
                    npcHandler:say("You don't have enough bar's.", cid)
                    return true
               end
          end
     end
end

local voices = { {text = 'Change your Bar of Gold\'s for Items here!'} }
npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
