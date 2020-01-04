local moveevent = MoveEvent()

function moveevent.onStepIn(player, item, position, fromPosition)

local condition = Condition(CONDITION_DROWN)
	condition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -20)
	condition:setParameter(CONDITION_PARAM_TICKS, -1)
	condition:setParameter(CONDITION_PARAM_TICKINTERVAL, 2000)
	
	if player:isPlayer() then
     if player:getCondition(CONDITION_DROWN,CONDITIONID_COMBAT) == nil then
     player:addCondition(condition)
     end
     if player:getStorageValue(17100) > os.time() then
     if player:getStorageValue(Storage.Others.DrownStorage) < 1 then
       player:changeSpeed(600)
       player:setStorageValue(Storage.Others.DrownStorage,1)
     end
     end
   end

   if(math.random(1, 10) == 1) then
     player:getPosition():sendMagicEffect(CONST_ME_BUBBLES)
   end
   return true
end

moveevent:id(5404,5405,5406,5407,5408,5409,5743,5744,5764,8755,8756,8757,9291)
moveevent:register()

local moveevent = MoveEvent()

function moveevent.onStepOut(player, item, position, fromPosition)
	local ids = {1949,5404,5405,5406,5407,5408,5409,5743,5744,5764,8755,8756,8757,9291}
	local pos = player:getPosition()
	local thing = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
	
	if player then
		if(isInArray(ids, thing.itemid)) then
			return true
		else
			player:removeCondition(CONDITION_DROWN)
       if player:getStorageValue(Storage.Others.DrownStorage) == 1 then
         player:changeSpeed(600 * (-1))
         player:setStorageValue(Storage.Others.DrownStorage, 0)
       end
     end
   end
   return true
end

moveevent:id(5404,5405,5406,5407,5408,5409,5743,5744,5764,8755,8756,8757,9291)
moveevent:register()
