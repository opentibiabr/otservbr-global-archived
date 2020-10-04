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

local items = {
     ['magic'] = {
          ['ice'] = 25193,
          ['fire'] = 25190,
          ['earth'] = 25191,
          ['energy'] = 25192,
     },
     ['magic level'] = {
          ['ice'] = 25193,
          ['fire'] = 25190,
          ['earth'] = 25191,
          ['energy'] = 25192,
     },
     ['sword'] = {
          ['ice'] = 25183,
          ['fire'] = 25174,
          ['earth'] = 25177,
          ['energy'] = 25180,
     },
     ['axe'] = {
          ['ice'] = 25184,
          ['fire'] = 25175,
          ['earth'] = 25178,
          ['energy'] = 25181,
     },
     ['club'] = {
          ['ice'] = 25185,
          ['fire'] = 25176,
          ['earth'] = 25179,
          ['energy'] = 25182,
     },
     ['distance'] = {
          ['ice'] = 25189,
          ['fire'] = 25186,
          ['earth'] = 25187,
          ['energy'] = 25188,
     },
     ['Charge'] = {
          ['pendulet'] = {noChargeID = 34067, ChargeID = 34983},
          ['sleep shawl'] = {noChargeID = 34066, ChargeID = 34981},
          ['blister ring'] = {noChargeID = 36392, ChargeID = 36456},
          ['theurgic amulet'] = {noChargeID = 35236, ChargeID = 35238},
          ['ring of souls'] = {noChargeID = 37456, ChargeID = 37471}
     }
}

local skillChoice = {}

local function greetCallback(cid)
    skillChoice[cid] = nil
    return true
end

local voices = {
	{ text = 'Trading tokens! First-class bargains!' },
	{ text = 'Bespoke armor for all vocations! For the cost of some tokens only!' },
	{ text = 'Tokens! Bring your tokens!' }
}

npcHandler:addModule(VoiceModule:new(voices))

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
               return false
     end

     local player = Player(cid)
     if not player then
          return false
     end

     if msgcontains(msg, 'tokens') then
          npcHandler:say("If you have any {silver} tokens with you, let's have a look! Maybe I can offer you something in exchange.", cid)
     elseif msgcontains(msg, 'information') then
          npcHandler:say("With pleasure. <bows> I trade {tokens}. There are several ways to obtain the tokens I am interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items.", cid)
     elseif msgcontains(msg, 'talk') then
          npcHandler:say({"Why, certainly! I'm always up for some small talk. ...",
                         "The weather continues just fine here, don't you think? Just the day for a little walk around the town! ...",
                         "Actually, I haven't been around much yet, but I'm looking forward to exploring the city once I've finished trading {tokens}."}, cid)
     elseif msgcontains(msg, 'silver') then
          npcHandler:say({"Here's the deal, " .. player:getName() .. ". For 100 of your silver tokens, I can offer you some first-class torso armor. These armors provide a solid boost to your main attack skill, as well as ...",
                         "some elemental protection of your choice! So, which skill type are you most interested in: {sword}, {axe}, {club}, {distance} or {magic level}?",
                         "Additionally I sell both {addons} for the Rift Outfit or I can {enchant} certain items for you."}, cid)
          npcHandler.topic[cid] = 1
     elseif msgcontains(msg, 'enchant') then
          npcHandler:say("The following items can be enchanted: {pendulet}, {sleep shawl}, {blister ring}, {theurgic amulet}. Make you choice!", cid)
          npcHandler.topic[cid] = 3
     elseif isInArray({'pendulet', 'sleep shawl', 'blister ring', 'theurgic amulet'}, msg:lower()) and npcHandler.topic[cid] == 3 then
               local charge = msg:lower()
               if not items['Charge'][charge] then
                    return false
               else
                    if (player:getItemCount(25172) >= 2) and (player:getItemCount(items['Charge'][charge].noChargeID) >= 1) then
                         player:removeItem(25172, 2)
                         player:removeItem(items['Charge'][charge].noChargeID, 1)
                         local itemAdd = player:addItem(items['Charge'][charge].ChargeID, 1)
                         npcHandler:say("Ah, excellent. Here is your " .. itemAdd:getName():lower() .. ".", cid)
                    else
                         npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough tokens and it's a deal.", cid)
                    end
                    npcHandler.topic[cid] = 0
			   end
     elseif msgcontains(msg, 'addon') then
		if player:hasOutfit(846, 0) or player:hasOutfit(845, 0) then
		  npcHandler:say("Ah, very good. Now choose your addon: {first} or {second}.", cid)
          npcHandler.topic[cid] = 4
	 else
		  npcHandler:say("Sorry, friend, but one good turn deserves another. You need to obtain the rift warrior outfit first.", cid)	 
	 end
     elseif isInArray({'first', 'second'}, msg:lower()) and npcHandler.topic[cid] == 4 then
		if msg:lower() == 'first' then
			if not(player:hasOutfit(846, 1)) and not(player:hasOutfit(845, 1)) then
				if player:removeItem(25172, 100) then
					npcHandler:say("Ah, excellent. Obtain the first addon for your rift warrior outfit.", cid)
					player:addOutfitAddon(846, 1)
					player:addOutfitAddon(845, 1)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")			
					end
				else
                    npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough tokens and it's a deal.", cid)				
				end				
			else
				npcHandler:say("Sorry, friend, you already have the first Rift Warrior addon.", cid)			
			end
		elseif msg:lower() == 'second' then
			if not(player:hasOutfit(846, 2)) and not(player:hasOutfit(845, 2)) then
				if player:removeItem(25172, 100) then
					npcHandler:say("Ah, excellent. Obtain the second addon for your rift warrior outfit.", cid)
					player:addOutfitAddon(846, 2)
					player:addOutfitAddon(845, 2)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")			
					end
				else
                    npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough tokens and it's a deal.", cid)				
				end				
			else
				npcHandler:say("Sorry, friend, you already have the second Rift Warrior addon.", cid)
			end		
		end
		npcHandler.topic[cid] = 0
     elseif isInArray({'sword', 'axe', 'club', 'distance', 'magic', 'magic level'}, msg:lower()) then
          if npcHandler.topic[cid] == 1 then
               local skill = msg:lower()
               if not items[skill] then
                    return false
               else
                    skillChoice[cid] = skill
                    npcHandler:say("Ah, very good. Now choose an element against which this armor will provide additional protection: {fire}, {earth}, {energy} or {ice}.", cid)
                    npcHandler.topic[cid] = 2
               end
          end
     elseif isInArray({'fire', 'earth', 'energy', 'ice'}, msg:lower()) then
          if npcHandler.topic[cid] == 2 then
               local element = msg:lower()
               if not items[skillChoice[cid]][element] then
                    return false
               else
                    if player:removeItem(25172, 100) then
                         local itemAdd = player:addItem(items[skillChoice[cid]][element], 1)
                         npcHandler:say("Ah, excellent. Here is your " .. itemAdd:getName():lower() .. ".", cid)
                    else
                         npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough tokens and it's a deal.", cid)
                    end
                    skillChoice[cid] = nil
                    npcHandler.topic[cid] = 0
               end
          end
     end
    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
