--[[
IMPORTANT, READ
This script is the registration table for action, unique and script variables, note that it is used to create action and unique in game by Lua. The script responsible for this load is found in the folder data/scripts/globalevents/load_attributes.lua 

For example:
{actionId = 101, itemId = 355, itemPos = Position (32774, 32289, 10)},

]]

ActionTable = {
--[[
Action IDS
It is advisable to use actionID only if you need to create a function that is called multiple times in different locations.
The action is also used as storage, x storage is added in the player and the same action number gives access to a door, for example.

Reserved player action storage key ranges (const.h at the source)
[10000000 - 20000000]
[1000 - 1500]
[2001 - 2011]

Others reserved player action storages
[100 = it is locked door]
[1000 = level door. Here 1 must be used followed by the level. Example: 1010 = level 10, 1100 = level 100] 
]]
	{actionId = xxxxx, itemId = xxxx, itemPos = Position(xxxxx, xxxxx, xx)},
	
}

UniqueTable = {
--[[ 
Unique IDS
As the name implies, it should be used in unique functions, where they should only be repeated once per action. It is advisable to use the uniques, because when repeated their use, the log of the repetition is returned in distro. It also does not risk conflicting with storages and other types of actions.

]]
	-- The first dragon quest.
	[24890] = {itemId = 9059, itemPos = Position(33140,32654,7), storage = Storage.FirstDragon.DesertTile, msg = "You enter the beautiful oasis. By visiting this sacred site you're infused with the power of water bringing life to the desert."},-- Oasis Desert
	[24891] = {itemId = 2740, itemPos = Position(32348,31691,7), storage = Storage.FirstDragon.StoneSculptureTile, msg = "You enter the circle of trees and flowers. By visiting this sacred site you're infused with the power of nature and plants."},-- The Stone Sculpture
	[24892] = {itemId = 9043, itemPos = Position(32697, 31719, 7), storage = Storage.FirstDragon.SuntowerTile, msg = "You entered the suntower of Ab'dendriel. By visiting this sacred site you're infused with the power of the life-giving sun."},-- Suntower

}