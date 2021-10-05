function Party.broadcastPartyLoot(self, text, oldClientText)
	local leader = self:getLeader()
	leader:sendTextMessage(MESSAGE_LOOT, leader:getClient().version >= 1200 and text or oldClientText)
	if leader:getClient().version < 1200 then
		leader:sendTextMessage(MESSAGE_GUILD, oldClientText, 9)
	end
	local membersList = self:getMembers()
	for i = 1, #membersList do
		local player = membersList[i]
		if player then
			player:sendTextMessage(MESSAGE_LOOT, player:getClient().version >= 1200 and text or oldClientText)
			if player:getClient().version < 1200 then
				player:sendTextMessage(MESSAGE_GUILD, oldClientText, 9)
			end
		end
	end
end
