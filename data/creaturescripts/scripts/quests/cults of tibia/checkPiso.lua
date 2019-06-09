function onThink(creature, interval)
	if creature:getName():lower() == 'the corruptor of souls' then
		if Game.getStorageValue('checkPiso') < os.time() then
			local pos = creature:getPosition()
			Game.setStorageValue('healthSoul', creature:getHealth())
			creature:remove()
			Game.createMonster('the remorseless corruptor', pos)
		end
	end
	return true
end
