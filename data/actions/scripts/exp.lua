local STORAGE = 61398
local TIME = 60 * 60 * 12 -- tempo em horas
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
 local cur = math.max(player:getStorageValue(STORAGE) - os.time(), 0)
 player:setStorageValue(61398, os.time() + cur + TIME)
 item:remove(1)
 player:sendTextMessage(MESSAGE_INFO_DESCR, "You've activated Experience Card.") 
 player:getPosition():sendMagicEffect(15)
 return true
end