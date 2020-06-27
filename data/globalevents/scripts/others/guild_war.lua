function onThink(interval)
	local time = os.time()
	db.query("UPDATE `guild_wars` SET `status` = 4, `ended` = " .. time .. " WHERE `status` = 1 AND (`started` + 5 * 60 * 60) < " .. time)
	return true
end
