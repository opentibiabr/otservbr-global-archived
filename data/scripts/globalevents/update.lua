dofile("data/update.lua")

local update = GlobalEvent("update")
function update.onStartup()
	if (updated) then
		db.query("UPDATE `players` SET `posx` = 0, `posy` = 0, `posz` = 0;")
		local updateFile = io.open('data/update.lua','r')
		if updateFile then
			local str = updateFile:read()
			updateFile:close()
			local ae = string.match(str,"updated=true")
			if ae then
				afterUpdate = 'updated=false'
				local updateFile = io.open('data/update.lua','w')
				if updateFile then
					updateFile:write(afterUpdate)
					updateFile:close()
				end
			end
		end
	end
	return true
end
update:register()
