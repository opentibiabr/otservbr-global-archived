local lvl_to_buy_house = 150

function onSay(player, words, param)
	local housePrice = configManager.getNumber(configKeys.HOUSE_PRICE)
	if housePrice == -1 then
		return true
	end
		
	if player:getLevel() < lvl_to_buy_house then
           player:sendCancelMessage("You have to be level "..lvl_to_buy_house.." to purchase a house.")
        return false
    end
	
	if not player:isPremium() then
		player:sendCancelMessage("You need a premium account to buy a house.")
		return false
	end
	
	local position = player:getPosition()
	position:getNextPosition(player:getDirection())

	local tile = Tile(position)
	local house = tile and tile:getHouse()
	
	if not house then
		player:sendCancelMessage("Please face the door of the house you would like to buy.")
		return false
	end
	
	if house == player:getHouse() then
		player:sendCancelMessage("You already own this house.")
		return false
	end
	
	if house:getOwnerGuid() > 0 then
		player:sendCancelMessage("This house already has an owner.")
		return false
	end
	
	if player:getHouse() then
		player:sendCancelMessage("You already own " .. player:getHouse():getName() .. ".")
		return false
	end

	local price = tonumber(house:getTileCount() * housePrice)
	
	if (player:getBankBalance() >= price) then
		player:setBankBalance(player:getBankBalance() - price)
		house:setOwnerGuid(player:getGuid())
		
		local rentPeriod = configManager.getString(configKeys.HOUSE_RENT_PERIOD)
	
		if rentPeriod ~= "never" then
			rentString = " Be sure to have " .. price .. " gold in your bank account for the " .. rentPeriod .. " rent."
		else
			rentString = ""
		end
		
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You bought " .. house:getName(tile) .. " for " .. price .. " gold from your bank account." .. rentString)
		return true
	else
		player:sendCancelMessage("You do not have enough money.")
		return false
	end
	
	return false
end
