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

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Name, id, price, count/charges
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1)
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "dress pattern") then
		if player:getStorageValue(Storage.postman.Mission06) == 3 then
			if npcHandler.topic[cid] < 1 then
				npcHandler:say("DRESS FLATTEN? WHO WANTS ME TO FLATTEN A DRESS?", cid)
				npcHandler.topic[cid] = 1
			elseif npcHandler.topic[cid] == 1 then
				npcHandler:say("A PRESS LANTERN? NEVER HEARD ABOUT IT!", cid)
				npcHandler.topic[cid] = 2
			elseif npcHandler.topic[cid] == 2 then
				npcHandler:say("CHESS? I DONT PLAY CHESS!", cid)
				npcHandler.topic[cid] = 3
			elseif npcHandler.topic[cid] == 3 then
				npcHandler:say("A PATTERN IN THIS MESS?? HEY DON'T INSULT MY MACHINEHALL!", cid)
				npcHandler.topic[cid] = 4
			elseif npcHandler.topic[cid] == 4 then
				npcHandler:say("AH YES! I WORKED ON THE DRESS PATTERN FOR THOSE UNIFORMS. STAINLESS TROUSERES, STEAM DRIVEN BOOTS! ANOTHERMARVEL TO BEHOLD! I'LL SENT A COPY TO KEVIN IMEDIATELY!", cid)
				player:setStorageValue(Storage.postman.Mission06, 4)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I HAVE NO TIME FOR A GAME!"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "WHERE SHOULD I HOP?"})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, text = "GODS, WHO NEEDS GODS, WHEN WE CAN BUILD THE CORRECT MACHINE FOR EVERY OCCASION?"})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, text = "BRING ME THE SCREWDRIVER OF KURIK AND I WILL REWARD YOU WITH A STEAMPOWERED SPIKESWORD!"})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "CAN'T TELL MUCH ABOUT IT. SELDOM GET OUT HERE, I AM A BUSY DWARF."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "ONE DAY I WILL CREATE A CLOCK FOR THE COLOSSUS."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, text = "WHAT HIVE?"})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, text = "NO. I DON'T NEED ANY SHELVES!"})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, text = "I COULDN'T CARE LESS ABOUT THEM."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "ONE DAY OUR MACHINES WILL CHANGE THE ARMY'S STRUCTURE DRASTICALLY, JAWOLL!"})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, text = "SUCH A FOOL, WITH SOME MORE RESOURCES, I COULD BUILD FOR HIM WAR MACHINES BEYOND HIS WILDEST DREAMS! <laughs insanely>"})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "OLD FASHIONED BUTTERKNIFE! IF THEY LET ME, I WOULD CREATE WEAPONS THAT LEVEL ENTIRE CITIES!"})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "I BET I COULD BUILD A MACHINE TO SHRED HIM INTO PIECES!"})
keywordHandler:addKeyword({'Kazordoon'}, StdModule.say, {npcHandler = npcHandler, text = "WHAT?"})
keywordHandler:addKeyword({'The Big Old One'}, StdModule.say, {npcHandler = npcHandler, text = "THIS IS THE NAME OF THIS MOUNTAIN!"})
keywordHandler:addKeyword({'Bezil', 'Nezil'}, StdModule.say, {npcHandler = npcHandler, text = "BEZIL AND NEZIL ARE RUNNING A SHOP."})
keywordHandler:addKeyword({'Duria'}, StdModule.say, {npcHandler = npcHandler, text = "KNIGHTS DO NOT HAVE THE BRAIN TO EVEN UNDERSTAND WHAT WE ARE OFFERING THEM."})
keywordHandler:addKeyword({'Etzel'}, StdModule.say, {npcHandler = npcHandler, text = "WHO NEEDS MAGIC? PAH!"})
keywordHandler:addKeyword({'Jimbin'}, StdModule.say, {npcHandler = npcHandler, text = "HIS BREWERY SAVED OUR DAY MORE THEN ONCE IN MANY WAYS."})
keywordHandler:addKeyword({'Kroox'}, StdModule.say, {npcHandler = npcHandler, text = "WE COULD TEACH HIM MUCH IF HE LISTENED."})
keywordHandler:addKeyword({'Maryza'}, StdModule.say, {npcHandler = npcHandler, text = "LOVELY, BUT PREDJUDICED AS MOST DWARFS ARE."})
keywordHandler:addKeyword({'Uzgod'}, StdModule.say, {npcHandler = npcHandler, text = "WE COULD MAKE FOR HIM MACHINES TO DO HIS WORK IN HALF THE TIME I BET."})
keywordHandler:addKeyword({'Kruzak'}, StdModule.say, {npcHandler = npcHandler, text = "AT LEAST HES SMART ENOUGH TO LEAVE US ALONE, SO THERES HOPE FOR HIM."})
keywordHandler:addKeyword({'Durin'}, StdModule.say, {npcHandler = npcHandler, text = "I AM SURE HE WOULD BE SMART ENOUGH TO SEE THE CHANCES WE PROVIDE FOR DWARFENHOOD."})
keywordHandler:addKeyword({'offering'}, StdModule.say, {npcHandler = npcHandler, text = "YES, THE MOST SOPHISTICATED ITEMS THEY BUY ARE CROSSBOWS."})
keywordHandler:addKeyword({'crossbow'}, StdModule.say, {npcHandler = npcHandler, text = "DO YOU WANT TO BUY A CROSSBOW FOR 1150 GOLD?"})
keywordHandler:addKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = "PERHAPS NEXT TIME."})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, text = "NICE RESOURCE FOR OUR MACHINES, BUT NO NEED TO MAKE A BIG DEAL ABOUT IT, JAWOLL!"})
keywordHandler:addKeyword({'earth'}, StdModule.say, {npcHandler = npcHandler, text = "SORRY, BUT JUST DUST AND MUD TO ME."})
keywordHandler:addKeyword({'geomancers'}, StdModule.say, {npcHandler = npcHandler, text = "OLD FOOLS, TO MUCH CONCERNED ABOUT TRADITION."})
keywordHandler:addKeyword({'technomancers'}, StdModule.say, {npcHandler = npcHandler, text = "WE ARE THE FUTURE. WE WILL BECOME A MAJOR POWER IN DWARFEN SOCIETY SOON! THEY WILL SEE, THEY WILL ALL SEE! <chuckles and rolls his eyes>"})
keywordHandler:addKeyword({'pyromancers'}, StdModule.say, {npcHandler = npcHandler, text = "OLD FOOLS, TO MUCH CONCERNED ABOUT TRADITION."})

npcHandler:setMessage(MESSAGE_GREET, "HIHOOOO |PLAYERNAME|! <waves his hands>")
npcHandler:setMessage(MESSAGE_FAREWELL, "YEAH, GO AWAY!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
