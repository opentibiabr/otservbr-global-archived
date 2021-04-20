require "player_processor_interface";
PlayerValidator = PlayerProcessorInterface:new()

function PlayerValidator:new(player)
   obj = PlayerProcessorInterface:new(player)

   obj.valid = true

   setmetatable(obj, self)
   self.__index = self
   return obj
end

function PlayerValidator:execute()
   self:validateMoney()
   self:validatePosition()
   self:validateItems()
   self:validateStorages()

   return self.valid
end

function PlayerValidator:validateMoney()
   if not self.valid then return end
   self.valid = self.player:getTotalMoney() >= self.moneyAmount
end

function PlayerValidator:validatePosition()
   if not self.valid then return end
   self.valid = self.player:getPosition() == self.position
end

function PlayerValidator:validateItems()
   for itemId, count in pairs(self.items) do
      if not self.valid then return end
      self.valid = self.player:getItemCount(itemId) >= count
   end
end

function PlayerValidator:validateStorages()
   for storage, value in pairs(self.storages) do
      if not self.valid then return end
      self.valid = self.player:getStorageValue(storage) == value
   end
end

function PlayerValidator:validateCallbacks()
   for _, callback in pairs(self.callbacks) do
      if not self.valid then return end
      self.valid = callback(self.player)
   end
end