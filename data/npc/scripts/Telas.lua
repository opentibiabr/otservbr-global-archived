local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if(msgcontains(msg, "farmine")) then
		if(player:getStorageValue(Storage.TheNewFrontier.Questline) == 15) then
			npcHandler:say("I have heard only little about this mine. I am a bit absorbed in my studies. But what does this mine have to do with me?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "reason")) then
		if(npcHandler.topic[cid] == 1) then
			if(player:getStorageValue(Storage.TheNewFrontier.BribeTelas) < 1) then
				npcHandler:say("Well it sounds like a good idea to test my golems in some real environment. I think it is acceptable to send some of them to Farmine.", cid)
				player:setStorageValue(Storage.TheNewFrontier.BribeTelas, 1)
				player:setStorageValue(Storage.TheNewFrontier.Mission05, player:getStorageValue(Storage.TheNewFrontier.Mission05) + 1) --Questlog, The New Frontier Quest "Mission 05: Getting Things Busy"
			end
		end
	end
	-- shadown of yalahar
	if(msgcontains(msg, 'mission')) and player:getStorageValue(Storage.ShadownofYalahar.QuestStart) < 1 then
		selfSay("My research on the creation of golems has progressed well so far. However, it is good to acknowledge the accomplishments of others in this science. ...", cid)
		selfSay("I am in contact with certain gifted individuals who have themselves gained significant insights into this subject. ...", cid)
		selfSay("I want you to contact them and ask them for their research notes. They should have the means to send them to me so you don't have to worry about picking up the papers and possibly losing them. ...", cid)
		selfSay("From our previous correspondence I'd say all of them are supportive but reaching some of them might prove troublesome. ...", cid)
		selfSay("I need the research notes from the technomancer Scutty of Kazordoon, the theoretical mago-scientist Milos of the Edron Academy. ...", cid)
		npcHandler:say("The field scientist Boveas, who can be found in Mintwalin, the druid Cerdras of Carlin and Dreadeye, a bonelord of the Braindeath Streak, who lives somewhere in the necropolis deep below Ab'Dendriel.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.QuestStart, 1)
		setPlayerStorageValue(cid, 82960, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 4) then
		selfSay("Ah, yes. I have received all the reports I need and have already been able to glance through them. ...", cid)
		selfSay("It will take some time to evaluate all those different approaches to the topic. Meanwhile, we can get on with the other tasks to advance our project. ...", cid)
		npcHandler:say("When you are ready, just ask me for your next mission.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 5)
		setPlayerStorageValue(cid, 82960, getPlayerStorageValue(cid, 82960) + 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 5) then
		selfSay("I hate to admit it, but I am still unable to create some of the necessary parts. Unfortunately, modern day technology just doesn't have the complexity to recreate the Yalaharian mago-mechanic cores. ...", cid)
		selfSay("However, I do need to find out whether my other components function properly, so for my first attempt, an existing core will have to do. Unfortunately, we can't just go to Yalahar and ask for one. ...", cid)
		selfSay("The Yalahari are not known for sharing their knowledge willingly. On the other hand, much of their machinery is not even used these days. ...", cid)
		selfSay("Can you search in their factory quarter for some of the cores? But, pay attention now! The cores are not that easy to get ...", cid)
		selfSay("According to my research, while the cores are being used, they are incredibly hot so you can't just remove one. Also, the Yalahari have added additional security and maintenance-friendly mechanisms. ...", cid)
		selfSay("In each machine that uses cores, they have installed what I would call cooler cannons. ...", cid)
		selfSay("The cannons can be used to cool overheated cores or cool down a normal core so it can be removed for maintenance. There are two drawbacks though. ...", cid)
		selfSay("First you need to hit the core with the cooler cannon when it reaches the correct temperature. ...", cid)
		selfSay("If you shoot too early it will be frozen in place and the system won't be able to remove it. ...", cid)
		selfSay("The second drawback is that the cannon uses enormous amounts of energy, so you can only fire it every few seconds and will have to wait until it is fully recharged. ...", cid)
		selfSay("If you hit the core while it is red hot it will cool down to room temperature and can be removed from the machine, but the system will replace it with another immediately. You should be able to get the cooled and inactive core from a nearby dispenser. ...", cid)
		npcHandler:say("As far as I can tell the core should remain inactive and do nothing funny like spontaneously overheat and fry you or something equally unpleasant.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 6)
		player:setStorageValue(Storage.ShadownofYalahar.doorFactory, 1)
		setPlayerStorageValue(cid, 82961, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 8) and getPlayerItemCount(cid, 10167) >= 1 then
		selfSay("Ah, a mago mechanic core. A true marvel of Yalahari science. One day, my friend, we will be able to build our own. ...", cid)
		selfSay("My understanding is growing daily. For now we will incorporate this core into our construction. ...", cid)
		npcHandler:say("You have proven yourself to be incredibly helpful. More missions await you.", cid)
		doPlayerRemoveItem(cid, 10167, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 9)
		setPlayerStorageValue(cid, 82961, 3) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 9) then
		selfSay("A golem's major power source is a mix of elemental forces. ...", cid)
		selfSay("Most of the elements need only a low concentration of purity but the earth component, which is the overriding element in a Yalaharian golem, requires a huge amount of very pure concentrate. ...", cid)
		selfSay("That is why crystals are often fused into the golem's body. ...", cid)
		selfSay("Could you get me some elemental crystals? Use an ordinary pick axe on a slain earth elemental. With some luck you will gain an elemental shard. ...", cid)
		npcHandler:say("Ten of them should be enough for me to create an elemental crystal.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 10)
		setPlayerStorageValue(cid, 82962, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 10) and getPlayerItemCount(cid, 10169) >= 10 then
		selfSay("So you have brought me all 10 shards for the core! That is one step further towards the construction of our very own golem! Without your help I would never have made it this far. ...", cid)
		npcHandler:say("I wish your next mission were less dangerous but sadly it isn't. But more about that when we talk about your next mission.", cid)
		doPlayerRemoveItem(cid, 10169, 10)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 11)
		setPlayerStorageValue(cid, 82962, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 11) then -- mission 04 start
		selfSay("I always find new things in the Yalaharian metallurgy to amaze me. In order to construct parts that are even remotely similar I had to spend a fortune and wait years for a dwarven smith to finish them. ...", cid)
		selfSay("Luckily, there is a much cheaper source for even better material: existing golems. There are quite a few running aimlessly through Yalahar and posing a threat to unwary travellers. ...", cid)
		selfSay("So by disabling those golems not only do we further our research but we also do something to clean up the city's golem problem! I'll lend you this golem-disassembler. ...", cid)
		selfSay("When you have killed a golem wait a moment until all of his systems shut down. Then use the disassembler on his corpse. ...", cid)
		selfSay("But, be careful! If you wait too long the parts will lose their charges and be worthless. ...", cid)
		npcHandler:say("Chances are that the disassembler will only produce scrap metal but now and then you'll get a golem part. I need six of them to make any progress in my work.", cid)
		doPlayerAddItem(cid, 10153, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 12)
		setPlayerStorageValue(cid, 82963, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 12) and getPlayerItemCount(cid, 10151) >= 6 then
		npcHandler:say("Ah, with your newest acquisition you have brought me 6 golem parts. With that we are done and can continue with your next mission.", cid)
		doPlayerRemoveItem(cid, 10151, 6)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 13)
		setPlayerStorageValue(cid, 82963, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 13) then -- mission 05 start
		selfSay("Well, this one is somewhat hard to explain. The power core of the golem needs some specific charges to make it work. The good news is that I have discovered the perfect carrier for the charge. ...", cid)
		selfSay("The bad news is, it's you! Well, let me elaborate: I need three different charges. ...", cid)
		selfSay("You can charge yourself by walking though a charge generator. One of these can be found in the alchemists' quarter. ...", cid)
		selfSay("Get yourself charged and return to me. I will suck the charge into one of my own inventions and can tell you if you carried one of the three charges we needed. ...", cid)
		selfSay("Unfortunately, the machine may charge you in two further ways to the three charges we actually need. The other two charges are of no use to our project. ...", cid)
		npcHandler:say("But, on the positive side, each charge that we don't need can be sold to other scientists and I am willing to share some gold with you for your efforts.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 14)
		player:setStorageValue(Storage.ShadownofYalahar.doorCharge, 1)
		setPlayerStorageValue(cid, 82964, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 15) then
		npcHandler:say("We are finished with collecting charges! Now we can proceed and your next mission awaits you!", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 16)
		setPlayerStorageValue(cid, 82964, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 16) then -- mission 06 start
		npcHandler:say("I need a blueprint of a golem to compare with my own plans. I need to figure out where problems might arise. Please search the factory quarter for some blueprints that I can use.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 17)
		player:setStorageValue(Storage.ShadownofYalahar.doorOut06, 1)
		setPlayerStorageValue(cid, 82965, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 17) and getPlayerItemCount(cid, 10165) >= 1 then
		npcHandler:say("Yes, you've got them! That will aid my understanding of the construction of a golem. But there is still a lot to do and new missions waiting.", cid)
		doPlayerRemoveItem(cid, 10165, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 18)
		setPlayerStorageValue(cid, 82965, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 18) then -- mission 07 start
		npcHandler:say("In order to understand a Yalaharian power core I have to disassemble one. I think there are still some old and burnt out power cores to be found in the alchemists' quarter of Yalahar. Please get me one, the state of the core is not that important.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 19)
		player:setStorageValue(Storage.ShadownofYalahar.doorPower07, 1)
		setPlayerStorageValue(cid, 82966, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 19) and getPlayerItemCount(cid, 10170) >= 1 then
		npcHandler:say("Phenomenal! That's precisely what we need. A bit tattered and rusty but it will do perfectly. While I am busy with this, you can get on with some other missions. ", cid)
		doPlayerRemoveItem(cid, 10170, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 20)
		setPlayerStorageValue(cid, 82966, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 20) then -- mission 08 start
		selfSay("I hope to save myself the effort of reinventing a stabilizer small enough to fit into the golem. I will have to get an original Yalahari stabilizer or be forced to create a four legged golem, which clearly won't do. ...", cid)
		npcHandler:say("Therefore, I need you to search the sunken quarter for a stabilizer.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 21)
		player:setStorageValue(Storage.ShadownofYalahar.doorStable08, 1)
		setPlayerStorageValue(cid, 82967, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 21) and getPlayerItemCount(cid, 10166) >= 1 then
		npcHandler:say("Phenomenal! You must have good eyesight to have spotted this little fellow. However, don't mind my mumbling. New missions await you.", cid)
		doPlayerRemoveItem(cid, 10166, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 22)
		setPlayerStorageValue(cid, 82967, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 22) then -- mission 09 start
		selfSay("While visiting Yalahar I discovered one of their libraries in the magicians' quarter. I solved the logic puzzle that prevented unwanted intruders and began to study their rituals. ...", cid)
		selfSay("I was THAT close to reconstructing the ritual when one of the Yalahari, Azerus, discovered me and had me thrown out of the city. I think all those guardian golems know me now and I can't show my face there any more ...", cid)
		selfSay("You, on the other hand, can! I will tell you how to open the puzzle lock so you can enter the library. ...", cid)
		selfSay("I fear that the Yalahari may have posted some Golems there as guards so you'll have to fight them to use the library undisturbed. Your mission is to reconstruct the ancient golem ritual from their books. ...", cid)
		selfSay("There are hints scattered throughout the books in the library. Be warned! Yalahari literature is not easy reading! You might get a headache, which will make you forget what you just read. ...", cid)
		selfSay("The chances of recreating the ritual are greater the more you read. On the other hand the more books you read the more likely it is that you'll get a headache and forget everything you have learned. ...", cid)
		selfSay("If you get a headache you will have to wait a minute or two for it to wear off before you can continue. There are rumors about headache pills on the black market, but I have no idea where to find one. ...", cid)
		npcHandler:say("When you feel ready to recreate the ritual use the scribe's desk in the center of the room. You'll know when you have been successful.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 23)
		player:setStorageValue(Storage.ShadownofYalahar.doorRitual09, 1)
		setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 24) then
		npcHandler:say("Impressive! To be honest, I feared a bit for your sanity, but you made it! And you are still healthy and sane! Well, at least I hope so. I fully understand if you want to take a few days off before you continue with your next mission.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 25)
		setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 25) then
		selfSay("Yalahari rituals are quite complicated and need certain reagents that are not readily available nowadays. I think I can come up with some substitutes for most of them though. ...", cid) 
		npcHandler:say("Specifically, three items need to be replaced. Are you ready for your first mission?", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 26)
		player:setStorageValue(Storage.ShadownofYalahar.doorFibula, 1)
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 27) and getPlayerItemCount(cid, 10157) >= 1 then
		npcHandler:say("My, this rotworm tooth looks old. But the older the better. It will certainly be sufficient for our ritual.", cid)
		doPlayerRemoveItem(cid, 10157, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 28)
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 28) then
		npcHandler:say("Are you up to your second assignment?", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 29)
		player:setStorageValue(Storage.ShadownofYalahar.doorCathedral, 1)
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 30) and getPlayerItemCount(cid, 10155) >= 1 then
		npcHandler:say("Ah, a perfect shadow orb! This is exactly what we need.", cid)
		doPlayerRemoveItem(cid, 10155, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 31)
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 31) then
		npcHandler:say("Ready for your third assignment?", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 32)
		player:setStorageValue(Storage.ShadownofYalahar.doorThorn, 1)
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 33) and getPlayerItemCount(cid, 10159) >= 1 then
		npcHandler:say("What a beautiful flower. A shame that we have to destroy it in the ritual.", cid)
		doPlayerRemoveItem(cid, 10159, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 34)
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 34) then
		npcHandler:say("Finally! You have brought all the ingredients we need! We can talk about your next mission whenever you like.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 35)
		setPlayerStorageValue(cid, 82969, 2) -- quest log
		npcHandler.topic[cid] = 0
	-- finish mission 10 -- start mission 11 --
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 35) then -- mission 11 start
		selfSay("I am disheartened. All my efforts to get this golem to function have been in vain! There is still something missing. Were I not a scientist I'd say it was the soul. ...", cid)
		selfSay("I can't get the brain patterns working and without that a golem is just a useless shell. ...", cid)
		selfSay("At the moment I would settle for some existing brain patterns but the golems that are still around seem to lack the sophisticated brain patterns needed to meld with my creation. There is one final hope though. ...", cid)
		selfSay("While I was doing my research in Yalahar I stumbled upon reports about a remote scientific outpost of the Yalahari. There they were experimenting with something they called MI, short for magical intelligence. ...", cid)
		selfSay("That should create some far more intelligent golems. I desperately need one of those golem's heads. The base has to be somewhere beneath the isle, nowadays is known as Fenrock. ...", cid)
		selfSay("Unfortunately, I believe that you have to be a Yalahari or a Yalaharian servant to enter the complex. ...", cid)
		selfSay("However, on the bright side, in the course of doing these missions you have been charged with Yalahari energy, read their mind twisting books and have come into contact with much of their technology. ...", cid)
		selfSay("Additionally, there are electric showers that were often used by Yalaharian scientists. I have found out that one of the few electric showers that are still working is somewhere in the factory quarter. ...", cid)
		selfSay("First, you will have to use it on yourself, then report back to me. I will use an ancient Yalahari device on you to amplify all the Yalahari characteristics you have acquired. ...", cid)
		npcHandler:say("Our only slim hope is that this might fool the system enough to allow you to enter the complex.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 36)
		player:setStorageValue(Storage.ShadownofYalahar.doorShower11, 1)
		setPlayerStorageValue(cid, 82970, 1) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 37) then
		npcHandler:say("Ah, yes. My instruments tell me you have taken the shower! Are you ready to receive the amplifying charge?", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 38)
		npcHandler.topic[cid] = 0
	-- finish mission 11 -- start mission 12 --
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 39) and getPlayerItemCount(cid, 10173) >= 1 then
		npcHandler:say("The head! You've got it! Incredible! Now we have everything we need! Give me a Tibian day to prepare everything for the activation process, then meet me here again.", cid)
		doPlayerRemoveItem(cid, 10173, 1)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 40)
		setPlayerStorageValue(cid, 82971, 2) -- quest log
		npcHandler.topic[cid] = 0
	elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 40) then
		selfSay("We have made it, my friend! We have everything we need to reconstruct a Yalaharian golem! This is a great day for science. ...", cid)
		selfSay("Without your help none of this would have been possible. We will both take our place in history soon. Meet me downstairs in my laboratory. ...", cid)
		npcHandler:say("The honour of activating the golem shall belong to you, my friend.", cid)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 41)
		player:setStorageValue(Storage.ShadownofYalahar.doorLast13, 1)
		setPlayerStorageValue(cid, 82972, 1) -- quest log
		npcHandler.topic[cid] = 0
	-- finish mission 12 --
	elseif(msgcontains(msg, "yes")) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 26) then
			npcHandler:say("I am convinced that the tooth from a long dead rotworm queen will make an apt replacement for one of the more exotic ingredients in the Yalahari ritual. The books in the Edron academy suggest that the most likely place to find one might be deeper Fibula.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, 27)
			setPlayerStorageValue(cid, 82969, 1) -- quest log
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 29) then
			selfSay("One of the components is a shadow orb. So far, I have had no luck acquiring one. I even tried one of my more dubious contacts but he refused, saying that he would only mess with the guys in the dark cathedral if he had a death wish'. ...", cid) 
			npcHandler:say("I think if you find this dark cathedral you might find a shadow orb.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, 30)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 32) then
			npcHandler:say("Some of the elves of Shadowthorn cultivate a plant known as bloodkiss. I need one sample for the ritual.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, 33)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 38) then
			npcHandler:say("It's done! I really hope that will be enough to enter the complex. It is probably somewhere in the underground of Fenrock. I have no idea what you might find there but look for a golem's head and bring it to me.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, 39)
			setPlayerStorageValue(cid, 82970, 2) -- quest log
			setPlayerStorageValue(cid, 82971, 1) -- quest log
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
