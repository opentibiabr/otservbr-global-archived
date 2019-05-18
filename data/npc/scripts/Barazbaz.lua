 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	
	
	if(msgcontains(msg, "ritual")) then
		if(getPlayerStorageValue(cid, 10050) == 6) then
			selfSay("Ancient structures in the sewers you say? Well, our city has had a certain bloody past, even before it has been city at all. But to investigate the archives for what you may have found is a time-consuming process. ...", cid)
			selfSay("Usually, I'm too much bound to my duties to the city to sacrifice time for such an endeavour. ...", cid)
			selfSay("But on the other hand, just now is the time of an important decision of the magistrate concerning the funding of the archives. It is a matter easily overlooked by our good citizens. ...", cid)
 			selfSay("If you'd be so kind to place just one of your votes for the funding of the archives, I would be inclined to take the time for your investigation in turn. ...", cid)
			selfSay("Just go to Marvin in the magistrate and vote for a greater funding of the archives. Afterwards, I might be able to present you with some first results of my investigations on your behalf.", cid)
           setPlayerStorageValue(cid, 10050, 7)
		   setPlayerStorageValue(cid, 20056, 1)
		   setPlayerStorageValue(cid, 20057, 0)
		end
	elseif(msgcontains(msg, "abandoned sewers")) then
		if(getPlayerStorageValue(cid, 10050) == 7) then
			selfSay("Excellent! Concerning the ancient ruins that you have found, well, if you are not familiar with the city's history, feel free to browse a few books here. I will only refer to some basics here, so I don't waste your time. ...", cid)
			selfSay("The first humans that lived here and that we have any records of lived in slavery of an ancient evil. ...", cid)
			selfSay("The nature of this evil is up to debate, but there are hints that this evil predated the settlement of men and that it perhaps was part of a more ancient civilisation or caused the downfall of the latter. ...", cid)
 			selfSay("After that evil had been overcome, much was sealed away. Some say that only forbidden knowledge had been sealed, but others like me were always worried that more had been hidden. ...", cid)
			selfSay("Something like the ruins you have found. What you have seen there hints to a new incident, though. As if someone or something was searching for something. In the past, when those ruins were buried, people were primitive and superstitious. ...", cid)
			selfSay("Today, we have advanced far more and could have the ruins investigated in a far more efficient way. And that is what I would just recommend you to do: get a necrometer from magistrate Jondrin upstairs and investigate the ruins thoroughly.", cid)
			setPlayerStorageValue(cid, 10050, 9)
		   setPlayerStorageValue(cid, 20058, 1)
		   setPlayerStorageValue(cid, 20059, 0)
		end
		
	elseif(msgcontains(msg, "notebook")) then
		if(getPlayerStorageValue(cid, 10050) == 9) then
				selfSay(" I know that handwriting you describe! It belongs to a traveller from far away. Magistrate Sholley introduced him to me and she was quite excited to learn more about our city's past. ...", cid)
			selfSay("I should have thought of him right in the beginning when I heard the stuff you mentioned. But I haven't seen him for a while. You should ask Sholley about her friend to learn about his whereabouts.", cid)
			setPlayerStorageValue(cid, 10050, 13)
		   setPlayerStorageValue(cid, 30050, 1)
		   setPlayerStorageValue(cid, 30051, 0)
		end	
else
	selfSay("You need to kill the {The Ravager}, click on statue and then come here say {ritual}, {abandoned sewers}, {notebook} and after this find Roswitha and talk with she.", cid)	
	end

	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
