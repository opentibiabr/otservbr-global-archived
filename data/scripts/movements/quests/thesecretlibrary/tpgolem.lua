local tpgolem = MoveEvent()

function tpgolem.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.TheSecretLibrary.Mota) == 10 then
		player:setStorageValue(Storage.TheSecretLibrary.Mota, 11)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"rdmqswdmtpstaampisirdsdmlmuprmveqerrdeqsxajuqevsnjtaswejjqktqdrdsephjelilsqqtlibtasrdsrpurd")
	end
	
	return true
end

tpgolem:aid(26688)
tpgolem:register()