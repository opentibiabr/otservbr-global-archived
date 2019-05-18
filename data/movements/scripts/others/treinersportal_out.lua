local config = {
	{storageKey = 110001, teleportPosition = Position(32955, 32074, 7)}, --venore
	{storageKey = 110002, teleportPosition = Position(32369, 32241, 7)}, --thais 
	{storageKey = 110003, teleportPosition = Position(32654, 31923, 11)}, --kazordoon
	{storageKey = 110004, teleportPosition = Position(32359, 31777, 7)}, --carlin
	{storageKey = 110005, teleportPosition = Position(32732, 31630, 7)}, --ab'dendriel
	{storageKey = 110006, teleportPosition = Position(32315, 32825, 7)}, --liberty bay
	{storageKey = 110007, teleportPosition = Position(32592, 32743, 7)}, --port hope
	{storageKey = 110008, teleportPosition = Position(33194, 32853, 8)}, --ankrahmun
	{storageKey = 110009, teleportPosition = Position(33212, 32452, 1)}, --darashia
	{storageKey = 110010, teleportPosition = Position(33217, 31811, 8)}, --edron
	{storageKey = 110011, teleportPosition = Position(32215, 31134, 7)}, --svargrond
	{storageKey = 110012, teleportPosition = Position(32793, 31247, 5)}, --yalahar
	{storageKey = 110013, teleportPosition = Position(33020, 31522, 11)}, --farmine
	{storageKey = 110014, teleportPosition = Position(33447, 31323, 9)}, --gray beach
	{storageKey = 110015, teleportPosition = Position(33513, 32363, 6)}, --roshamuul
	{storageKey = 110016, teleportPosition = Position(33605, 31897, 7)} --rathleton 
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	for i = 1, #config do
		local table = config[i]
		if player:getStorageValue(table.storageKey) >= 1 then
			player:teleportTo(table.teleportPosition)
			table.teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(table.storageKey, 0)
			return true
		end
	end

	player:teleportTo(player:getTown():getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
