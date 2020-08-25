local xml_monster_dir = 'data/world/otservbr-spawn.xml' -- Diretório do arquivo onde contém os monstros.
local new_file_name = 'data/modules/scripts/prey_system/prey_AllMonsters.lua'
local open_file = io.open(xml_monster_dir, "r")
local writing_file = io.open(new_file_name, "w+")
local file_read = open_file:read("*all")

open_file:close()
local monsters = {}
	for str_match in file_read:gmatch('<monster name="(.-)"') do
	local ret_table = monsters[str_match]
		if ret_table then
			monsters[str_match] = ret_table+1
		else
			monsters[str_match] = 1
		end
	end
	
	writing_file:write('SERVER_ALL_MONSTERS = { ')
	
	for monster, count in pairs(monsters) do
		writing_file:write('"'..monster..'", ')
	end
	
	writing_file:write('}')

	writing_file:close()


dofile(new_file_name)


------------

local new_file_name2 = 'data/modules/scripts/prey_system/prey_categories.lua'
local writing_file2 = io.open(new_file_name2, "w+")

local a, b, c = 0
local txt = ''
local BRONZE = ''
local SILVER = ''
local GOLD = ''
local PLATINUM = ''


for i = 1, #SERVER_ALL_MONSTERS do
a = SERVER_ALL_MONSTERS[i]
b = Creature(a)
c = b:getMaxHealth()

if c >= 4600 then
PLATINUM = '"'..a..'", '..PLATINUM
elseif c >= 2600 then
GOLD =  '"'..a..'", '..GOLD
elseif c >= 900 then
SILVER =  '"'..a..'", '..SILVER
elseif c < 900 then
BRONZE =  '"'..a..'", '..BRONZE
end

end
text = 'CONST_MONSTER_TIER_BRONZE = {'..BRONZE..'}\nCONST_MONSTER_TIER_SILVER = {'..SILVER..'}\nCONST_MONSTER_TIER_GOLD = {'..GOLD..'}\nCONST_MONSTER_TIER_PLATINUM = {'..PLATINUM..'}'


writing_file2:write(text)
writing_file2:close()

dofile(new_file_name2)	