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


	if(msgcontains(msg, "friend")) then
		if(getPlayerStorageValue(cid, 10050) == 12) then
			selfSay("So you have proven yourself a true friend of our city. It's hard to believe but I think your words only give substance to suspicions my heart had harboured since quite a while. ...", cid)
			selfSay("So Harsin is probably not the person he appeared to be. Actually I haven't heard from him for quite a while. He was resident in the local bed and breakfast hotel. You should be able to find him there or at least to learn about his whereabouts.", cid)
            setPlayerStorageValue(cid, 10050, 13)
		   setPlayerStorageValue(cid, 30051, 1)
		   setPlayerStorageValue(cid, 30052, 0)
		end
	elseif(msgcontains(msg, "quandon")) then
		if(getPlayerStorageValue(cid, 10050) == 15) then
			selfSay("A transporter dead? This is more then alarming. It seems Harsin is up to something and whatever it is, it's nothing good at all. But not all is lost. A local medium, Barnabas, has truly the gift to speak to the dead. ...", cid)
			selfSay("I'll mark his home on your map. He should be able to get the information you need to locate Harsin.", cid)
            setPlayerStorageValue(cid, 10050, 16)
		   setPlayerStorageValue(cid, 30055, 0)
		end
		else
		selfSay("Already clicked the body on the house Roswitha ?", cid)

	end

	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
