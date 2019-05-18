local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local config = {
	['strong sinew'] = {
		storage = Storage.FathersBurdenQuest.Sinew,
		messages = {
			deliever = 'Do you have the required sinew?',
			success = 'Ah, not only did you bring some sinew to me, you also made the world a safer place by killing Heoni.',
			failure = 'Sorry, you must be wrong. Perhaps Heoni was out to hunt when you were looking for it. Search in the mountains of Edron. I put my trust in your abilities.',
			no = 'Perhaps Heoni was out to hunt when you were looking for it. Search in the mountains of Edron. I put my trust in your abilities.',
			done = 'Your bravery earned us this excellent sinew.'
		},
		itemId = 12504
	},
	['exquisite wood'] = {
		storage = Storage.FathersBurdenQuest.Wood,
		messages = {
			deliever = 'Could you find the wood we were talking about?',
			success = 'Thank you. I feel somewhat embarrassed to put you into such a danger for some birthday present but I am sure you can handle it.',
			failure = {'Sorry, you must be wrong. The wood that I need should be in one of the barbarian camps. ...', 'It seems logical to search the most northern camp first, it is closest to the place where the tree was cut. Please hurry, there is still so much to do before the birthday.'},
			no = 'The wood that I need should be in one of the barbarian camps. It seems logical to search the most northern camp first, it is closest to the place where the tree was cut. Please hurry, there is still so much to do before the birthday.',
			done = 'The wood you have found is just what we needed.'
		},
		itemId = 12503
	},
	['spectral cloth'] = {
		storage = Storage.FathersBurdenQuest.Cloth,
		messages = {
			deliever = 'Could you find the cloth I am looking for?',
			success = 'It looks a bit scary but I guess sorcerers might even find that appealing. Thank you very much.',
			failure = 'Sorry, you must be wrong. You will find it somewhere in the crypts under the Isle of the Kings. You will probably have to look for hidden caves when you don\'t find it at an obvious place. Perhaps you even need a shovel or a pick.',
			no = 'Don\'t forget, you will find it somewhere in the crypts under the Isle of the Kings. You will probably have to look for hidden caves when you don\'t find it at an obvious place. Perhaps you even need a shovel or a pick.',
			done = 'Thanks to your efforts we have a suitable piece of spectral cloth.'
		},
		itemId = 12502
	},
	['exquisite silk'] = {
		storage = Storage.FathersBurdenQuest.Silk,
		messages = {
			deliever = 'So you\'ve found the silk that I need?',
			success = 'Great. I better don\'t think about how big a spider has to be to produce such strands of silk.',
			failure = 'Sorry, you must be wrong. Search the spider caves of the continent Zao for the silk. They have to be somewhere in the east of Zao\'s southern part. My sources claim there you will find the silk that we need.',
			no = 'Then search the spider caves of the continent Zao for the silk. They have to be somewhere in the east of Zao\'s southern part. My sources claim there you will find the silk that we need.',
			done = 'The silk you have brought me is exquisite indeed.'
		},
		itemId = 12501
	},
	['magic crystal'] = {
		storage = Storage.FathersBurdenQuest.Crystal,
		messages = {
			deliever = 'Did you find the required crystal?',
			success = 'Oh look at the colours and sparkles. This crystal is truly remarkable, thank you.',
			failure = {'Sorry, you must be wrong. It is probably not easy to find the crystal that we need in such a huge desert which may contain several tombs, but please don\'t give up. ...', 'According to my sources the tomb we are looking for is east of Ankrahmun. You probably need a shovel to enter it. We still have some time and I am convinced you will find it.'},
			no = {'It is probably not easy to find the crystal that we need in such a huge desert which may contain several tombs, but please don\'t give up. ...', 'According to my sources the tomb we are looking for is east of Ankrahmun. You probably need a shovel to enter it. We still have some time and I am convinced you will find it.'},
			done = 'The crystal you have found is absolutely flawless. You did a great job indeed.'
		},
		itemId = 12508
	},
	['mystic root'] = {
		storage = Storage.FathersBurdenQuest.Root,
		messages = {
			deliever = 'Could you find the root which we are looking for?',
			success = 'You are admirably determined in fulfilling your task. I will make sure that my sons appreciate what you did for their presents.',
			failure = 'Sorry, you must be wrong. The best advice I can give you is to look underground beneath the city for a suitable root.',
			no = 'The best advice I can give you is to look underground beneath the city for a suitable root.',
			done = 'It is even recognisable for me that the root you gave me is filled with magic.'
		},
		itemId = 12507
	},
	['old iron'] = {
		storage = Storage.FathersBurdenQuest.Iron,
		messages = {
			deliever = 'Have you found the iron that we need for the present?',
			success = 'I wish there\'d an easier way to get that iron but those dwarfs are so stubborn. However, now we got what we need.',
			failure = 'Sorry, you must be wrong. I know it\'s not easy to find this iron but there has to be some in the deposits beneath the old Kazordoon mines. I doubt that it can be found in the newer mines outside of Kazordoon.',
			no = 'I know it\'s not easy to find this iron but there has to be some in the deposits beneath the old Kazordoon mines. I doubt it that it can be found in the newer mines outside of Kazordoon.',
			done = 'The iron that you\'ve found will make an ideal base for a shield.'
		},
		itemId = 12505
	},
	['flexible dragon scale'] = {
		storage = Storage.FathersBurdenQuest.Scale,
		messages = {
			deliever = 'Could you get Glitterscale\'s scales yet?',
			success = 'These scales must have belonged to a fearsome beast. I envy you for your bravery.',
			failure = 'Sorry, you must be wrong. Oh please, search for Glitterscale. It should not be too hard to find it in those caves north of Thais.',
			no = 'Oh please, search for Glitterscale. It should not be too hard to find it in those caves north of Thais.',
			done = 'Only someone as daring as you could slay the beast to get the necessary scales.'
		},
		itemId = 12506
	},
}

