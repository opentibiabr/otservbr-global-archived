local updateFile = "data/update.lua"
dofile(updateFile)

local update = GlobalEvent("Update")
function update.onStartup()
	if updated then
		db.query("UPDATE `players` SET `posx` = 0, `posy` = 0, `posz` = 0;")
		local readFile = io.open(updateFile,'r')
		if readFile then
			io.input(readFile)
			local str = io.read()
			io.close(readFile)
			local ae = string.match(str,"updated=true(.+)")
			if ae then
				afterUpdate = 'updated=false'..ae
				local updateFile=io.open(updateFile, "w")
				io.output(updateFile)
				io.write(afterUpdate)
				io.close(updateFile)
			end
		end
	end
	return true
end
update:register()
