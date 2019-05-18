local Days = {
		["Monday"] = { 
	Position = {x = 31254, y = 32604, z = 9} --Minos
	},
		["Tuesday"] = {
		Position = {x = 33459, y = 31715, z = 9} --Catacombs
	},
		["Wednesday"] = {
		Position = {x = 31061, y = 32605, z = 9} --Golem
	},
		["Thursday"] = {
		Position = {x = 33459, y = 31715, z = 9} --Catacombs
	},
		["Friday"] = {
		Position = {x = 33459, y = 31715, z = 9} --Catacombs
	},
		["Saturday"] = {
		Position = {x = 31254, y = 32604, z = 9} --Minos
	},
		["Sunday"] = {
		Position = {x = 33459, y = 31715, z = 9} --Catacombs
	},
}

	function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
			local Teleport = Days[os.date("%A")]
			if Teleport then
			doTeleportThing(cid, Teleport.Position, true)
			doSendMagicEffect(getCreaturePosition(cid), 9)
			doCreatureSay(cid, "Slrrp!", TALKTYPE_ORANGE_1)
		end
	return true
end 
