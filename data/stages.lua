-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages

experienceStages = {
	{
		minlevel = 1,
		maxlevel = 10,
		multiplier = 10 --5, 10
	}, {
		minlevel = 11,
		maxlevel = 20,
		multiplier = 8 --4, 8
	}, {
		minlevel = 21,
		maxlevel = 30,
		multiplier = 6 --3, 6
	}, {
		minlevel = 31,
		maxlevel = 40,
		multiplier = 5 --2.5, 5
	}, {
		minlevel = 41,
		maxlevel = 50,
		multiplier = 4 --2, 4
	}, {
		minlevel = 51,
		maxlevel = 100,
		multiplier = 3 --1.5, 3
	}, {
		minlevel = 101,
		multiplier = 2 --1, 2
	}
}

skillsStages = {
	{
		minlevel = 1,
		multiplier = 2
	}
}

magicLevelStages = {
	{
		minlevel = 1,
		multiplier = 2
	}
}
