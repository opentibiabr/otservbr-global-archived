-- Advanced Storage System

function getStorage(self, key)
  if not isPlayer(self) then
    return false
  end

  if not key or not type(key) == "string" then
    return false
  end

  local result = db.getResult("SELECT * FROM `advanced_storage` WHERE `guid` = '".. self:getGuid() .."' AND `key` = '".. key .."';")

  if result:getID() == -1 then
    return false
  end

  local value = result:getDataString("value")

  if not value then
    return false
  end

  return value
end

function registerStorage(self, key, value)
  if not isPlayer(self) then
    return false
  end

  if value and self:getStorage(key) then
    db.query("UPDATE `advanced_storage` SET `value` = '" .. value .. "' WHERE `guid` = '" .. self:getGuid() .. "' AND `key` = '" .. key .. "';")
  elseif not value and self:getStorage(key) then
    db.query("DELETE FROM `advanced_storage` WHERE `guid` = '" .. self:getGuid() .. "' AND `key` = '" .. key .. "';")
  elseif value and not self:getStorage(key) then
    db.query("INSERT INTO `advanced_storage` (`guid`, `key`, `value`) VALUES (" .. self:getGuid() .. ", '" .. key .. "',  '" .. value .. "');")
  elseif not value and not self:getStorage(key) then
    return false
  end

  return true
end

Player.registerStorage = registerStorage
Player.getStorage = getStorage