local spawns = {
	-- Vampires
	[1]  = {position = Position(32962, 32412, 12), monster = 'Arachir The Ancient One'},
	[2]  = {position = Position(32009, 32795, 10), monster = 'Diblis The Fair'},
	[3]  = {position = Position(33266, 31767, 10), monster = 'Sir Valorcrest'},
	[4]  = {position = Position(32788, 31673, 14), monster = 'Zevelon Duskbringer'},

	-- Bosses
	[5]  = {position = Position(33234, 32278, 12), monster = 'Demodras'},
	[6]  = {position = Position(33101, 32138, 8), monster = 'Dharalion'},
	[7]  = {position = Position(32855, 32333, 6), monster = 'Fernfang'},
	[8]  = {position = Position(32121, 31134, 7), monster = 'Man in the Cave'},
	[9]  = {position = Position(31948, 32572, 10), monster = 'Necropharus'},
	[10] = {position = Position(32466, 31965, 8), monster = 'The Horned Fox'},
	[11] = {position = Position(32023, 31580, 7), monster = 'Yeti'},

	-- Mounts
	[12] = {position = Position(32109, 32783, 12), monster = 'Crustacea Gigantica'},
	[13] = {position = Position(33188, 31241, 7), monster = 'Draptor'},
	[14] = {position = Position(32837, 32700, 7), monster = 'Midnight Panther'},
	[15] = {position = Position(31914, 32559, 10), monster = 'Undead Cavebear'},

	-- PoI bosses
	[16] = {position = Position(32794, 32372, 15), monster = 'Countess Sorrow'},
	[17] = {position = Position(32840, 32310, 15), monster = 'Dracola'},
	[18] = {position = Position(32869, 32267, 15), monster = 'Massacre'},
	[19] = {position = Position(32759, 32243, 15), monster = 'Mr. Punish'},
	[20] = {position = Position(32785, 32276, 15), monster = 'The Handmaiden'},
	[21] = {position = Position(32845, 32325, 15), monster = 'The Plasmother'},
	[22] = {position = Position(32913, 32212, 15), monster = 'The Imperor'}
}

function onThink(interval, lastExecution, thinkInterval)
	if math.random(1000) > 50 then
		return true
	end

	local spawn = spawns[math.random(#spawns)]
	Game.createMonster(spawn.monster, spawn.position, false, true)
	return true
end
