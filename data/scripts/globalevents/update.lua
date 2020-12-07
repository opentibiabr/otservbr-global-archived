dofile("update.lua")

local update = GlobalEvent("update")
function update.onStartup()
	if (updated) then
		db.query("UPDATE `players` SET `posx` = 0;")
		db.query("UPDATE `players` SET `posy` = 0;")
		db.query("UPDATE `players` SET `posz` = 0;")
		local f = io.open('update.lua','r')
		if f then
			local str = f:read()
			f:close()
			local ae = string.match(str,"updated=true")
			if ae then
				file = 'updated=false'
				local f = io.open('update.lua','w')
				if f then
					f:write(file)
					f:close()
				end
			end
		end
	end
	return true
end
update:register()
