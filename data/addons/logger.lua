g_logger = {}

function g_logger.createUniqueLog(name, information)
  if g_config.doLogGeneralStuff then
    local result = db.getResult("SELECT * FROM `general_log` WHERE `name` = '".. name .."';")

    if (result:getID() ~= -1) then
      db.query("DELETE FROM `general_log` WHERE `name` = '" .. name .. "';")
    end

    db.query("INSERT INTO `general_log` (`name`, `information`, `date`) VALUES ('" .. name .. "', '" .. information .. "', " .. os.time() .. ");")
  end
end

function g_logger.getLogInfo(name)
  local result = db.getResult("SELECT * FROM `general_log` WHERE `name` = '".. name .."';")

  if (result:getID() ~= -1) then
    return result:getDataString("information"), os.date(result:getDataInt("date"))
  end

  return false
end
