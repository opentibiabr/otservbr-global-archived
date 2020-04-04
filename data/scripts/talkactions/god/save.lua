local talk = TalkAction("/save")

local savingEvent = 0
function save(delay)
	saveServer()
	if delay > 0 then
		savingEvent = addEvent(save, delay, delay)
	end
end

function talk.onSay(player, words, param)
	if player:getGroup():getAccess() then
		if isNumber(param) then
			stopEvent(savingEvent)
			save(tonumber(param) * 60 * 1000)
		else
			saveServer()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Server is saved ...")
		end
	end
end

talk:separator(" ")
talk:register()
