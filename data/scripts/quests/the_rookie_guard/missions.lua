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
		},
		{
			mission = Storage.TheRookieGuard.Mission06,
			states = {2},
			message = "Follow the path east, and when it splits, head north-east to find the wolf forest.",
			arrowPosition = {x = 32094, y = 32169, z = 7}
		},
		{
			mission = Storage.TheRookieGuard.Mission09,
			states = {1},
			message = "Follow the path to the north past the hill to reach the troll caves.",
			arrowPosition = {x = 32091, y = 32166, z = 7}
		}
	},
	-- Outer east tiles
	[50323] = {
		{
			mission = Storage.TheRookieGuard.Mission05,
			states = {1},
			message = "This is not the way to the tarantula's lair. Head northwest and go up the little ramp."
		},
		{
			mission = Storage.TheRookieGuard.Mission09,
			states = {1},
			message = "This is not the way to the troll caves. Follow the path to the north past the hill to reach them.",
			arrowPosition = {x = 32091, y = 32166, z = 7}
		}
	},
	-- North-west drawbridge
	[50325] = {
		{
			mission = Storage.TheRookieGuard.Mission05,
			states = {1},
			message = "Walk to the north and down the stairs to reach the tarantula's lair.",
			arrowPosition = {x = 32069, y = 32145, z = 6}
		}
	},
	-- Academy entrance
	[50335] = {
		{
			mission = Storage.TheRookieGuard.Mission07,
			states = {1},
			message = "The library vault is below the academy. Go north and head down several stairs until you find a quest door.",
			arrowPosition = {x = 32097, y = 32197, z = 7}
		},
		{
			mission = Storage.TheRookieGuard.Mission08,
			states = {1},
			message = "The bank is below the academy. Go north and head down the stairs and to the right.",
			arrowPosition = {x = 32097, y = 32197, z = 7}
		}
	},
	-- Academy downstairs
	[50336] = {
		{
			mission = Storage.TheRookieGuard.Mission07,
			states = {1},
			message = "Head through the northern door and follow the hallways to find the library vault.",
			arrowPosition = {x = 32095, y = 32188, z = 8}
		},
		{
			mission = Storage.TheRookieGuard.Mission08,
			states = {1},
			message = "Go to the right to find the bank and talk to Paulie.",
			arrowPosition = {x = 32100, y = 32191, z = 8}
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
