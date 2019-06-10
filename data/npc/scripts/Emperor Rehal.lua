 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Promotion
local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

-- Justice For All
local missionKeyword = keywordHandler:addKeyword({'nokmir'}, StdModule.say, {npcHandler = npcHandler, text = 'Oh well, I liked Nokmir. He used to be a good dwarf until that day on which he stole the ring from Rerun.'}, function(player) return player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 1 end)
	missionKeyword:addChildKeyword({'grombur'}, StdModule.say, {npcHandler = npcHandler, text = 'He\'s very ambitious and always volunteers for the long shifts.'}, nil, function(player) player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 2) end)

keywordHandler:addKeyword({'nokmir'}, StdModule.say, {npcHandler = npcHandler,
	text = {
		"Interesting. The fact that you have the ring means that Nokmir can't have stolen it. Combined with the information Grombur gave you, the case appears in a completely different light. ...",
		"Let there be justice for all. Nokmir is innocent and acquitted from all charges! And Rerun... I want him in prison for this malicious act!"
	}},
	function(player) return player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 4 and player:removeItem(14348, 1) end,
	function(player) player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 5) end
)

-- Royal Rescue
local missionKeyword = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = 'As you have proven yourself trustworthy I\'m going to assign you a special mission. Are you interested?'},
		function(player) return player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) < 1 end
	)

	missionKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler,
		text = {
			"Splendid! My son Rehon set off on an expedition to the deeper mines. He and a group of dwarfs were to search for new veins of crystal. Unfortunately they have been missing for 2 weeks now. ...",
			"Find my son and if he's alive bring him back. You will find a reactivated ore wagon tunnel at the entrance of the great citadel which leades to the deeper mines. If you encounter problems within the tunnel go ask Xorlosh, he can help you."
		}}, nil, function(player) player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 1) end
	)

local missionKeyword = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = 'My son was captured by trolls? Doesn\'t sound like him, but if you say so. Now you want a reward, huh? ...'}, function(player) return player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) == 5 end)
	missionKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'Look at these dwarven legs. They were forged years ago by a dwarf who was rather tall for our kind. I want you to have them. Thank you for rescuing my son |PLAYERNAME|.'},
		nil, function(player) player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 6) player:addItem(2504, 1) end
	)

npcHandler:addModule(FocusModule:new())
