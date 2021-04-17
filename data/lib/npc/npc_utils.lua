-- Utils functions for NPC System
local travelDiscounts = {
	['postman'] = {price = 10, storage = Storage.Postman.Rank, value = 3},
	['new frontier'] = {price = 50, storage = Storage.TheNewFrontier.Mission03, value = 1}
}

function travelDiscount(player, discounts)
	local discountPrice, discount = 0
	if type(discounts) == 'string' then
		discount = travelDiscounts[discounts]
		if discount and player:getStorageValue(discount.storage) >= discount.value then
			return discount.price
		end
	else
		for i = 1, #discounts do
			discount = travelDiscounts[discounts[i]]
			if discount and player:getStorageValue(discount.storage) >= discount.value then
				discountPrice = discountPrice + discount.price
			end
		end
	end

	return discountPrice
end

function Player:removeMoneyNpc(amount)
	if type(amount) == 'string' then
		amount = tonumber(amount)
	end

	local moneyCount = self:getMoney()
	local bankCount = self:getBankBalance()

	-- The player have all the money with him
	if amount <= moneyCount then
		-- Removes player inventory money
		self:removeMoney(amount)

		self:sendTextMessage(MESSAGE_TRADE, ("Paid %d gold from inventory."):format(amount))
		return true

	-- The player doens't have all the money with him
	elseif amount <= (moneyCount + bankCount) then

		-- Check if the player has some money
		if moneyCount ~= 0 then
			-- Removes player inventory money
			self:removeMoney(moneyCount)
			local remains = amount - moneyCount

			-- Removes player bank money
			self:setBankBalance(bankCount - remains)

			self:sendTextMessage(MESSAGE_TRADE, ("Paid %d from inventory and %d gold from bank account. Your account balance is now %d gold."):format(moneyCount, amount - moneyCount, self:getBankBalance()))
			return true

		else
			self:setBankBalance(bankCount - amount)
			self:sendTextMessage(MESSAGE_TRADE, ("Paid %d gold from bank account. Your account balance is now %d gold."):format(amount, self:getBankBalance()))
			return true
		end
	end

	return false
end

function Npc:chargePlayer(player, cost, message)
    if not player:removeMoneyNpc(cost) then
        self:talk(player, message or "You do not have enough money!")
        return false
    end
    return true
end
