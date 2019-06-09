local teleports = {
    { actionId = 3200, position = Position(33672, 32228, 7) }, -- summer entry
    { actionId = 3201, position = Position(33584, 32208, 7) }, -- summer exit
    { actionId = 3202, position = Position(33675, 32148, 7) }, -- winter entry
    { actionId = 3203, position = Position(32354, 31248, 3) }, -- winter exit
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

    for _, tps in pairs(teleports) do
        if item.actionid == tps.actionId then
            player:teleportTo(tps.position)
        end
    end

end
