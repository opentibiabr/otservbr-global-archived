local rashid = GlobalEvent("spawn raids")
function rashid.onStartup()
   local days = {
      [1] = Position(32328, 31782, 6), --sunday
      [2] = Position(32207, 31155, 7), --monday
      [3] = Position(32300, 32837, 7), --tuesday
      [4] = Position(32577, 32753, 7), --wednesday
      [5] = Position(33066, 32879, 6), --thursday
      [6] = Position(33235, 32483, 7), --friday
      [7] = Position(33166, 31810, 6) --saturday
   }

   local day = os.date("*t").wday
   if days[day] then
      doCreateNpc("rashid", days[day])
   else
      print("[!] -> Cannot create Rashid. Day: " .. day .. ".")
   end
   return true
end
rashid:register()
