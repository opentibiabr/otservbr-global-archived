local fa_exhaust = {}
local fa_exhaust_time = 60 -- em segundos
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
 if isHotkey or fromPosition.x == CONTAINER_POSITION and fromPosition.y == 2 then
  local name = player:getName()
  if not fa_exhaust[name] or fa_exhaust[name] <= os.time() then
   if math.random(2) == 1 then
    player:addHealth(1000)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "1000 HP has been restored.")
   else 
    player:addMana(1000)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "1000 MP has been restored.")
   end
   fa_exhaust[name] = os.time() + fa_exhaust_time
  end
 end
 return true
end