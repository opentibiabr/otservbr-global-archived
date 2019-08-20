local function sendFalconSucess(position)
	position:sendMagicEffect(CONST_ME_POFF)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
local config = {
	anvilPos = target:getId(8671),
	anvil = target:getPosition(33363, 31342, 7),
	shielForged = 32422,
	GrantArms = player:getItemCount(32521),
	Cloth = player:getItemCount(32518),
}
	
		if config.GrantArms < 1 then
			return false
		end
	
		if config.Cloth < 1 then
			return false
		end

		if config.anvil and config.anvilPos then
        player:removeItem(config.GrantArms, 1)  
        player:removeItem(config.Cloth, 1)  
        player:addItem(config.shielForged, 1)  
		item:remove(1)    
		return true
	else
	end
	return true
end
