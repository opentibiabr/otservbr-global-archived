 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

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

local normalItems = {
     {7439, 7440, 7443},
     {3599, 6507},
     {3599, 6508},
     {3599, 6506},
     {3599, 2995},
     {3599, 2992},
     {3051, 3097, 3098},
     {10310},
     {3039},
     {3036}
}

local semiRareItems = {
     {3057},
     {9040},
     {9058},
     {5080}
}

local rareItems = {
     {2991},
     {5919},
     {6567},
     {10338},
     {10339},
     {6566},
     {2993},
}

local veryRareItems = {
     {3570},
     {3001},
     {3553},
     {9604},
     {5804}
}

local function getReward()
     local rewardTable = {}
     local random = math.random(100)
     if (random <= 90) then
          rewardTable = normalItems
     elseif (random <= 70) then
          rewardTable = semiRareItems
     elseif (random <= 30) then
          rewardTable = rareItems
     elseif (random <= 10) then
          rewardTable = veryRareItems
     end

     local rewardItem = rewardTable[math.random(#rewardTable)]
     return rewardItem
end

function creatureSayCallback(cid, type, msg)
     if(not npcHandler:isFocused(cid)) then
          return false
     end
     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

     if msgcontains(msg, 'present') then
          local player = Player(cid)
          if (player:getStorageValue(840293) == 1) then
               npcHandler:say("You can't get other present.", cid)
               return false
          end

 --         if (player:getLevel() < 150) then
 --              npcHandler:say("You need level 150 to get a present.", cid)
 --              return false
 --         end

          local reward = getReward()
          local cont = Container(Player(cid):addItem(6510):getUniqueId())
          local count = 1

          for i = 1, #reward do
               if (reward[i] == 2992 or
                   reward[i] == 3599) then
                    count = 10
               end

               cont:addItem(reward[i], count)
          end

          player:setStorageValue(840293, 1)
          npcHandler:say("Merry Christmas!", cid)
     end

     return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
