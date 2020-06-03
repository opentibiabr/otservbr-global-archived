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

keywordHandler:addKeyword({"job"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm a priestess of Zathroth."
	}
)
keywordHandler:addKeyword({"Zathroth"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
			"You misled fools know nothing about the truth. The lies that your temples feed you have poisoned your mind! ...",
			"Zathroth is the source of everything. When the other gods hesitated to do the necessary to start \z
            creation it was Zathroth who stepped forward and took it upon him to commit the great sacrifice."
	}}
)
keywordHandler:addKeyword({"truth"}, StdModule.say,
	{
		npcHandler = npcHandler,
        text = {
            "Even before the priests of Zathroth were banished from the cities, they spread lies to poison the \z
            mind of the people. ...",
            "When the priests had left it became even worse, and now after several generations of lies and propaganda, \z
            all what is left in the minds of the people is a fabricated scarecrow."
    }}
)
keywordHandler:addKeyword({"sacrifice"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Zathroth teaches us that without sacrifice there is no progress and everything you gain is \z
        connected to a burden."
	}
)
keywordHandler:addKeyword({"burden"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "burden comes in many shapes. Often it is the burden of knowledge. Sometimes it is the burden of necessity."
	}
)
keywordHandler:addKeyword({"creators"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "There is no knowledge that is forbidden. If you are powerful enough to take it, it is yours. Be aware though \z
            that knowledge for the sake of knowing alone is a sin in the eyes of Zathroth. ...",
            "Those who 'know' are entitled to act! The more you understand the more you are responsible to change things \z
            even when the ignorant world will blame you for that."
    }}
)
keywordHandler:addKeyword({"necessity"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Doing the necessary is always a burden. Ignorant people will blame and fear you for your actions. Some things \z
            that have to be done are not going to make you popular. ...",
            "More often than not people won't understand your actions. Often it is not possible to explain things at all."
    }}
)
keywordHandler:addKeyword({"edron"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "This isle holds many secrets. You will have to figure them out on your own though. Knowledge comes \z
        only to the worthy."
	}
)
keywordHandler:addKeyword({"demon"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The word 'demon' is extremely imprecise. It is like a baby calling everything with four legs a 'cow'. ...",
            "There are demons that are more a tool than a sentient being. Then there are demons whose intellect dwarfs \z
            the greatest minds of humanity. ...",
            "Some are unique, others belong to races and subspecies and even in a given demon race the differences \z
            might be extreme."
    }}
)

npcHandler:setMessage(MESSAGE_GREET, "Be greeted in peace ... for now.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Zathroth is watching you.")

npcHandler:addModule(FocusModule:new())
