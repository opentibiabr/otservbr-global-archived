function onKill(creature, target, item)
	if not creature or not creature:isPlayer() then
		return true
	end
	if not target or not target:isMonster() then
		return true
	end

	local cName = target:getName():lower()



	if(isInArray({'cult enforcer', 'cult believer', 'cult scholar'}, cName)) then
		local posCorpo = target:getPosition()
		local rand = math.random(1,2)
		if rand == 1 then
			Game.createItem(26140, 1, posCorpo):setActionId(5580)
			addEvent(function()
			local portal1 = Tile(posCorpo):getItemById(26140)
			portal1:remove(1) end, 1*60*1000, 26140, 1, posCorpo)
		end
		if rand == 2 then
			Game.createItem(26138, 1, posCorpo):setActionId(5580)
			addEvent(function()
			local portal2 = Tile(posCorpo):getItemById(26138)
			portal2:remove(1) end, 1*60*1000, 26138, 1, posCorpo)
		end
	end

	return true
end
