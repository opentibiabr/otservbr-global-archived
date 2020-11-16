	local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local tokenId = 25377

local info = {
	weapons = {
		['sword'] = {id = 30684, value = 50},
		['axe'] = {id = 30686, value = 50},
		['club'] = {id = 30688, value = 50},
		['slayer'] = {id = 30685, value = 50},
		['chopper'] = {id = 30687, value = 50},
		['hammer'] = {id = 30689, value = 50},
		['bow'] = {id = 30690, value = 50},
		['crossbow'] = {id = 30691, value = 50},
		['wand'] = {id = 30692, value = 50},
		['rod'] = {id = 30693, value = 50}
	},
	products = {
		['strike'] = {
			['basic'] =  {
				text = "The basic bundle for the strike imbuement consists of 20 protective charms. Would you like to buy it for 2 gold tokens?",
				itens = {
					[1] = {id = 12400, amount = 20}
				},
				value = 2
			},
			['intricate'] =  {
				text = "The intricate bundle for the strike imbuement consists of 20 protective charms and 25 sabreteeth. Would you like to buy it for 4 gold tokens?",
				itens = {
					[1] = {id = 12400, amount = 20},
					[2] = {id = 11228, amount = 25}
				},
				value = 4
			},
			['powerful'] = {
				text = "The powerful bundle for the strike imbuement consists of 20 protective charms, 25 sabreteeth and 5 vexclaw talons. Would you like to buy it for 6 gold tokens?",
				itens = {
					[1] = {id = 12400, amount = 20},
					[2] = {id = 11228, amount = 25},
					[3] = {id = 25384, amount = 5}
				},
				value = 6
			}
		},
		['vampirism'] = {
			['basic'] =  {
				text = "The basic bundle for the vampirism imbuement consists of 25 vampire teeth. Would you like to buy it for 2 gold tokens?",
				itens = {
					[1] = {id = 10602, amount = 25}
				},
				value = 2
			},
			['intricate'] =  {
				text = "The intricate bundle for the strike imbuement consists of 20 protective charms and 25 sabreteeth. Would you like to buy it for 4 gold tokens?",
				itens = {
					[1] = {id = 10602, amount = 25},
					[2] = {id = 10550, amount = 15}
				},
				value = 4
			},
			['powerful'] = {
				text = "The powerful bundle for the vampirism imbuement consists of 25 vampire teeth, 15 bloody pincers and 5 pieces of dead brain. Would you like to it for 6 gold tokens?",
				itens = {
					[1] = {id = 10602, amount = 25},
					[2] = {id = 10550, amount = 15},
					[3] = {id = 10580, amount = 5}
				},
				value = 6
			}
		},
		['void'] = {
			['basic'] =  {
				text = "The basic bundle for the void imbuement consists of 25 rope belts. Would you like to buy it for 2 gold tokens?",
				itens = {
					[1] = {id = 12448, amount = 25}
				},
				value = 2,
			},
			['intricate'] =  {
				text = "The intricate bundle for the void imbuement consists of 25 rope belts and 25 silencer claws. Would you like to buy it for 4 gold tokens?.",
				itens = {
					[1] = {id = 12448, amount = 25},
					[2] = {id = 22534, amount = 25}
				},
				value = 4,
			},
			['powerful'] = {
				text = "The powerful bundle for the void imbuement consists of 25 rope belts, 25 silencer claws and 5 grimeleech wings. Would you like to buy it for 6 gold tokens?",
				itens = {
					[1] = {id = 12448, amount = 25},
					[2] = {id = 22534, amount = 25},
					[3] = {id = 25386, amount = 5}
				},
				value = 6,
			}
		},

	}
}

local answerType = {}
local answerLevel = {}

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

