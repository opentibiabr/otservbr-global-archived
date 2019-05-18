function onSay(player, words, param)
    if not player:getGroup():getAccess() then
        return true
    end
 
	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
  
    for _, house in ipairs(Game.getHouses()) do
        if house:getOwnerGuid() == 0 then
            --
        else
            house:setOwnerGuid(0)
            house:setAccessList(256, "")
            house:setAccessList(257, "")
            house:setAccessList(1, "")
        end
    end
   
    print("Items moved to depot.")
   
    return false
end