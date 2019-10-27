function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local points = 1
      db.query("UPDATE `accounts` SET `coins` = `coins` + '" .. points .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
      player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..points.." tibia coin(s)")
      item:remove(1)
      return true
    end