local function greetCallback(cid)
	npcHandler.topic[cid] = 0
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "information") then
		npcHandler:say({"{Tokens} are small objects made of metal or other materials. You can use them to buy superior equipment from token traders like me.", "There are several ways to obtain the tokens I'm interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items."}, cid)
	elseif msgcontains(msg, "worth") then
		npcHandler:say({"Disrupt the Heart of Destruction, fell the World Devourer to prove your worth and you will be granted the power to imbue 'Powerful Strike', 'Powerful Void' and 'Powerful Vampirism'."}, cid)
	elseif msgcontains(msg, "tokens") then
		npcHandler:say("If you have any {gold} tokens with you, let's have a look! Maybe I can offer you something in exchange.", cid)
	elseif msgcontains(msg, "gold") then
		npcHandler:say({"Here are my deals. For 50 of your gold tokens, I sell the following weapons of destruction: I can offer you a one-handed weapon: {sword}, {axe} or {club}. ...",
		"You may also take a two-handed weapon: {slayer}, {chopper} or {hammer}. I also can offer you a {bow}, {crossbow}, {wand} or {rod}. Furthermore I trade {creature products}. What do you choose?"}, cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "creature products") then
		npcHandler:say({"I have creature products for the imbuements {strike}, {vampirism} and {void}. Make your choice, please!"}, cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "gold") then
		npcHandler:say({"Here are my deals. For 50 of your gold tokens, I sell the following weapons of destruction: I can offer you a one-handed weapon: {sword}, {axe} or {club}. ...",
		"You may also take a two-handed weapon: {slayer}, {chopper} or {hammer}. I also can offer you a {bow}, {crossbow}, {wand} or {rod}. Furthermore I trade {creature products}. What do you choose?"}, cid)
	elseif npcHandler.topic[cid] == 2 then
		local weapon = info.weapons[msg:lower()]
		if weapon then
			if player:getFreeCapacity() > ItemType(weapon.id):getWeight() then
				if player:getItemCount(tokenId) >= weapon.value then
					player:addItem(weapon.id, 1)
					player:removeItem(tokenId, weapon.value)
					npcHandler:say({"Very good. Here's your "..ItemType(weapon.id):getName().."."}, cid)
				else
					npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me fifty of them and we'll make a trade.", cid)
				end
			else
				npcHandler:say("You don\'t have enough cap.", cid)
			end
		end
	elseif npcHandler.topic[cid] == 3 then
		local imbueType = info.products[msg:lower()]
		if imbueType then
			npcHandler:say({"You have chosen "..msg..". {Basic}, {intricate} or {powerful}?"}, cid)
			answerType[cid] = msg
			npcHandler.topic[cid] = 4
		end
	elseif npcHandler.topic[cid] == 4 then
		local imbueLevel = info.products[answerType[cid]][msg:lower()]
		if imbueLevel then
			npcHandler:say({imbueLevel.text}, cid)
			answerLevel[cid] = msg
			npcHandler.topic[cid] = 5
		end
	elseif npcHandler.topic[cid] == 5 then
		if msgcontains(msg, "yes") then
			local neededCap = 0
			for i = 1, #info.products[answerType[cid]][answerLevel[cid]].itens do
				neededCap = neededCap + ItemType(info.products[answerType[cid]][answerLevel[cid]].itens[i].id):getWeight() * info.products[answerType[cid]][answerLevel[cid]].itens[i].amount
			end
			if player:getFreeCapacity() > neededCap then
				if player:getItemCount(tokenId) >= info.products[answerType[cid]][answerLevel[cid]].value then
					for i = 1, #info.products[answerType[cid]][answerLevel[cid]].itens do
						player:addItem(info.products[answerType[cid]][answerLevel[cid]].itens[i].id, info.products[answerType[cid]][answerLevel[cid]].itens[i].amount)
					end
					player:removeItem(tokenId, info.products[answerType[cid]][answerLevel[cid]].value)
					npcHandler:say("There it is.", cid)
					npcHandler.topic[cid] = 0
				else
					npcHandler:say("I'm sorry but it seems you don't have enough tokens yet. Bring me "..info.products[answerType[cid]][answerLevel[cid]].value.." of them and we'll make a trade.", cid)
				end
			else
				npcHandler:say("You don\'t have enough capacity. You must have "..neededCap.." oz.", cid)
			end
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
