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

keywordHandler:addKeyword({'deep'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "As far as I know it is a place of helish heat with bloodthirsty monsters of all kinds."
	}
)
keywordHandler:addKeyword({'monument'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Well, a while ago powerful magic devices were used all around Tibia. These are chargeable compasses. \z
			There was but one problem: they offered the possibility to make people rich in a quite easy way. ...",
			"Therefore, these instruments were very coveted. People tried to get their hands on them at all costs. \z
			And so it happened what everybody feared - bloody battles forged ahead. ...",
            "To put an end to these cruel escalations, eventually all of the devices were collected and destroyed. \z
			The remains were buried deep in the earth."
    }}
)
keywordHandler:addKeyword({'sarcophagus'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "This sarcophagus seals the entrance to the caves down there. Only here you can get all the \z
		materials you need for a working compass of this kind. So no entrance here - \z
		no further magic compasses in Tibia. In theory."
	}
)
keywordHandler:addKeyword({'materials'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Only in the cave down there you will find the materials you need to repair the compass. \z
			Now you know why the entrance is sealed. There's the seal, but I have a deal for you: ...",
			"I can repair the compass for you if you deliver what I need. Besides the broken compass \z
			you have to bring me the following materials: 50 blue glas plates, 15 green glas plates \z
			and 5 violet glas plates. ...",
            "They all can be found in this closed cave in front of you. \z
			I should have destroyed this seal key but things have changed. \z
			The entrance is opened now, go down and do what has to be done."
    }}
)
keywordHandler:addKeyword({'down'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "On first glance, this cave does not look very spectacular, but the things you find in there, are. \z
		You have to know that this is the only place where you can find the respective \z
		materials to build the compass."
	}
)
keywordHandler:addKeyword({'compass'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It was decided to collect all of the compasses, destroy them and throw them in \z
		the fiery depths of Tibia. I still have some of them here. I sell them for a low price if you want."
	}
)
keywordHandler:addKeyword({'depths'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "As far as I know it is a place of helish heat with bloodthirsty monsters of all kinds."
	}
)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'sell') then
		npcHandler:say('Would you like to buy a broken compass for 10.000 gold?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Here's your broken compass!", cid)
			player:removeMoneyNpc(10000)
			player:addItem(29047, 1)
		else
			npcHandler:say("You don't have enough money.", cid)
		end
			npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello, I am the warden of this monument. The sarcophagus in front of you \z
was established to prevent people from going down there. But I doubt that this step is sufficient.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good Bye |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())