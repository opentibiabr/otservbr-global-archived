local internalNpcName = "Grizzly Adams"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 144,
	lookHead = 116,
	lookBody = 78,
	lookLegs = 94,
	lookFeet = 78,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local choose = {}
local cancel = {}

local grizzlyAdamsConfig = {
	ranks = {
		huntsMan_rank = {
			-- SELL OFFERS
			{id=10297, buy=0, sell=50, name="antlers"},
			{id=9633, buy=0, sell=100, name="bloody pincers"},
			{id=10272, buy=0, sell=35, name="crab pincers"},
			{id=9657, buy=0, sell=55, name="cyclops toe"},
			{id=12316, buy=0, sell=550, name="cavebear skull"},
			{id=17818, buy=0, sell=150, name="cheesy figurine"},
			{id=11514, buy=0, sell=110, name="colourful feather"},
			{id=7398, buy=0, sell=500, name="cyclops trophy"},
			{id=10398, buy=0, sell=15000, name="draken trophy"},
			{id=12309, buy=0, sell=800, name="draptor scales"},
			{id=18994, buy=0, sell=115, name="elven hoof"},
			{id=9648, buy=0, sell=30, name="frosty ear of a troll"},
			{id=12317, buy=0, sell=950, name="giant crab pincer"},
			{id=11539, buy=0, sell=20, name="goblin ear"},
			{id=12314, buy=0, sell=400, name="hollow stampor hoof"},
			{id=10282, buy=0, sell=600, name="hydra head"},
			{id=10455, buy=0, sell=80, name="lancer beetle shell"},
			{id=10419, buy=0, sell=8000, name="lizard trophy"},
			{id=11489, buy=0, sell=280, name="mantassin tail"},
			{id=17461, buy=0, sell=65, name="marsh stalker beak"},
			{id=17462, buy=0, sell=50, name="marsh stalker feather"},
			{id=12315, buy=0, sell=250, name="maxilla"},
			{id=7401, buy=0, sell=500, name="minotaur trophy"},
			{id=9662, buy=0, sell=420, name="mutated bat ear"},
			{id=12039, buy=0, sell=750, name="panther head"},
			{id=12040, buy=0, sell=300, name="panther paw"},
			{id=11491, buy=0, sell=500, name="quara bone"},
			{id=11491, buy=0, sell=350, name="quara eye"},
			{id=11490, buy=0, sell=410, name="quara pincers"},
			{id=11487, buy=0, sell=140, name="quara tentacle"},
			{id=12172, buy=0, sell=50, name="rabbit's foot"},
			{id=18993, buy=0, sell=70, name="rorc feather"},
			{id=10311, buy=0, sell=400, name="sabretooth"},
			{id=10456, buy=0, sell=20, name="sandcrawler shell"},
			{id=9631, buy=0, sell=280, name="scarab pincers"},
			{id=12312, buy=0, sell=280, name="stampor horn"},
			{id=12313, buy=0, sell=150, name="stampor talons"},
			{id=10454, buy=0, sell=60, name="terramite legs"},
			{id=10452, buy=0, sell=170, name="terramite shell"},
			{id=10273, buy=0, sell=95, name="terrorbird beak"},
			-- BUY OFFERS
			{id=5907, buy=35000, sell=0, name="slingshot"}
		},

		bigGameHunter_rank = {
			{id=10244, buy=0, sell=6000, name="bonebeast trophy"},
			{id=7397, buy=0, sell=3000, name="deer trophy"},
			{id=7400, buy=0, sell=3000, name="lion trophy"},
			{id=7395, buy=0, sell=1000, name="orc trophy"},
			{id=7394, buy=0, sell=3000, name="wolf trophy"}
		},

		trophyHunter_rank = {
			-- SELL OFFERS
			{id=7396, buy=0, sell=20000, name="behemoth trophy"},
			{id=7393, buy=0, sell=40000, name="demon trophy"},
			{id=7399, buy=0, sell=10000, name="dragon lord trophy"},
			{id=10421, buy=0, sell=3000, name="disgusting trophy"},
			{id=22101, buy=0, sell=9000, name="werebadger trophy"},
			{id=22102, buy=0, sell=10000, name="wereboar trophy"},
			{id=22103, buy=0, sell=11000, name="werebear trophy"},
			{id=27706, buy=0, sell=9000, name="werefox trophy"},
			{id=34219, buy=0, sell=12000, name="werehyaena trophy"},
			-- BUY OFFERS
			{id=9601, buy=1000, sell=0, name="demon backpack"}
		},
	}
}

