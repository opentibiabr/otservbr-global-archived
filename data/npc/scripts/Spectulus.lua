local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'Precisely.' },
	{ text = 'So my initial calculations had been correct!' },
	{ text = 'Looks like I have to find another way then.' },
	{ text = 'Hm, I need to recapitulate my equipment...' }
}

npcHandler:addModule(VoiceModule:new(voices))

local function releasePlayer(cid)
	if not Player(cid) then
		return
	end

	npcHandler:releaseFocus(cid)
	npcHandler:resetNpc(cid)
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
 
	local player = Player(cid)
	
	if msgcontains(msg, 'research') then
		local qStorage = player:getStorageValue(Storage.spiritHuntersQuest.missionUm)
		local tombsStorage = player:getStorageValue(Storage.spiritHuntersQuest.tombsUse)
		if qStorage == -1 then 
			if npcHandler.topic[cid] == 17 then
				npcHandler:say({"Alright. Let\'s go. At first we need to find out more about ghosts in general. ...", "I still need more information and values to properly calibrate the magical orientation of orange and turquoise sparkle attractors which we will need to actually contain ghost-emissions. ...", "So are you in?"}, cid)
				npcHandler.topic[cid] = 18				
			else
				npcHandler:say({"I fine-tuned another set of devices. You are the lucky candidate to first lay eyes on some revolutionary new concepts. ...", "Are you ready to help science once again?"}, cid)
				npcHandler.topic[cid] = 12
			end
		elseif qStorage == 1 and tombsStorage >= 2 then
			npcHandler:say('You are back, how did the measurements go? Did you recognise anything of interest?', cid)	
			npcHandler.topic[cid] = 19
		elseif qStorage == 2 then			  
			npcHandler:say({"Alright, now that we have enough results, the analysing can start. While I do this, I will need you to test the magically enhanced cage Sinclair developed to contain spirits effectively. ...",
							"Take the spirit cage from him and use it on the essence of a common ghost. Its essence will then be sucked into the cage and we can study him right here in the safety of the academy walls."
						}, cid)
			npcHandler.topic[cid] = 0
		end				
	elseif msgcontains(msg, 'mission') then
		local cStorage = player:getStorageValue(Storage.SeaOfLightQuest.Questline)
		if cStorage == -1 then
			npcHandler:say('Alright, you look bright enough to fulfil my requests - at least you do not fall asleep while standing there. Ahem... I heard about a certain inventor who created a {magic device} to actually sail the {sea of light}. Will you help me find him?', cid)
			npcHandler.topic[cid] = 1
		elseif cStorage == 1 then
			npcHandler:say('You should find the beggar somewhere in Edron. Stay persistent, I\'m sure he knows more than he wants to tell us.', cid)
		elseif cStorage == 2 then
			if not player:removeItem(10613, 1) then
				npcHandler:say('o have you talked to the beggar? What did he tell you? Where are the plans...? Wh...? He did? He is? You\'ve already got the plans? Beautiful!! Amazing! Alright it will take some time to recapitulate these plans.', cid)
				return true
			end

			player:addExperience(400, true)
			player:setStorageValue(Storage.SeaOfLightQuest.Questline, 3)
			player:setStorageValue(Storage.SeaOfLightQuest.Mission1, 3)
			player:setStorageValue(Storage.SeaOfLightQuest.StudyTimer, os.time() + 1800)
			npcHandler:say('So have you talked to the beggar? What did he tell you? Where are the plans...? Wh...? He did? He is? You\'ve already got the plans? Beautiful!! Amazing! Alright it will take some time to recapitulate these plans.', cid)
			addEvent(releasePlayer, 1000, cid)
		elseif cStorage == 3 then
			local timeStorage = player:getStorageValue(Storage.SeaOfLightQuest.StudyTimer)
			if timeStorage > os.time() then
				npcHandler:say('It will take some time to work out the initial problem of the device. Come back when I\'ve found the component needed to finish it. Alright, B connects to D and another two nails marked with S go... hmmm.', cid)
			elseif timeStorage > 0 and timeStorage < os.time() then
				npcHandler:say('...connects to N942. Alright!! That\'s it! I just finished a prototype device! And it looks like I figured out the initial failure. A very special crystal is needed for the device to work. Aren\'t you as curious as me to know what went wrong?', cid)
				npcHandler.topic[cid] = 2
			end
		elseif cStorage == 4 then
			npcHandler:say('Did you enter the Lost Mines yet? They are west of Edron, close to the sea. You will also need a pick once you get to the crystal deposit.', cid)
		elseif cStorage == 5 then
			if player:getItemCount(10614) == 0 then
				npcHandler:say('Hm, so did you find a rare crystal? Show me... hey! That\'s not a rare crystal. What... where did you get that anyway? Please return to me with the right crystal.', cid)
				return true
			end

			player:addExperience(500, true)
			player:setStorageValue(Storage.SeaOfLightQuest.Questline, 6)
			player:setStorageValue(Storage.SeaOfLightQuest.Mission2, 3)
			npcHandler:say({
				'Did you find a rare crystal? Show me... Amazing, absolutely amazing. This crystal alone is worth a small fortune. Ahem, of course I\'m glad you brought it to me for further research instead of bringing it to a merchant. ...',
				'Please return here if you want to continue helping me with another mission.'
			}, cid)
			addEvent(releasePlayer, 1000, cid)
		elseif cStorage == 6 then
			npcHandler:say('Well, the only thing left to do would be to offer the crystal at the well of the collector. There must be a pedestal near the well, where you need to put your donation. Ha, do you think you could do that?', cid)
			npcHandler.topic[cid] = 5
		elseif cStorage == 7 then
			npcHandler:say('Found the well yet? Look on one of the ice isles near Carlin. I\'m perfectly sure that the well with the pedestal is located on one of them. And be careful with the carrying device, I only have this one prototype.', cid)
		elseif cStorage == 8 then
			npcHandler:say('So have you found the well and entered the lair? I hope you can find the {mirror crystal} in there. It is the only way to finish the {Lightboat}.', cid)
		elseif cStorage == 9 then
			if player:getItemCount(10616) == 0 then
				npcHandler:say('Put the mirror crystal into the special carrying device I gave you and bring it directly to me.', cid)
				return true
			end

			npcHandler:say('Do you have the mirror crystal? Unbelievable! Alright I will extract the crystal from the device myself, would you please give me the device with the crystal and step back?', cid)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, 'yes') then
		
		if npcHandler.topic[cid] == 1 then
			player:addExperience(100, true)
			player:setStorageValue(Storage.SeaOfLightQuest.Questline, 1)
			player:setStorageValue(Storage.SeaOfLightQuest.Mission1, 1)
			npcHandler:say({
				'That\'s the spirit! As time is of the essence, we should start right now. ...',
				'A beggar here in Edron brags about how smart he is and that he knows about a man who lost his sanity because of an experiment, but he won\'t tell anyone any details. Maybe he knows more.'
			}, cid)
			addEvent(releasePlayer, 1000, cid)
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('The device needs a special crystal. It\'s called {mirror crystal}. The inventor somehow damaged it - with fatal results. He had to give up, as no second crystal was left to try. I, however, know of another one... but are you up to the task?', cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say('One remaining mirror crystal is in the hands of a creature called the collector which collects all kinds of crystals. The only way to get access to its lair is to donate a very rare crystal to a secret well. I need you to get one, will you help me?', cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 then
			player:setStorageValue(Storage.SeaOfLightQuest.Questline, 4)
			player:setStorageValue(Storage.SeaOfLightQuest.Mission1, 4)
			player:setStorageValue(Storage.SeaOfLightQuest.Mission2, 1)
			player:addMapMark(Position(33103, 31811, 7), MAPMARK_CROSS, 'Lost Mines')
			npcHandler:say({
				'Alright, now listen. West of Edron, near the ocean, you\'ll find the Lost Mines. Go down there to recover one of its rare crystals. But beware, people say the mine workers who died there years ago in an horrible accident are still digging. ...',
				'I will mark the location of the mines on your map. Be careful when entering these muddy depths and don\'t forget that you will need a pick to gather the crystals.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then
			npcHandler:say('Good, because if you wouldn\'t do it... listen, this well is on one of the isles near Carlin. There you offer the crystal. Once you get access to its lair, find the collector and... convince it to give you the mirror crystal. Understood?', cid)
			npcHandler.topic[cid] = 6
		elseif npcHandler.topic[cid] == 6 then
			player:setStorageValue(Storage.SeaOfLightQuest.Questline, 7)
			player:setStorageValue(Storage.SeaOfLightQuest.Mission3, 1)
			player:addItem(10615, 1)
			npcHandler:say('To collect the unbelievably rare, practically unique mirror crystal, you will need to use this special carrying device I developed. If you find the crystal, use it to store it and transport it safely to me. There is no second one.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then
			if not player:removeItem(10616, 1) then
				npcHandler:say('', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:addItem(2145, 10)
			player:addItem(2154, 1)
			player:addExperience(1000, true)
			player:setStorageValue(Storage.SeaOfLightQuest.Mission3, 4)
			player:setStorageValue(Storage.SeaOfLightQuest.Questline, 10)
			npcHandler:say({
				'Ah yes, slowly, carefully, careful ...',
				'...and how shiny it is, almost there ...',
				'...now wh- no, NO, NOOO! It just ...',
				'...slipped. And cracked. Don\'t look at me like that ...',
				'...I need some time to get over this. What? Oh, yes you can take the remains if you like. Just get it out of my sight.'
			}, cid)
			addEvent(releasePlayer, 1000, cid)
		elseif npcHandler.topic[cid] == 12 then
			npcHandler:say('Of course you are. And here we go. I have to ask some questions first. One: You aint afraid of no ghost, right?', cid)
			npcHandler.topic[cid] = 13
		elseif npcHandler.topic[cid] == 13 then
			npcHandler:say('Good. Two: You know that ghosts exist and/or have found and/or defeated one or more of them?', cid)
			npcHandler.topic[cid] = 14
		elseif npcHandler.topic[cid] == 14 then
			npcHandler:say({"Alright. Let\'s see - yes. ...","Three: You can explain at least three of the following terms, infestations, collective apparitions, ectoplasmic segregations, ecto-magical field phenomena, neuro-speculative sub-conscious awareness of spirits, ghosts and/or ghasts."},cid)
			npcHandler.topic[cid] = 15
		elseif npcHandler.topic[cid] == 16 then
			npcHandler:say({"I recently teamed up with a fellow scientist and friend Sinclair, who is also more of an explorer than me, to combine our discoveries in the field of complex phenomena not that easily to describe just by today\'s state of magic. ...","Of course I am talking about ghosts. I know, I know. Hard to believe in those times of highly advanced magic we live in. Yet there are some things, we fail to explain. ...","And that is exactly where we come in! Oh, and you of course. We will not only explain them - we will \'remove\' them. Just tell me whenever you are ready to help us with our research."},cid)
			npcHandler.topic[cid] = 17
		elseif npcHandler.topic[cid] == 18 then
			npcHandler:say('Good. Take this wand - we call it a spirit meter - and go to the graveyard I have marked on your map and take a few measurements on the graves.', cid)
			player:setStorageValue(Storage.spiritHuntersQuest.missionUm, 1)
			player:addItem(12670, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 19 then
			npcHandler:say('Let me see the spirit meter. Hmmm... those are grave news you bring - uhm, you know what I mean. But this is awesome! Now I know for sure that the calibration is only some short bursts of magically enhanced energy away.', cid)
			player:addExperience(500, true)
			player:addItem(2152, 5)
			addEvent(releasePlayer, 1000, cid)
			player:setStorageValue(Storage.spiritHuntersQuest.missionUm, 2)
			npcHandler.topic[cid] = 0
		end
	
	elseif msgcontains(msg, 'collective apparitions') then
		local qStorage = player:getStorageValue(Storage.spiritHuntersQuest.missionUm)
		if qStorage == -1 then
			if npcHandler.topic[cid] == 15 then
				npcHandler:say('Ah well, let\'s forget about the scientific details - you will do just fine as long as you do exactly what I say. Ready for me to go on with your task?', cid)
				npcHandler.topic[cid] = 16
			end
		end
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Yes, maybe it was the right decision. Astronomical research is nothing for the faint-hearted.', cid)
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('Well, the... what? You... mean you\'re no longer interested? I see, well maybe I overestimated your spirit after all.', cid)
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say('Alright, alright. You\'ll never find out the true secrets of life with such attitude, hm.', cid)
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say('Come on, this is our only chance to finish the Lightboat.', cid)
		elseif npcHandler.topic[cid] == 5 then
			npcHandler:say('Thought so. Well, no reason to be ashamed. I\'ll have to find help elsewhere now, though.', cid)
		elseif npcHandler.topic[cid] == 6 then
			npcHandler:say('Come back if you made up your mind.', cid)
		elseif npcHandler.topic[cid] == 7 then
			npcHandler:say('Hmpf. *mumbles*', cid)
		end
		npcHandler.topic[cid] = 0
	
	end
	return true
end

keywordHandler:addKeyword({'device'}, StdModule.say, {npcHandler = npcHandler, text = 'I heard of a device which would allow man to sail the sea of light. I call it the {Lightboat}, probably the most important invention in our history. And I will not rest until I have found a way to put the plan of its inventor into action.'})
keywordHandler:addKeyword({'lightboat'}, StdModule.say, {npcHandler = npcHandler, text = 'I heard of a device which would allow man to sail the sea of light. I call it the {Lightboat}, probably the most important invention in our history. And I will not rest until I have found a way to put the plan of its inventor into action.'})
keywordHandler:addKeyword({'magic device'}, StdModule.say, {npcHandler = npcHandler, text = 'I heard of a device which would allow man to sail the sea of light. I call it the {Lightboat}, probably the most important invention in our history. And I will not rest until I have found a way to put the plan of its inventor into action.'})
keywordHandler:addKeyword({'sea of light'}, StdModule.say, {npcHandler = npcHandler, text = 'The sea of light is what I call the endless arrangement of shiny stars in the night sky. If we fail to complete the {magic device}, science will probably never uncover its secrets.'})
keywordHandler:addKeyword({'mirror crystal'}, StdModule.say, {npcHandler = npcHandler, text = 'I found the cause of the initial failure. A rare component, a mirror crystal was used to store magical energy. Miscalculations within the construction damaged this fragile power source. The unleashed energy must have been devastating.'})
keywordHandler:addKeyword({'lost mines'}, StdModule.say, {npcHandler = npcHandler, text = 'The people of Edron were digging there for minerals and gold. It seemed all that work was of no avail when they finally hit the motherlode. Gems, rare crystals and... water. So much that it flooded the whole system. And not a single soul escaped.'})
keywordHandler:addKeyword({'collector'}, StdModule.say, {npcHandler = npcHandler, text = 'I heard rumours of a fabled creature whose traces were found on an island near Carlin. It lives solely to collect all kinds of rare gems, crystals and minerals. Offering an item it does not already own, reportedly allows passage into its lair.'})

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! You're late, do you have no concept of time? My mission is of utmost importance. If you are not interested in helping me, you might as well just leave.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yes yes. Goodbye |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Yes yes. Goodbye |PLAYERNAME|.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
