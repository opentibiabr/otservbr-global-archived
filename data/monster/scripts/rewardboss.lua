function onCreatureAppear(self, creature)
	if self:getType():isRewardBoss() then
		self:setReward(true)
	end
end
