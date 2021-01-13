function Party.broadcastPartyLoot(self, text, oldClientText)
	self:getLeader():sendTextMessage(MESSAGE_LOOT, self:getLeader():getClient().version > 1200 and text or oldClientText)
	local membersList = self:getMembers()
	for i = 1, #membersList do
		local player = membersList[i]
		if player then
			player:sendTextMessage(MESSAGE_LOOT, player:getClient().version > 1200 and text or oldClientText)
		end
	end
end
