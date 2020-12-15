-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages

experienceStages = {
	{
		minlevel = 1,
		maxlevel = 20,
		multiplier = 10 --7, 14
	}, {
		minlevel = 21,
		maxlevel = 40,
		multiplier = 9 --6, 12
	}, {
		minlevel = 41,
		maxlevel = 60,
		multiplier = 8 --5, 10
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 7 --4, 8
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 6 --3, 6
	}, {
		minlevel = 101,
		maxlevel = 150,
		multiplier = 5 --2, 4
	}, {
		minlevel = 151,
		maxlevel = 200,
		multiplier = 4 --2, 4
	}, {
		minlevel = 201,
		maxlevel = 250,
		multiplier = 3 --2, 4
	}, {
		minlevel = 251,
		multiplier = 2 --1, 2
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 20,
		multiplier = 12
	}, {
		minlevel = 21,
		maxlevel = 30,
		multiplier = 9
	}, {
		minlevel = 31,
		maxlevel = 40,
		multiplier = 6
	}, {
		minlevel = 41,
		multiplier = 3
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 10,
		multiplier = 10
	}, {
		minlevel = 11,
		maxlevel = 20,
		multiplier = 8
	}, {
		minlevel = 21,
		maxlevel = 30,
		multiplier = 6
	}, {
		minlevel = 31,
		multiplier = 2
	}
}