local message = {}
local storages = {
	Storage.FathersBurdenQuest.Sinew, Storage.FathersBurdenQuest.Wood,
	Storage.FathersBurdenQuest.Cloth, Storage.FathersBurdenQuest.Silk,
	Storage.FathersBurdenQuest.Crystal, Storage.FathersBurdenQuest.Root,
	Storage.FathersBurdenQuest.Iron, Storage.FathersBurdenQuest.Scale
}

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if npcHandler.topic[cid] == 0 then
		if msgcontains(msg, 'mission') then
			if player:getStorageValue(Storage.FathersBurdenQuest.Status) == 1 then
				if player:getStorageValue(Storage.FathersBurdenQuest.Progress) ~= 8 then
					npcHandler:say('Well, I need the parts of a sorcerer\'s robe, a paladin\'s bow, a knight\'s shield, and a druid\'s rod. If you cannot find one of them, ask me about it and I might provide you with some minor hints.', cid)
					return true
				end

				player:setStorageValue(Storage.FathersBurdenQuest.Status, 2)
				player:addItem(12657, 1)
				player:addExperience(8000, true)
				npcHandler:say({
					'I\'m so glad I finally have all the parts for the presents. Your reward is my eternal gratitude. Well, that and some gold of course. ...',
					'Take this sachet over there, I wrapped the coins into this old cape I had still lying around here from a barter with a stranger, it is of no use for me anyway. Farewell and thank you once again.'
				}, cid)
			elseif player:getStorageValue(Storage.FathersBurdenQuest.Status) == 2 then
				npcHandler:say('Thank you for your help!', cid)
				return true
			else
				npcHandler:say({
					'I have four sons which are very dear to me. Though they were born on the same day and even in the same hour, they took quite different paths in life. ...',
					'Each of them chose a different vocation, one will become a knight, one a sorcerer, one a druid, and the other a paladin. In a few weeks they will reach adulthood and I am holding a birthday party for them. ...',
					'It should become a day to remember and so I want to give them something special as a present. I searched the land for the finest craftsmen so they could create suitable presents for my sons. ...',
					'But something of fine craftsmanship will just not cut it. So I asked them what they would need to create something special. They all came up with lists of rare and expensive items necessary for the task ahead. ...',
					'I spent a small fortune to buy most of the materials but in the end the key components are that rare that they cannot be simply bought somewhere. ...',
					'As far as I understood it, the places where you can get these items are quite dangerous and so it would take some adventurer to get them. ...',
					'That would be your mission if you are interested. Uhm, so are you interested?'
				}, cid)
				npcHandler.topic[cid] = 1
			end
		elseif config[msg:lower()] then
			local targetMessage = config[msg:lower()]
			if player:getStorageValue(targetMessage.storage) == 2 then
				npcHandler:say(targetMessage.messages.done, cid)
				return true
			end

			npcHandler:say(targetMessage.messages.deliever, cid)
			npcHandler.topic[cid] = 2
			message[cid] = targetMessage
		end
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('I am relieved someone as capable as you will handle the task. Well, I need the parts of a sorcerer\'s robe, a paladin\'s bow, a knight\'s shield, and a druid\'s wand.', cid)
			player:setStorageValue(Storage.FathersBurdenQuest.QuestLog, 1)
			player:setStorageValue(Storage.FathersBurdenQuest.Progress, 0)
			player:setStorageValue(Storage.FathersBurdenQuest.Status, 1)
			for i = 1, #storages do
				player:setStorageValue(storages[i], 1)
			end
		elseif msgcontains(msg, 'no') then
			npcHandler:say('Oh my. I really hope you will change your mind.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 2 then
		local targetMessage = message[cid]
		if msgcontains(msg, 'yes') then
			if not player:removeItem(targetMessage.itemId, 1) then
				npcHandler:say(targetMessage.messages.failure, cid)
				return true
			end

			player:setStorageValue(targetMessage.storage, 2)
			player:setStorageValue(Storage.FathersBurdenQuest.Progress, player:getStorageValue(Storage.FathersBurdenQuest.Progress) + 1)
			player:addExperience(2500, true)
			npcHandler:say(targetMessage.messages.success, cid)
		elseif msgcontains(msg, 'no') then
			npcHandler:say(targetMessage.messages.no, cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

local function onReleaseFocus(cid)
	message[cid] = nil
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:addModule(FocusModule:new())