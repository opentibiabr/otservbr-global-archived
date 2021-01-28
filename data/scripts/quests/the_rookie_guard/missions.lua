-- The Rookie Guard Quest

-- Missions shared tiles (Handled together due not possible more than one MoveEvent per action id)

local missionTiles = {
	-- North exit
	[50312] = {
		{
			mission = Storage.TheRookieGuard.Mission02,
			states = {1, 2, 3, 4},
			message = "This road is the main access of the village. You might want to finish your business here first."
		},
		{
			mission = Storage.TheRookieGuard.Mission03,
			states = {1},
			message = "This road is the main access of the village. You might want to finish your business here first."
		}
	},
	-- North bridge exit
	[50319] = {
		{
			mission = Storage.TheRookieGuard.Mission04,
			states = {2},
			message = "Follow the path to the east to find Hyacinth's little house.",
			arrowPosition = {x = 32096, y = 32169, z = 7}
		}
	}
}

-- Missions tutorial tiles

local missionGuide = MoveEvent()

function missionGuide.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local missionTile = missionTiles[item.actionid]
	-- Check mission cases for the tile
	for i = 1, #missionTile do
		local missionState = player:getStorageValue(missionTile[i].mission)
		-- Check if need display message/arrow
		if missionState ~= -1 and table.find(missionTile[i].states, missionState) ~= nil then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, missionTile[i].message)
			if missionTile[i].arrowPosition then
				Position(missionTile[i].arrowPosition):sendMagicEffect(CONST_ME_TUTORIALARROW)
			end
			break
		end
	end
	return true
end

for index, value in pairs(missionTiles) do
	missionGuide:aid(index)
end
missionGuide:register()
