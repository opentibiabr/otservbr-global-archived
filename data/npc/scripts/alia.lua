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

-- Twist of Fate
local blessKeyword = keywordHandler:addKeyword({'twist of fate'}, StdModule.say, 
	{
		npcHandler = npcHandler,
		text = {
			'This is a special blessing I can bestow upon you once you have obtained at least \z
			one of the other blessings and which functions a bit differently. ...',
			'It only works when you\'re killed by other adventurers, which means that at least \z
			half of the damage leading to your death was caused by others, not by monsters or the environment. ...',
			'The {twist of fate} will not reduce the death penalty like the other blessings, \z
			but instead prevent you from losing your other blessings as well as the amulet of loss, should you wear one. \z
			It costs the same as the other blessings. ...',
			'Would you like to receive that protection for a sacrifice of |PVPBLESSCOST| gold, child?'
	}})
blessKeyword:addChildKeyword({'yes'}, StdModule.bless, 
	{
		npcHandler = npcHandler, 
		text = 'So receive the protection of the twist of fate, pilgrim.', 
		cost = '|PVPBLESSCOST|', 
		bless = 1
	}
)
blessKeyword:addChildKeyword({'no'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Fine. You are free to decline my offer.', 
		reset = true
	}
)

-- Adventurer Stone
keywordHandler:addKeyword({'adventurer stone'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Keep your adventurer\'s stone well.'
	}, 
		function(player) return player:getItemById(18559, true) end
)

local stoneKeyword = keywordHandler:addKeyword({'adventurer stone'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Ah, you want to replace your adventurer\'s stone for free?'
	}, 
		function(player) return player:getStorageValue(Storage.AdventurersGuild.FreeStone.Alia) ~= 1 end
)
stoneKeyword:addChildKeyword({'yes'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Here you are. Take care.', 
		reset = true
	}, 
	nil, function(player) player:addItem(18559, 1) player:setStorageValue(Storage.AdventurersGuild.FreeStone.Alia, 1) end
)
stoneKeyword:addChildKeyword({'no'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'No problem.', 
		reset = true
	}
)
local stoneKeyword = keywordHandler:addKeyword({'adventurer stone'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Ah, you want to replace your adventurer\'s stone for 30 gold?'
	}
)
stoneKeyword:addChildKeyword({'yes'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Here you are. Take care.', 
		reset = true
	},
		function(player) return player:getMoney() + player:getBankBalance() >= 30 end,
		function(player) if player:removeMoneyNpc(30) then player:addItem(18559, 1) end end
	)
stoneKeyword:addChildKeyword({'yes'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Sorry, you don\'t have enough money.', 
		reset = true
	}
)
stoneKeyword:addChildKeyword({'no'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'No problem.', 
		reset = true
	}
)

-- Healing
local function addHealKeyword(text, condition, effect)
	keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = text},
		function(player) return player:getCondition(condition) ~= nil end,
		function(player)
			player:removeCondition(condition)
			player:getPosition():sendMagicEffect(effect)
		end
	)
end

addHealKeyword('You are burning. Let me quench those flames.', CONDITION_FIRE, CONST_ME_MAGIC_GREEN)
addHealKeyword('You are poisoned. Let me soothe your pain.', CONDITION_POISON, CONST_ME_MAGIC_RED)
addHealKeyword('You are electrified, my child. Let me help you to stop \z
trembling.', CONDITION_ENERGY, CONST_ME_MAGIC_GREEN)

keywordHandler:addKeyword({'heal'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'You are hurt, my child. I will heal your wounds.'
	},
	function(player) return player:getHealth() < 40 end,
	function(player)
		local health = player:getHealth()
		if health < 40 then player:addHealth(40 - health) end
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
)
keywordHandler:addKeyword({'heal'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'You aren\'t looking that bad. Sorry, I can\'t help you. But if you are \z
		looking for additional protection you should go on the {pilgrimage} of ashes or \z
		get the protection of the {twist of fate} here.'
	}
)
keywordHandler:addKeyword({'pilgrimage'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = 'Whenever you receive a lethal wound, your vital force is damaged and there is a chance \z
		that you lose some of your equipment. With every single of the five {blessings} you have, \z
		this damage and chance of loss will be reduced.'
	}
)

npcHandler:setMessage(MESSAGE_GREET, 'Welcome, young |PLAYERNAME|! If you are heavily wounded or poisoned, \z
I can {heal} you for free.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Remember: If you are heavily wounded or poisoned, I can heal you for free.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'May the gods bless you, |PLAYERNAME|!')

npcHandler:addModule(FocusModule:new())
