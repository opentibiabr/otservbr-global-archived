function onKill(creature, target, item)
	if not creature or not creature:isPlayer() then
		return true
	end
	if not target or not target:isMonster() then
		return true
	end

	local cName = target:getName():lower()

	if(table.contains({'cult enforcer', 'cult believer', 'cult scholar'}, cName)) then
		local corpsePosition = target:getPosition()
		local rand = math.random(1,2)
		if rand == 1 then
			Game.createItem(26140, 1, corpsePosition):setActionId(5580)
			addEvent(function()
			local teleport1 = Tile(corpsePosition):getItemById(26140)
			teleport1:remove(1) end, (1*60*1000), 26140, 1, corpsePosition)
		end
		if rand == 2 then
			Game.createItem(26138, 1, corpsePosition):setActionId(5580)
			addEvent(function()
			local teleport2 = Tile(corpsePosition):getItemById(26138)
			teleport2:remove(1) end, (1*60*1000), 26138, 1, corpsePosition)
		end
	end
	return true
end
