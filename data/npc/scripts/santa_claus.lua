local random_items = {
    {chance = 2, itemid = 13307}, -- sweet smelling bait
    {chance = 4, itemid = 13508}, -- slug drug
    {chance = 6, itemid = 5907}, -- slingshot
    {chance = 8, itemid = 9693}, -- jester doll
    {chance = 10, itemid = 5875}, -- sniper gloves
    {chance = 15, itemid = 2173}, -- amulet of loss
    {chance = 20, itemid = 2112}, -- teddy bear
    {chance = 25, itemid = 2644}, -- bunnyslippers
    {chance = 30, itemid = 6567}, -- santa doll
    {chance = 35, itemid = 13538}, -- bamboo leaves
    {chance = 40, itemid = 5890, count = 50}, -- chicken feather
    {chance = 45, itemid = 9971, count = 10}, -- gold ingot
    {chance = 50, itemid = 5879, count = 50}, -- spider silk
    {chance = 60, itemid = 5922, count = 50}, -- holy orchid
    {chance = 70, itemid = 5880, count = 50}, -- iron ore
    {chance = 80, itemid = 5878, count = 50}, -- minotaur leather
    {chance = 90, itemid = 2152, count = 100}, -- platinum coinc
    {chance = 100, itemid = 2153}, -- violet gem
    {chance = 150, itemid = 2156}, -- red gem
    {chance = 200, itemid = 2158}, -- blue gem
    {chance = 250, itemid = 2110}, -- doll
    {chance = 300, itemid = 11263}, -- santa backpack
    {chance = 350, itemid = 2114}, -- piggy bank
    {chance = 400, itemid = 2688, count = 10}, -- candy cane
    {chance = 450, itemid = 2111, count = 10}, -- snowball
    {chance = 500, itemid = 2114}, -- piggy bank
    {chance = 600, itemid = 2688, count = 10}, -- candy cane
    {chance = 700, itemid = 2111, count = 10} -- snowball
}

local random_noob_items = {
    {chance = 10, itemid = 5890, count = 25}, -- chicken feather
    {chance = 20, itemid = 9971, count = 1}, -- gold ingot
    {chance = 30, itemid = 5879, count = 5}, -- spider silk
    {chance = 40, itemid = 5922, count = 5}, -- holy orchid
    {chance = 50, itemid = 5880, count = 5}, -- iron ore
    {chance = 60, itemid = 5878, count = 10}, -- minotaur leather
    {chance = 70, itemid = 2152, count = 25}, -- platinum coinc
    {chance = 80, itemid = 2153}, -- violet gem
    {chance = 90, itemid = 2156}, -- red gem
    {chance = 125, itemid = 2158}, -- blue gem
    {chance = 150, itemid = 2110}, -- doll
    {chance = 175, itemid = 11263}, -- santa backpack
    {chance = 200, itemid = 2114}, -- piggy bank
    {chance = 225, itemid = 2688, count = 10}, -- candy cane
    {chance = 250, itemid = 2111, count = 10}, -- snowball
    {chance = 275, itemid = 2114}, -- piggy bank
    {chance = 300, itemid = 2688, count = 10}, -- candy cane
    {chance = 325, itemid = 2111, count = 10}, -- snowball
    {chance = 350, itemid = 2114}, -- piggy bank
    {chance = 375, itemid = 2688, count = 10}, -- candy cane
    {chance = 400, itemid = 2111, count = 10} -- snowball
}

     local keywordHandler = KeywordHandler:new()
     local npcHandler = NpcHandler:new(keywordHandler)
     NpcSystem.parseParameters(npcHandler)
     
     
     function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
     function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
     function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
     function onThink()                          npcHandler:onThink()                        end
     
     local voices = {
     { text = 'HO HO HO! MERRY CHRISTMAS', yell = true },
     { text = 'Hi there young ones, have you been good this year?' }
     }
     
     local PRESENT_STORAGE = SANTA_CLAUS_PRESENT
     
     function santaNPC(cid, message, keywords, present, node)
         if not npcHandler:isFocused(cid) then
             return false
         end
         if not present then
             npcHandler:say('Come back when you start behaving good.', cid)
             return true
         end
         local player = Player(cid)
         local item, reward = nil, {}

         if player:getLevel() < 20 then
            for i = 1, #random_noob_items do
                item = random_noob_items
                if math.random(1000) < item[i].chance then
                    reward.itemid  = item[i].itemid
                    reward.subType = item[i].count or 1
                    break
                end
            end
        else
            for i = 1, #random_items do
                item = random_items
                if math.random(1000) < item[i].chance then
                    reward.itemid  = item[i].itemid
                    reward.subType = item[i].count or 1
                    break
                end
            end
        end

         
         if player:getStorageValue(PRESENT_STORAGE) <= os.time() then
             player:addItem(reward.itemid, reward.subType)
             npcHandler:say("HO HO HO! You were good like a little dwarf this year!", cid)
             npcHandler:resetNpc()
             player:setStorageValue(PRESENT_STORAGE, os.time() + (24 * 60 * 60)) -- sets the next time for 1 day later than current time
             return true
          else
          npcHandler:say('You\'ve already received a present, come back tomorrow', cid)
         end
     end
     
     npcHandler:setMessage(MESSAGE_GREET, "Merry Christmas |PLAYERNAME|. I'm Santa Claus. I got {present}s for good children.")
     local node = keywordHandler:addKeyword({'present'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Were you good this year?'})
     node:addChildKeywordNode(KeywordNode:new({'yes'}, santaNPC, true))
     node:addChildKeywordNode(KeywordNode:new({'no'}, santaNPC, false))
     npcHandler:addModule(FocusModule:new())