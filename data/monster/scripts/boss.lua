function onCreatureAppear(self, creature)
    if self == creature then
        if self:getType():isRewardBoss() then
            self:setReward(true)
        end
    end
end
