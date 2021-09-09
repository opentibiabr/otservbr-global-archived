local internalNpcName = "Frosty"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1159
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local talkState = {}
local rtnt = {}

npcType.onAppear = function(npc, creature)
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

keywordHandler:addKeyword({'carrot'}, StdModule.say, {npcHandler = npcHandler, text = "What about 'no' do you not understand, hrm? You are more annoying than any {percht} around here! Not to mention those bothersome {bunnies} who try to graw away my nose!"})
keywordHandler:addKeyword({'percht skull'}, StdModule.say, {npcHandler = npcHandler, text = "Well why didn't you say that rightaway, if you give me such a skull I can give you one of my {sleighs}."})
keywordHandler:addKeyword({'bunnies'}, StdModule.say, {npcHandler = npcHandler, text = "Always trying to eat my nose!"})

npcHandler:setMessage(MESSAGE_GREET, "No, you can't have my nose! If you're in need of a {carrot}, go to the market or just dig up one! Or did you come to bring me a {percht skull}?")
sleighinfo = {
['bright percht sleigh'] = {cost = 0, items = {{35051,1}}, mount = 133, storageID = Storage.Percht1},
['cold percht sleigh'] = {cost = 0, items = {{35051,1}}, mount = 132, storageID = Storage.Percht2},
['dark percht sleigh'] = {cost = 0, items = {{35051,1}}, mount = 134, storageID = Storage.Percht3}
}

local monsterName = {'bright percht sleigh', 'cold percht sleigh', 'dark percht sleigh'}

function creatureSayCallback(npc, creature, type, message)
	if(not npcHandler:isFocused(creature)) then
		return false
	end

	local player = Player(creature)
	if sleighinfo[message] ~= nil then
		if (getPlayerStorageValue(creature, sleighinfo[message].storageID) ~= -1) then
				npcHandler:say('You already have this sleigh!', npc, creature)
				npcHandler:resetNpc()
		else
		local itemsTable = sleighinfo[message].items
		local items_list = ''
			if table.maxn(itemsTable) > 0 then
				for i = 1, table.maxn(itemsTable) do
					local item = itemsTable[i]
					items_list = items_list .. item[2] .. ' ' .. ItemType(item[1]):getName()
					if i ~= table.maxn(itemsTable) then
						items_list = items_list .. ', '
					end
				end
			end
		local text = ''
			if (sleighinfo[message].cost > 0) then
				text = sleighinfo[message].cost .. ' gp'
			elseif table.maxn(sleighinfo[message].items) then
				text = items_list
			elseif (sleighinfo[message].cost > 0) and table.maxn(sleighinfo[message].items) then
				text = items_list .. ' and ' .. sleighinfo[message].cost .. ' gp'
			end
			npcHandler:say('For a ' .. message .. ' you will need ' .. text .. '. Do you have it with you?', npc, creature)
			rtnt[creature] = message
			talkState[creature] = sleighinfo[message].storageID
			return true
		end
	elseif message:lower() == 'percht' then
		npcHandler:say('Nasty creatures especially their queen that sits frozzen on her throne beneath this island.', npc, creature)
	elseif msgcontains(message, "yes") then
		if (talkState[creature] >= Storage.Percht1 and talkState[creature] <= Storage.Percht3) then
			local items_number = 0
			if table.maxn(sleighinfo[rtnt[creature]].items) > 0 then
				for i = 1, table.maxn(sleighinfo[rtnt[creature]].items) do
					local item = sleighinfo[rtnt[creature]].items[i]
					if (getPlayerItemCount(creature,item[1]) >= item[2]) then
						items_number = items_number + 1
					end
				end
			end
			if(player:removeMoneyNpc(sleighinfo[rtnt[creature]].cost) and (items_number == table.maxn(sleighinfo[rtnt[creature]].items))) then
				if table.maxn(sleighinfo[rtnt[creature]].items) > 0 then
					for i = 1, table.maxn(sleighinfo[rtnt[creature]].items) do
						local item = sleighinfo[rtnt[creature]].items[i]
						doPlayerRemoveItem(creature,item[1],item[2])
					end
				end
				doPlayerAddMount(creature, sleighinfo[rtnt[creature]].mount)
				setPlayerStorageValue(creature,sleighinfo[rtnt[creature]].storageID,1)
				npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('You do not have needed items!', npc, creature)
			end
			rtnt[creature] = nil
			talkState[creature] = 0
			npcHandler:resetNpc()
			return true
		end
	elseif msgcontains(message, "mount") or msgcontains(message, "mounts") or msgcontains(message, "sleigh") or msgcontains(message, "sleighs") then
		npcHandler:say('I can give you one of the following sleighs: {' .. table.concat(monsterName, "}, {") .. '}.', npc, creature)
		rtnt[creature] = nil
		talkState[creature] = 0
		npcHandler:resetNpc()
		return true
	elseif msgcontains(message, "help") then
		npcHandler:say('Just tell me which {sleigh} you want to know more about.', npc, creature)
		rtnt[creature] = nil
		talkState[creature] = 0
		npcHandler:resetNpc()
		return true
	else
		if talkState[creature] ~= nil then
			if talkState[creature] > 0 then
			npcHandler:say('Come back when you get these items.', npc, creature)
			rtnt[creature] = nil
			talkState[creature] = 0
			npcHandler:resetNpc()
			return true
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
