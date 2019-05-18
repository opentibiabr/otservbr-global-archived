function onStartup()

   --RASHID
   local days =
   {
      [1] = {x = 32328, y = 31782, z = 6}, --Sunday // Domingo
      [2] = {x = 32207, y = 31155, z = 7}, --Monday // Lunes
      [3] = {x = 32300, y = 32837, z = 7}, --Tuesday // Martes
      [4] = {x = 32577, y = 32753, z = 7}, --Wednesday // Miercoles
      [5] = {x = 33066, y = 32879, z = 6}, --Thursday // Jueves
      [6] = {x = 33235, y = 32483, z = 7}, --Friday // Viernes
      [7] = {x = 33166, y = 31810, z = 6} --Saturday // Sabado
   }
 
   local day = os.date("*t").wday
   if days[day] then
      doCreateNpc("Rashid", days[day])
   else
      print("[!] -> Cannot create Rashid. Day: " .. day .. ".")
   end
   return true
end