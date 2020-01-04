local moveevent = MoveEvent()

function moveevent.onAddItem(moveitem, tileitem, position)
	
	local config ={"Teleport79", "Teleport80", "Teleport81", "Teleport82", "Teleport83", "Teleport84", "Teleport85", "Teleport86"}

	for k, key in pairs(config) do
	local setting = GlobalConfig[key]
		if setting.uniqueId == item.uid then
			if moveitem.itemid ~= 3042 then
				position:sendMagicEffect(CONST_ME_POFF)
				return true
			end
		end
	end

	moveitem:remove()
	position:sendMagicEffect(CONST_ME_HITBYFIRE)

	Tile(setting.teleportPosition):relocateTo(setting.destination)
	setting.destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

moveevent:id(2114)
moveevent:register()
