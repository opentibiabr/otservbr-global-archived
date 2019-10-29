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
	[27100] = 27101,[27101] = 27100,									--Parrot
	[27102] = 27104,[27103] = 27102,									--Skull Lamp
	[27888] = 27886,[27887] = 27888,									--Vengothic Lamp
	[29312] = 29313,[29313] = 29312,									--Bath Tub
	[29314] = 29315,													--Spider Terrarium
	[29317] = 29319,[29319] = 29317,									--Hrodmiran weapons rack
	[29320] = 29318,[29318] = 29320,									--Hrodmiran weapons rack side
	[29407] = 29405,				 [29408] = 29406,					--Snake Terrarium
	[29409] = 29411,				 [29410] = 29412,					--Demon Pet
	[32390] = 32391, [32391] = 32390,									--Baby Rotworm
	[32394] = 32395, [32395] = 32394,									--Fennec
	[35031] = 35032, [35032] = 35031,									--Festive Tree
	[35042] = 35043, [35043] = 35042,									--Festive Pyramid
	[36031] = 36032, [36032] = 36031,									--Crystal Lamp
	[36048] = 36050, [36050] = 36048,									--Idol Lamp
	[36049] = 36051, [36051] = 36049,									--Idol Lamp side
	[36516] = 36517, [36517] = 36516, 									--Hedgehog
	[36518] = 36519, [36519] = 36518, 									--Exalted Sarcophagus
	[36530] = 36531, [36531] = 36530,									--Curly Hortensis Lamp
	[36532] = 36533, [36533] = 36532,									--Little big flower lamp
	[36539] = 36538, [36538] = 36539,									--Baby Unicorn
	[36509] = 36510,													--Omniscient Owl

}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(decayItems[item.itemid])
	item:decay()
	return true
end