local items, data = {}
for i = 1, #grizzlyAdamsConfig.ranks.huntsMan_rank do
	data = grizzlyAdamsConfig.ranks.huntsMan_rank[i]
	items[data.id] = {id = data.id, buy = data.buy, sell = data.sell, name = ItemType(data.id):getName():lower()}
end
for i = 1, #grizzlyAdamsConfig.ranks.bigGameHunter_rank do
	data = grizzlyAdamsConfig.ranks.bigGameHunter_rank[i]
	items[data.id] = {id = data.id, buy = data.buy, sell = data.sell, name = ItemType(data.id):getName():lower()}
end
for i = 1, #grizzlyAdamsConfig.ranks.trophyHunter_rank do
	data = grizzlyAdamsConfig.ranks.trophyHunter_rank[i]
	items[data.id] = {id = data.id, buy = data.buy, sell = data.sell, name = ItemType(data.id):getName():lower()}
end

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	local player = Player(creature)
	if player:getStorageValue(JOIN_STOR) == -1 then
		npcHandler:setMessage(MESSAGE_GREET,
					"Hi there, do you want to to join the 'Paw and Fur - Hunting Elite'?")
	else
		npcHandler:setMessage(MESSAGE_GREET,
							"Welcome to the 'Paw and Fur - Hunting Elite' |PLAYERNAME|. "..
							"Feel free to do {tasks} for us.")
	end
	return true
end

local function joinTables(old, new)
	for k, v in pairs(new) do
		old[k] = v
	end
	return old
end

