local decayItems = {
	[26094] = 26096,[26096] = 26094, [26095] = 26097,[26097] = 26095, 	--Protectress Lamp
	[26090] = 26092,[26092] = 26090, [26091] = 26093,[26093] = 26091, 	--Predador Lamp
	[26098] = 26099,[26099] = 26098,                                  	--Baby Dragon
	[26100] = 26101,[26101] = 26100,                                 	--Hamster Wheel
	[26107] = 26108,[26108] = 26107,                                 	--Cat in a Basket
	[26141] = 26142,[26142] = 26141,                                 	--Barrel
	[26364] = 26365,[26365] = 26364,                                  	--Dog House
	[26365] = 26353,[26353] = 26364,                                  	--Dog House
	[27088] = 27089,[27089] = 27088,                                  	--Parrot
	[22614] = 22615,[22615] = 22614,									--Beacon
	[25420] = 25421,[25421] = 25420,									--Ferumbras Staff
	[24809] = 24810,[24810] = 24809,									--Skull
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(decayItems[item.itemid])
	item:decay()
	return true
end
