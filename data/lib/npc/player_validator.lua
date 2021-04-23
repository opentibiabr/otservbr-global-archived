PlayerValidator = {}
setmetatable(PlayerValidator, {
  __call =
  function(self, configs, player)
     if not player or not player:isPlayer() then
        error("PlayerValidator needs a valid player to run")
     end

     for _,parse in pairs(self) do
        if not parse(configs, player) then
           return false
        end
     end
     return true
  end
})

PlayerValidator.validateMoney = function (configs, player)
   if not configs.moneyAmount then return true end
   return player:getTotalMoney() >= configs.moneyAmount
end

PlayerValidator.validatePosition = function (configs, player)
   if not configs.position then return true end
   return player:getPosition() == configs.position
end

PlayerValidator.validateItems = function (configs, player)
   for itemId, count in pairs(configs.items) do
      if player:getItemCount(itemId) < count then
         return false
      end
   end
   return true
end

PlayerValidator.validateStorages = function (configs, player)
   for storage, value in pairs(configs.storages) do
      if player:getStorageValue(storage) ~= value then
         return false
      end
   end
   return true
end

PlayerValidator.validateCallbacks = function (configs, player)
   for _, callback in pairs(configs.callbacks) do
      if not callback(player) then
         return false
      end
   end
   return true
end