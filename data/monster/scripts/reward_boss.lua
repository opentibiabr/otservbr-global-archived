function onCreatureAppear(self, creature)
	if self:getType():isrewardBoss() then
		self:setReward(true)
	end
end
