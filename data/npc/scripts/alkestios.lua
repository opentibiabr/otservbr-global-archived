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
	if msgcontains(msg, "mission") then
        npcHandler:say({
            "I indeed have some troubles since I'm travelling this part of the world. When I took over the body of a white deer I wasn't aware that such an animal is a sought after quarry for hunters and poachers. ...",
            "Now I'm living in the constant danger of being caught and killed. Of course, I could just take over another animal but this deer has really grown on me. I'd like to help this beautiful stag but I need your assistance. Are you willing to help me?"
        }, cid)
        npcHandler.topic[cid] = 1

	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "yes") then
			npcHandler:say({
				"Your decision honours you. However, if you consider killing the poachers in question I ask you to halt. We, the fae, are rather peaceful beings and abhor bloodshed. Therefore, we must find another way to solve this problem. ...",
				"I already have an idea: Some birds told me that poachers are a superstitious lot. Perhaps we can get them with their own misbelief. I know that the poachers have a kind of camp north of the Green Claw Swamps. ...",
				"Please search it out and examine it closely. Perhaps you will find something you can use against them in order to stop them from hunting white deer."
			}, cid)
			player:setStorageValue(Storage.ThreatenedDreams.Start, 1)

		elseif msgcontains(msg, "no") then
			npcHandler:say("Then not.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'deer'}, StdModule.say, {npcHandler = npcHandler, text = "Outside of our secret {realm} my siblings and I can't keep our true shape. If we want to travel other parts of the world, we must take over the bodies of animals. But we are causing them no harm and we just take control if necessary."})
keywordHandler:addKeyword({'realm'}, StdModule.say, {npcHandler = npcHandler, text = "We call it Feyrist and it is a secret, hidden place. Just few mortals get permission to enter it. A long time ago, we learned how to hide our realm from the outside world. Only if you gain our trust I will tell you how to reach it."})
keywordHandler:addKeyword({'siblings'}, StdModule.say, {npcHandler = npcHandler, text = "We call ourselves the fae. Some name us nature spirits or peri but we prefer the former term. Most of us are rather reclusive and live peaceful lives in our secret realm. We only leave it in order to {protect} our home. ..."})
keywordHandler:addKeyword({'kind'}, StdModule.say, {npcHandler = npcHandler, text = "We call ourselves the fae. Some name us nature spirits or peri but we prefer the former term. Most of us are rather reclusive and live peaceful lives in our secret realm. We only leave it in order to {protect} our home. ..."})
keywordHandler:addKeyword({'protect'}, StdModule.say, {npcHandler = npcHandler, text = "I can sense a kind of dark energy lately. It is pervading this world, more and more every day. Yet I don't know where it arises from nor what we could do to dispel it."})
keywordHandler:addKeyword({'energy'}, StdModule.say, {npcHandler = npcHandler, text = "It is rather subversive, so most creatures won't sense it ... yet. But its corrosive power has already begun to affect my kind and our hidden realm in unpleasant ways."})
keywordHandler:addKeyword({'fae'}, StdModule.say, {npcHandler = npcHandler,
	text = {
		'Some call us nature spirits or peri but we prefer the term fae. Most of us are rather reclusive and live peaceful lives in our secret realm. We only leave it in order to protect our home. ...',
		'We tend to be secretive about our true nature, but I guess there was once an elven sage who visited our realm and put his experiences down on paper. There might be a book about the fae in the library of Ab\'Dendriel.'
	}}
)

npcHandler:setMessage(MESSAGE_GREET, "Nature's blessing, traveller! |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "May your path always be even.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "May your path always be even.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

