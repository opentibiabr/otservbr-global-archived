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

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)

	if msgcontains(msg, "character world transfer") then
			npcHandler:say("Character World Transfer means that you will leave this world and move to a new one to live there. If you need detailed {information} just ask me. I can also {check} if you're ready and if you are, I can teleport you to the transfer platform.", cid)
			npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "information") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
			"I can tell you about the {requirements} for a transfer, and about what happens to your {skills}, {quests}, {money} and {items} ...",
			"I can also {check} if you fulfill the requirements. And I can then teleport you to the departure platform."
			}, cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "requirements") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say({
			"Well, first of all you need to purchase a Character World Transfer in the in-game store on that character you wana move. Without that, nothing will happen! ...",
			"That character - you - must then talk to me here to be transferred to the chosen world ...",
			"You MUST NOT have a black or red skull or have a final warning! Of course we don't want criminals to move around freely ...",
			"You MUST give up all your bonds on this world. No marriage. No guild. No house ...",
			"You can only move every 6 months with Character World Transfer! So if you've already changed worlds, you need to wait 6 month for a new transfer. Or buy an Express World Transfer in the Store. But that's expensive ...",
			"I can tell you about what happens to your {money} and {items}, and I also {check} whether you meet the requirements - and if you do, I can then teleport you to the departure platform."
			}, cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "skill") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("You will keep all of your skills and levels as they currently are. Easy as that.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "quest") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("You will keep the status of all your quests. That includes opened treasures - even if they are not shown in the questlog -, having taken part in events and the status of your blessings.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "money") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("I recommend depositing all of your gold in the bank. You will keep ALL of the money on your bank account on the new world.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "item") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say({
			"All your items in your {inventory}, your {inbox} and your {depot} will be transferred ...",
			"I recommend checking all the items you want to keep and to sell the rest; and deposit your money on your bank account. Or you could give some to friends who stay here! ...",
			"I can check if you meet all necessary {requirements} for a transfer."
			}, cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "bank") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("No, there's no bank here anymore. There used to be one on the island, but there's no need for one these days. You need to visit one of the major cities if you require a bank.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "inventory") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("Yes, you will also keep the items in your inventory.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "inbox") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("You keep all items that are in your {inbox} when transferring to another world.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "depot") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("No worries there. You keep all your {items} that are in your inventory, inbox and depot.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "check") then
		if npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2 then
			if getHouseByPlayerGUID(player:getGuid()) then
			npcHandler:say("You have to leave your house.", cid)
			npcHandler.topic[cid] = 1
			elseif player:getSkull() >= 1 then
			npcHandler:say("You have to get rid of your skull.", cid)
			npcHandler.topic[cid] = 1
			elseif player:getGuild() then
			npcHandler:say("You have to leave your guild.", cid)
			npcHandler.topic[cid] = 1
			elseif player:getStorageValue(Storage.WorldTransfer) ~= 1 then
			npcHandler:say("You have to pay for this service at ingame shop.", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say({
			"You meet all in-game requirements for a Character World Transfer.",
			"So, it's time for the big question: DO YOU REALLY WANT TO LEAVE THIS WORLD?"
			}, cid)
			npcHandler.topic[cid] = 3
		end
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 3 then
			local destination = Position(32059, 32361, 6)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say("Here you go! Just relog on this platform and you will be at the new server. I wish you a new and happy life!", cid)
			db.query("UPDATE `players` SET `world_id` = " .. player:getStorageValue(Storage.WorldTransferId) .. " WHERE `id` = " .. player:getGuid())
			player:setStorageValue(Storage.WorldTransferId, 0)
			addEvent(function() player:remove() end, 500)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 3 then
			npcHandler:say({
			"Well, that is a definite requirement! ...",
			"I will only check if you fulfill all in-game requirements."
			}, cid)
		npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye-bye, |PLAYERNAME|! Don't forget - if you relog on the platform and 
l all requirements, your character will arrive on your new world.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye-bye, |PLAYERNAME|! Don't forget - if you relog on the platform and fulfill all requirements, your character will arrive on your new world.")
npcHandler:setMessage(MESSAGE_GREET, "Welcome to Travora, |PLAYERNAME|! I suppose you're here for the {Character World Transfer}.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
