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

local items = {
     [1] = {name = "Abacus", id = 19151},
     [2] = {name = "Assassin Doll", id = 28897},
     [3] = {name = "Bag of Oriental Spices", id = 10817},
     [4] = {name = "Bookworm Doll", id = 18343},
     [5] = {name = "Cateroides Doll", id = 22151},
     [6] = {name = "Doll of Durin the Almighty", id = 14764},
     [7] = {name = "Dragon Eye", id = 22027},
     [8] = {name = "Dragon Goblet", id = 31265},
     [9] = {name = "Draken Doll", id = 12043},
     [10] = {name = "Encyclopedia", id = 8149},
     [11] = {name = "Friendship Amulet", id = 19153},
     [12] = {name = "Frozen Heart", id = 19156},
     [13] = {name = "Golden Falcon", id = 28896},
     [14] = {name = "Golden Newspaper", id = 8153},
     [15] = {name = "Hand Puppets", id = 9189},
     [16] = {name = "Imortus", id = 12811},
     [17] = {name = "Jade Amulet", id = 31268},
     [18] = {name = "Key of Numerous Locks", id = 19152},
     [19] = {name = "Loremaster Doll", id = 31267},
     [20] = {name = "Mathmaster Shield", id = 14760},
     [21] = {name = "Medusa Skull", id = 14762},
     [22] = {name = "Music Box", id = 12045},
     [23] = {name = "Noble Sword", id = 16276},
     [24] = {name = "Norsemal Doll", id = 19150},
     [25] = {name = "Old Radio", id = 12813},
     [26] = {name = "Orcs Jaw Shredder", id = 19155},
     [27] = {name = "Pigeon Trophy", id = 31266},
     [28] = {name = "Phoenix Statue", id = 22026},
     [29] = {name = "The Mexcalibur", id = 19154},
     [30] = {name = "TibiaHispano Emblem", id = 25980},
     [31] = {name = "Goromaphone", id = 34210}
}

local function greetCallback(cid)
    return true
end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if msg then
        for i = 1, #items do
          if msgcontains(msg, items[i].name) then
                if getPlayerItemCount(cid, 19083) >= 20 then
                    doPlayerRemoveItem(cid, 19083, 20)
                    doPlayerAddItem(cid, items[i].id, 1)
                    selfSay('You just swapped 20 silver raid tokens for 1 '.. getItemName(items[i].name) ..'.', cid)
                else
                    selfSay('You need 20 silver raid tokens.', cid)
                end
            end
        end
    end
    return true
end

local function onAddFocus(cid)
end

local function onReleaseFocus(cid)
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