local function onBuy(creature, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(creature)
	if not ignoreCap and player:getFreeCapacity() < ItemType(items[item].id):getWeight(amount) then
		return player:sendTextMessage(MESSAGE_FAILURE, "You don't have enough cap.")
	end
	if items[item].buy then
		if player:removeMoneyBank(amount * items[item].buy) then
			player:addItem(items[item].id, amount)
			return player:sendTextMessage(MESSAGE_TRADE,
						"Bought "..amount.."x "..items[item].name.." for "..items[item].buy * amount.." gold coins.")
		else
			return player:sendTextMessage(MESSAGE_FAILURE, "You don't have enough money.")
		end
	end
	return true
end

local function onSell(creature, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(creature)
	if items[item].sell then
		if player:removeItem(items[item].id, amount) then
			player:addMoney(items[item].sell * amount)
			return player:sendTextMessage(MESSAGE_TRADE,
						"Sold "..amount.."x "..items[item].name.." for "..items[item].sell * amount.." gold coins.")
		else
			return player:sendTextMessage(MESSAGE_TRADE, "You don't have the items you're trying to sell.")
		end
	end
	return true
end

local function startTrade(creature, player)
	if player:getPawAndFurRank() >= 2 then
		local tradeItems = grizzlyAdamsConfig.ranks.huntsMan_rank
		if player:getPawAndFurRank() >= 4 then
			tradeItems = joinTables(tradeItems, grizzlyAdamsConfig.ranks.bigGameHunter_rank)
		end
		if player:getPawAndFurRank() >= 6 then
			tradeItems = joinTables(tradeItems, grizzlyAdamsConfig.ranks.trophyHunter_rank)
		end
		openShopWindow(creature, tradeItems, onBuy, onSell)
		return npcHandler:say("It's my offer.", npc, creature)
	else
		return npcHandler:say("You don't have any rank.", npc, creature)
	end
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	message = message:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)

	if msgcontains("trade", message) then
		startTrade(creature, player)
	elseif (msgcontains("join", message) or msgcontains("yes", message))
			and npcHandler:getTopic(playerId) == 0
			and player:getStorageValue(JOIN_STOR) ~= 1 then
		player:setStorageValue(JOIN_STOR, 1)
		npcHandler:say("Great! " ..
					"A warm welcome to our newest member: |PLAYERNAME|! " ..
					"Ask me for a {task} if you want to go on a hunt.", npc, creature)
	elseif isInArray({"tasks", "task", "mission"}, message:lower()) then
		if player:getStorageValue(JOIN_STOR) == -1 then
			return npcHandler:say("You'll have to {join}, to get any {tasks}.",creature)
		end

		local can = player:getTasks()

		if #can > 0 then
			local text = ""
			local sep = ", "
			table.sort(can, function(a, b) return a < b end)
			local t = 0
			local id
			for i = 1, #can do
				id = can[i]
				t = t + 1
				if t == #can - 1 then
					sep = " and "
				elseif t == #can then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
			npcHandler:say("The current task" ..
						(#can > 1 and "s" or "") .. " that you can choose " ..
						(#can > 1 and "are" or "is") .. " " .. text, npc, creature)
			npcHandler:setTopic(playerId, 0)
		else
			npcHandler:say("I don't have any task for you right now.", npc, creature)
		end
	elseif message ~= "" and player:canStartTask(message) then
		if #player:getStartedTasks() >= tasksByPlayer then
			npcHandler:say("Sorry, but you already started " .. tasksByPlayer .. " tasks."..
						" ".."You can check their {status}, {cancel} or {report} a task.", npc, creature)
			return true
		end
		local task = getTaskByName(message)
		if task and player:getStorageValue(QUESTSTORAGE_BASE + task) > 0 then
			return false
		end
		npcHandler:say("In this task you must defeat " .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. "."..
					" ".."Are you sure that you want to start this task?", npc, creature)
		choose[playerId] = task
		npcHandler:setTopic(playerId, 1)
	elseif message:lower() == "yes" and npcHandler:getTopic(playerId) == 1 then
		player:setStorageValue(QUESTSTORAGE_BASE + choose[playerId], 1)
		player:setStorageValue(KILLSSTORAGE_BASE + choose[playerId], 0)
		npcHandler:say("Excellent! You can check the {status} of your task saying {report} to me."..
					" ".."Also you can {cancel} tasks to.", npc, creature)
		choose[playerId] = nil
		npcHandler:setTopic(playerId, 0)
	elseif msgcontains("status", message) then
		local started = player:getStartedTasks()
		if started and #started > 0 then
			local text = ""
			table.sort(started, (function(a, b) return (a < b) end))
			local t = 0
			local id
			for i = 1, #started do
				id = started[i]
				t = t + 1
				text = text .. "Task name: " .. tasks[id].raceName .. ". "..
					"Current kills: " .. player:getStorageValue(KILLSSTORAGE_BASE + id) .. ".\n"
			end
			npcHandler:say({"The status of your current tasks is:\n" .. text}, npc, creature)
		else
			npcHandler:say("You haven't started any task yet.", npc, creature)
		end
	elseif msgcontains("report", message) then
		local started = player:getStartedTasks()
		local finishedAtLeastOne = false
		local finished = 0
		if started and #started > 0 then
			local id, reward
			for i = 1, #started do
				id = started[i]
				if player:getStorageValue(KILLSSTORAGE_BASE + id) >= tasks[id].killsRequired then
					for j = 1, #tasks[id].rewards do
						reward = tasks[id].rewards[j]
						local deny = false
						if reward.storage then
							if player:getStorageValue(reward.storage[1]) >= reward.storage[2] then
								deny = true
							end
						end
						if isInArray({REWARD_MONEY, "money"}, reward.type:lower()) and not deny then
							player:addMoney(reward.value[1])
						elseif isInArray({REWARD_EXP, "exp", "experience"}, reward.type:lower()) and not deny then
							player:addExperience(reward.value[1], true)
						elseif isInArray({REWARD_ACHIEVEMENT, "achievement", "ach"}, reward.type:lower()) and not deny then
							player:addAchievement(reward.value[1])
						elseif isInArray({REWARD_STORAGE, "storage", "stor"}, reward.type:lower()) and not deny then
							player:setStorageValue(reward.value[1], reward.value[2])
						elseif isInArray({REWARD_POINT, "points", "point"}, reward.type:lower()) and not deny then
							player:setStorageValue(POINTSSTORAGE, getPlayerTasksPoints(creature) + reward.value[1])
						elseif isInArray({REWARD_ITEM, "item", "items", "object"}, reward.type:lower()) and not deny then
							player:addItem(reward.value[1], reward.value[2])
						end

						if reward.storage then
							player:setStorageValue(reward.storage[1], reward.storage[2])
						end
					end

					player:setStorageValue(QUESTSTORAGE_BASE + id, (tasks[id].norepeatable and 2 or 0))
					player:setStorageValue(KILLSSTORAGE_BASE + id, -1)
					player:setStorageValue(REPEATSTORAGE_BASE + id, math.max(player:getStorageValue(REPEATSTORAGE_BASE + id), 0))
					player:setStorageValue(REPEATSTORAGE_BASE + id, player:getStorageValue(REPEATSTORAGE_BASE + id) + 1)
					finishedAtLeastOne = true
					finished = finished + 1
				end
			end
			if not finishedAtLeastOne then
				local started = player:getStartedTasks()
				if started and #started > 0 then
					local text = ""
					local sep = ", "
					table.sort(started, (function(a, b) return (a < b) end))
					local t = 0
					local id
					for i = 1, #started do
						id = started[i]
						t = t + 1
						if (t == #started - 1) then
							sep = " and "
						elseif (t == #started) then
							sep = "."
						end
						text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
					end
					npcHandler:say("The current task" .. (#started > 1 and "s" or "") ..
								" that you started " .. (#started > 1 and "are" or "is") .. " " .. text, npc, creature)
				end
			else
				npcHandler:say("Awesome! "..
							"You finished "..(finished > 1 and "various" or "a").." task"..(finished > 1 and "s" or "").."."..
							"Talk to me again if you want to start a {task}.", npc, creature)
			end
		else
			npcHandler:say("You haven't started any task yet.", npc, creature)
		end
	elseif message:lower() == "started" then
		local started = player:getStartedTasks()
		if started and #started > 0 then
			local text = ""
			local sep = ", "
			table.sort(started, (function(a, b) return (a < b) end))
			local t = 0
			local id
			for i = 1, #started do
				id = started[i]
				t = t + 1
				if t == #started - 1 then
					sep = " and "
				elseif t == #started then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end

			npcHandler:say("The current task" .. (#started > 1 and "s" or "") .. " that you started" ..
				" " .. (#started > 1 and "are" or "is") .. " " .. text, npc, creature)
		else
			npcHandler:say("You haven't started any task yet.", npc, creature)
		end
	elseif message:lower() == "cancel" then
		local started = player:getStartedTasks()
		local text = ""
		local sep = ", "
		table.sort(started, (function(a, b) return (a < b) end))
		local t = 0
		local id
		for i = 1, #started do
			id = started[i]
			t = t + 1
			if t == #started - 1 then
				sep = " or "
			elseif t == #started then
				sep = "?"
			end
			text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
		end
		if started and #started > 0 then
			npcHandler:say("Canceling a task will make the counter restart. " ..
						"Which of these tasks you want cancel?" .. (#started > 1 and "" or "") .. " " .. text, npc, creature)
			npcHandler:setTopic(playerId, 2)
		else
			npcHandler:say("You haven't started any task yet.", npc, creature)
		end
	elseif ((getTaskByName(message)) and
			(npcHandler:getTopic(playerId) == 2) and
			(isInArray(getPlayerStartedTasks(creature), getTaskByName(message)))) then
		local task = getTaskByName(message)
		if player:getStorageValue(KILLSSTORAGE_BASE + task) > 0 then
			npcHandler:say("You currently killed " .. player:getStorageValue(KILLSSTORAGE_BASE + task) .. "/" ..
						tasks[task].killsRequired .. " " .. tasks[task].raceName .. "."..
						" ".."Canceling this task will restart the count."..
						" ".."Are you sure you want to cancel this task?", npc, creature)
		else
			npcHandler:say("Are you sure you want to cancel this task?", npc, creature)
		end
		npcHandler:setTopic(playerId, 3)
		cancel[playerId] = task
	elseif ((getTaskByName(message)) and
			(npcHandler:getTopic(playerId) == 1) and
			(isInArray(getPlayerStartedTasks(creature), getTaskByName(message)))) then
		local task = getTaskByName(message)
		if player:getStorageValue(KILLSSTORAGE_BASE + task) > 0 then
			npcHandler:say("You currently killed " ..
						player:getStorageValue(KILLSSTORAGE_BASE + task) .. "/" ..
						tasks[task].killsRequired .. " " ..
						tasks[task].raceName .. ".", npc, creature)
		else
			npcHandler:say("You currently killed 0/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ".", npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	elseif message:lower() == "yes" and npcHandler:getTopic(playerId) == 3 then
		player:setStorageValue(QUESTSTORAGE_BASE + cancel[playerId], -1)
		player:setStorageValue(KILLSSTORAGE_BASE + cancel[playerId], -1)
		npcHandler:say("You have canceled the task " ..
					(tasks[cancel[playerId]].name or tasks[cancel[playerId]].raceName) .. ".", npc, creature)
		npcHandler:setTopic(playerId, 0)
	elseif isInArray({"points", "rank"}, message:lower()) then
		npcHandler:say("At this time, you have " .. player:getPawAndFurPoints() .. " Paw & Fur points. You " ..
					(player:getPawAndFurRank() == 6 and "are an Elite Hunter" or
					player:getPawAndFurRank() == 5 and "are a Trophy Hunter" or
					player:getPawAndFurRank() == 4 and "are a Big Game Hunter" or
					player:getPawAndFurRank() == 3 and "are a Ranger" or
					player:getPawAndFurRank() == 2 and "are a Huntsman" or
					player:getPawAndFurRank() == 1 and "are a Member"  or
					"haven't been ranked yet") .. ".", npc, creature)
		npcHandler:setTopic(playerId, 0)
	elseif isInArray({"special task"}, message:lower()) then
		if (player:getPawAndFurPoints() >= 70) then
			if ((player:getLevel() > 90) and
				(player:getStorageValue(Storage.KillingInTheNameOf.MissionTiquandasRevenge) == 1) and
				(player:getStorageValue(Storage.KillingInTheNameOf.TiquandasRevengeTeleport) ~= 0)) then
				npcHandler:say("You have already started the task. Go find Tiquandas Revenge and take revenge yourself!", npc, creature)
			else
				npcHandler:say({"Have you heard about Tiquandas Revenge? " ..
							"It is said that the jungle itself is alive and takes revenge for all the bad things people have done to it." ..
							"...",
							"I myself believe that there is some truth in this clap trap." ..
							"Something 'real' which therefore must have a hideout somewhere." ..
							"Go find it and take revenge yourself!"}, npc, creature)
				player:setStorageValue(Storage.KillingInTheNameOf.TiquandasRevengeTeleport, 1)
				player:setStorageValue(Storage.KillingInTheNameOf.MissionTiquandasRevenge, 1)
			end

			if ((player:getLevel() > 100) and
				(player:getStorageValue(Storage.KillingInTheNameOf.MissionDemodras) == 1) and
				(player:getStorageValue(Storage.KillingInTheNameOf.DemodrasTeleport) ~= 0)) then
				npcHandler:say("You have already started the special task. Find Demodras and kill it.", npc, creature)
			else
				if ((player:getStorageValue(Storage.KillingInTheNameOf.MissionTiquandasRevenge) == 1) and
					(player:getStorageValue(Storage.KillingInTheNameOf.TiquandasRevengeTeleport) == 0)) then
					npcHandler:say("This task is a very dangerous one. I want you to look for Demodras' hideout. "..
								"It might be somewhere under the Plains of Havoc. Good luck, old chap.", npc, creature)
					player:setStorageValue(Storage.KillingInTheNameOf.DemodrasTeleport, 1)
					player:setStorageValue(Storage.KillingInTheNameOf.MissionDemodras, 1)

				end
			end

			if (player:getStorageValue(Storage.KillingInTheNameOf.MissionDemodras) == 1 and
				player:getStorageValue(Storage.KillingInTheNameOf.DemodrasTeleport) == 0 and
				player:getStorageValue(Storage.KillingInTheNameOf.MissionTiquandasRevenge) == 1 and
				player:getStorageValue(Storage.KillingInTheNameOf.TiquandasRevengeTeleport) == 0) then
				npcHandler:say("You have already finished all special tasks.", npc, creature)
			end
			npcHandler:setTopic(playerId, 0)
		end
	end
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Happy hunting, old chap!")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
