function onUse(player, item, fromPosition, target, toPosition, isHotkey)
  local kit = item.actionid
  if not kit then
    return false
  end

  if fromPosition.x == CONTAINER_POSITION then
    player:sendTextMessage(MESSAGE_STATUS_SMALL, "Put the construction kit on the floor first.")
  elseif not fromPosition:getTile():getHouse() then
    player:sendTextMessage(MESSAGE_STATUS_SMALL, "You may construct this only inside a house.")
  else
    item:transform(kit)
    fromPosition:sendMagicEffect(CONST_ME_POFF)
    player:addAchievementProgress('Interior Decorator', 1000)
  end
  return true
end
