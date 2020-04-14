local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "eleonore") then
		if player:getStorageValue(Storage.TheShatteredIsles.APoemForTheMermaid) < 1 then
			npcHandler:say("Eleonore ... Yes, I remember her... vaguely. She is a pretty girl ... but still only a girl and now I am in love with a beautiful and passionate woman. A true {mermaid} even.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.TheShatteredIsles.APoemForTheMermaid) < 1 then
			npcHandler:say("Don't ask about silly missions. All I can think about is this lovely {mermaid}.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "mermaid") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("The mermaid is the most beautiful creature I have ever met. She is so wonderful. It was some kind of magic as we first met. A look in her eyes and I suddenly knew there would be never again another woman in my life but her.", cid)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.TheShatteredIsles.APoemForTheMermaid, 1)
		end
	end
	
	-- MERIANA QUEST
	if msgcontains(msg, "mermaid") then
		if player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 1 then
		npcHandler:say("I am deeply ashamed that I lacked the willpower to resist her spell. Thank you for your help in that matter. Now my head is once more free to think about our mission.", cid)
		player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 2)
		npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 2 then
			npcHandler:say("Ask around in the settlement where you can help out. If you have proven your worth I might have some missions for you.", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 3)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 19) then
			selfSay("Indeed, I could use some help. The evil pirates of Nargor have convinced an alchemist from Edron to supply them with a substance called Fafnar's Fire ...", cid)
			selfSay("It can burn even on water and is a threat to us all. I need you to travel to Edron and pretend to the alchemist Sandra that you are the one whom the other pirates sent to get the fire ...", cid)
			npcHandler:say("When she asks for a payment, tell her 'Your continued existence is payment enough'. That should enrage any member of the Edron academy enough to refuse any further deals with the pirates.", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 20)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 21) then
			npcHandler:say("I think that means 'mission accomplished'. Hehe. I guess that will put an end to their efforts to buy any alchemical substance from Edron.", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 22)
			npcHandler.topic[cid] = 0 --FINAL DA FAFNAR FIRE
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 22) then
			selfSay("The mission on which I will send you is vital to our cause. It is a sabotage mission. Nargor is guarded by several heavy catapults", cid)
			selfSay("I need you to sabotage the most dangerous of those catapults which can be found right in their harbour, aiming at ships passing by the entrance. ...", cid)
			selfSay("Get a fire bug - you can buy them in Liberty Bay - and set this catapult on fire. ...", cid)
			selfSay("Make sure to use the bug on the left part of the catapult where its lever is. That is where it's most vulnerable. ...", cid)
			selfSay("If you see a short explosion, you will know that it worked. I will tell Sebastian to bring you to Nargor, but beware. ...", cid)
			selfSay("Of course, he can't drop you off directly in the pirate's base. However, we have discovered a secret way into the Howling Grotto. ...", cid)
			npcHandler:say("Try to make your way through the caves of Nargor to reach their harbour. This is where you will find the catapult in question.", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 23)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 23) then
			selfSay("Sail with Sebastian to Nargor and make your way to the pirate's harbour. Once arrived there, find the catapult and use a fire bug on the left part. ...", cid)
			npcHandler:say("A small explosion will show you that you have succeeded. Afterwards, report to me about your mission. Good luck!", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 24)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 25) then
			npcHandler:say("You did it! Excellent!", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 26)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 26) and player:getStorageValue(Storage.TheShatteredIsles.TortoiseEgg) == 2 then
			selfSay("If you manage to accomplish this vital mission you will prove yourself to be a worthy member of our community. Imight even grant you your own ship and pirate clothing! ...", cid)
			selfSay("So listen to the first step of my plan. I want you to infiltrate their base. Try to enter their tavern, which meansthat you have to get past the guard. ...", cid)
			selfSay("You will probably have to deceive him somehow, so that he thinks you are one of them. ...", cid)
			selfSay("In the tavern, the pirates feel safe and plan their next strikes. Study ALL of their maps and plans lying around ...", cid)
			npcHandler:say("Afterwards, return here and report to me about your mission.", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 27)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 28) then
			selfSay("Well done, my friend. That will help us a lot. Of course there are other things to be done though. ...", cid)
			selfSay("I learned that Klaus, the owner of the tavern, wants me dead. He is offering any of those pirates a mission to kill me....", cid)
			selfSay("If we could convince him that you fulfilled that mission, the pirates will have the party of their lives. This would beour chance for a sneak attack to damage their boats and steal their plunder! ...", cid)
			npcHandler:say("Obtain this mission from him and learn what he needs as a proof. Then return to me and report to me about yourmission so we can formulate an appropriate plan.", cid)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 29)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 30) then
			npcHandler:say("My pillow?? They know me all too well... <sigh> I've owned it since my childhood. However. Here, take it and convincehim that I am dead.", cid)
			player:addItem(11427, 1)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 31)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 32) then
			selfSay("Incredible! You did what no other did even dare to think about! You are indeed a true hero to our cause ...", cid)
			selfSay("Sadly I have no ship that lacks a captain, else you would of course be our first choice. I am still true to my word asbest as I am able. ...", cid)
			npcHandler:say("So take this as your very own ship. Oh, and remind me about the {pirate outfit} sometime.", cid)
			player:addItem(2113, 1)
			player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 33)
			npcHandler.topic[cid] = 0
		end
		elseif msgcontains(msg, "pirate outfit") then
			if player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) == 33 then
			npcHandler:say("Ah, right! The pirate outfit! Here you go, now you are truly one of us.", cid)
			player:addOutfit(151)
			player:addOutfit(155)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted. Is there anything I can {do for you}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oh well.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
