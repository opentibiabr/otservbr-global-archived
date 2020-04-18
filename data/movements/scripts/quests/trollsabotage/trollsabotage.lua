function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
		local actionid = {first=189,second=190} --action piso invisivel 
		local config = {from={x=33231,y=31759,z=2,id=actionid.first},to={x=33231,y=31763,z=2,id=actionid.second}} -- posição do sqm antes do piso invisivel
		local feetItem = player:getSlotItem(CONST_SLOT_FEET)  --checar boh
		if feetItem and isInArray({2195}, feetItem.itemid) then --checar boh
			if (config.from.x == config.to.x or config.from.y == config.to.y) and config.from.z == config.to.z then --checagem do linha
				if item.actionid == config.from.id then  --checagem do lado
					player:teleportTo(config.to)
				else
					player:teleportTo(config.from)					
				end
				if config.from.x == config.to.x then --- efeitos volta
					for a = config.from.x,config.to.x do
						for b = config.from.y+1,config.to.y-1 do
							doSendMagicEffect({x=a,y=b,z=config.to.z},3)
						end
					end
				else
					for a = config.from.x+1,config.to.x-1 do --efeitos ida
						for b = config.from.y,config.to.y do
							doSendMagicEffect({x=a,y=b,z=config.to.z},3)
						end
					end
				end
			end
		else
			player:say("You don't dare jump over that gap.", TALKTYPE_MONSTER_SAY)
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	
	return true
end