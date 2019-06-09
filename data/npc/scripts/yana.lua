 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local tokenid = 25377

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	npcHandler.topic[cid] = 0
	return true
end



local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

		-- CHAT
	if msgcontains(msg, "information") and npcHandler.topic[cid] == 0 then
		npcHandler:say({"{Tokens} are small objects made of metal or other materials. You can use them to buy superior equipment from token traders like me.", "There are several ways to obtain the tokens I'm interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items."}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "worth") and npcHandler.topic[cid] == 0 then
		npcHandler:say({"Disrupt the Heart of Destruction, fell the World Devourer to prove your worth and you will be granted the power to imbue 'Powerful Strike', 'Powerful Void' and 'Powerful Vampirism'."}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "tokens") then
		npcHandler:say("If you have any {gold} tokens with you, let's have a look! Maybe I can offer you something in exchange.", cid)
		npcHandler.topic[cid] = 2
	elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "gold") then
		npcHandler:say({"Here are my deals. For 50 of your gold tokens, I sell the following weapons of destruction: I can offer you a one-handed weapon: {sword}, {axe} or {club}. ...", "You may also take a two-handed weapon: {slayer}, {chopper} or {hammer}. I also can offer you a {bow}, {crossbow}, {wand} or {rod}. Furthermore I trade {creature products}. What do you choose?"}, cid)
		npcHandler.topic[cid] = 3
	elseif npcHandler.topic[cid] == 3 and msgcontains(msg, "creature products") then
		npcHandler:say({"I have creature products for the imbuements {strike}, {vampirism} and {void}. Make your choice, please!"}, cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "gold") and npcHandler.topic[cid] == 0 then
		npcHandler:say({"Here are my deals. For 50 of your gold tokens, I sell the following weapons of destruction: I can offer you a one-handed weapon: {sword}, {axe} or {club}. ...", "You may also take a two-handed weapon: {slayer}, {chopper} or {hammer}. I also can offer you a {bow}, {crossbow}, {wand} or {rod}. Furthermore I trade {creature products}. What do you choose?"}, cid)
		npcHandler.topic[cid] = 3

		-- ARMAS
	elseif msgcontains(msg, "wand") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 35 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30692, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your wand of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "rod") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 35 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30693, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your rod of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "sword") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 50 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30684, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your blade of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "axe") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 50 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30686, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your axe of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "club") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 50 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30688, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your mace of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "slayer") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 70 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30685, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your slayer of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "chopper") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 70 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30687, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your chopper of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "hammer") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 70 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30689, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your hammer of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "bow") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 65 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30690, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your bow of destruction."}, cid)
		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end

	elseif msgcontains(msg, "crossbow") and npcHandler.topic[cid] == 3 then
	if player:getFreeCapacity() < 65 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 3
		return false
		end
	if player:getItemCount(25377) >= 50 then
	player:addItem(30691, 1)
	player:removeItem(25377, 50)
	npcHandler:say({"Very good. Here's your crossbow of destruction."}, cid)

		else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
		end

		-- CREATURE PRODUCTS
		-- STRIKE
		elseif npcHandler.topic[cid] == 4 and msgcontains(msg, "strike") then
		npcHandler:say({"You have chosen 'strike'. {Basic}, {intricate} or {powerful}?"}, cid)
		npcHandler.topic[cid] = 5
		elseif npcHandler.topic[cid] == 5 and msgcontains(msg, "powerful") then
		npcHandler:say({'The powerful bundle for the strike imbuement consists of 20 protective charms, 25 sabreteeth and 5 vexclaw talons. Would you like to buy it for 6 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 101 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 8
		elseif npcHandler.topic[cid] == 8 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 101 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 6 then
		player:addItem(12400, 20) -- Protective Charm
		player:addItem(11228, 25) -- Sabretooth
		player:addItem(25384, 5) -- Vexclaw Talon
		player:removeItem(25377, 6)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me six of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

		elseif npcHandler.topic[cid] == 5 and msgcontains(msg, "intricate") then
		npcHandler:say({'The intricate bundle for the strike imbuement consists of 20 protective charms and 25 sabreteeth. Would you like to buy it for 4 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 56 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 9
		elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 56 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 4 then
		player:addItem(12400, 20) -- Protective Charm
		player:addItem(11228, 25) -- Sabretooth
		player:removeItem(25377, 4)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me four of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

		elseif npcHandler.topic[cid] == 5 and msgcontains(msg, "basic") then
		npcHandler:say({'The basic bundle for the strike imbuement consists of 20 protective charms. Would you like to buy it for 2 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 24 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 10
		elseif npcHandler.topic[cid] == 10 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 24 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 2 then
		player:addItem(12400, 20) -- Protective Charm
		player:removeItem(25377, 2)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me two of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

		-- VAMPIRISM
		elseif npcHandler.topic[cid] == 4 and msgcontains(msg, "vampirism") then
		npcHandler:say({"You have chosen 'vampirism'. {Basic}, {intricate} or {powerful}?"}, cid)
		npcHandler.topic[cid] = 6
		elseif npcHandler.topic[cid] == 6 and msgcontains(msg, "basic") then
		npcHandler:say({'The basic bundle for the vampirism imbuement consists of 25 vampire teeth. Would you like to buy it for 2 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 12.5 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 11
		elseif npcHandler.topic[cid] == 11 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 12.5 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 2 then
		player:addItem(10602, 25) -- Vampire Teeth
		player:removeItem(25377, 2)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me two of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

		elseif npcHandler.topic[cid] == 6 and msgcontains(msg, "intricate") then
		npcHandler:say({'The intricate bundle for the vampirism imbuement consists of 25 vampire teeth and 15 bloody pincers. Would you like to buy it for 4 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 30.5 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 12
		elseif npcHandler.topic[cid] == 12 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 30.5 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 4 then
		player:addItem(10602, 25) -- Vampire Teeth
		player:addItem(10550, 15) -- Bloody Pincers
		player:removeItem(25377, 4)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me four of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

		elseif npcHandler.topic[cid] == 6 and msgcontains(msg, "powerful") then
		npcHandler:say({'The powerful bundle for the vampirism imbuement consists of 25 vampire teeth, 15 bloody pincers and 5 pieces of dead brain. Would you like to it for 6 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 37.1 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 13
		elseif npcHandler.topic[cid] == 13 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 37.1 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 6 then
		player:addItem(10602, 25) -- Vampire Teeth
		player:addItem(10550, 15) -- Bloody Pincers
		player:addItem(10580, 5) -- Piece of Dead Brain
		player:removeItem(25377, 6)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me six of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

			-- VOID
		elseif npcHandler.topic[cid] == 4 and msgcontains(msg, "void") then
		npcHandler:say({"You have chosen 'void'. {Basic}, {intricate} or {powerful}?"}, cid)
		npcHandler.topic[cid] = 7
		elseif npcHandler.topic[cid] == 7 and msgcontains(msg, "basic") then
		npcHandler:say({'The basic bundle for the void imbuement consists of 25 rope belts. Would you like to buy it for 2 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 24.25 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 14
		elseif npcHandler.topic[cid] == 14 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 24.25 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 2 then
		player:addItem(12448, 25) -- Rope Belt
		player:removeItem(25377, 2)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me two of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

		elseif npcHandler.topic[cid] == 7 and msgcontains(msg, "intricate") then
		npcHandler:say({'The intricate bundle for the void imbuement consists of 25 rope belts and 25 silencer claws. Would you like to buy it for 4 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 129.25 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 15
		elseif npcHandler.topic[cid] == 15 and msgcontains(msg, "yes") then
		if player:getFreeCapacity() < 129.25 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 4 then
		player:addItem(12448, 25) -- Rope Belt
		player:addItem(22534, 25) -- Silencer Claws
		player:removeItem(25377, 4)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me four of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end

		elseif npcHandler.topic[cid] == 7 and msgcontains(msg, "powerful") then
		npcHandler:say({'The powerful bundle for the void imbuement consists of 25 rope belts, 25 silencer claws and 5 grimeleech wings. Would you like to buy it for 6 gold tokens? ...',
		'Make sure that you have one free slot and that you can carry 171.75 oz in addition to that.'}, cid)
		npcHandler.topic[cid] = 16
		elseif npcHandler.topic[cid] == 16 and msgcontains(msg, "yes") then
	if player:getFreeCapacity() < 171.75 then
		npcHandler:say("You don\'t have enough cap.", cid)
		npcHandler.topic[cid] = 4
		return false
		end
		if player:getItemCount(25377) >= 6 then
		player:addItem(12448, 25) -- Rope Belt
		player:addItem(22534, 25) -- Silencer Claws
		player:addItem(25386, 5) -- Grimeleech Wings
		player:removeItem(25377, 6)
		npcHandler:say({"Very good. Here's your items."}, cid)
		npcHandler.topic[cid] = 4
			else
			npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me six of them and we'll make a trade.", cid)
			npcHandler.topic[cid] = 0
			end
		end
	return true
end



local voices = { {text = 'Trading tokens! First-class equipment available!'} }
npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
