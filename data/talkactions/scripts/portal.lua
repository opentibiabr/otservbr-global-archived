function onSay(player, words, param)
 if not player:getGroup():getAccess() then
  return true
 end

 if player:getAccountType() < ACCOUNT_TYPE_GOD then
  return false
 end

 local tp = Game.createItem(1387, 1, player:getPosition())
 tp:setActionId(tonumber(param))
 return false
end