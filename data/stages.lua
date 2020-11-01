-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages

experienceStages = {
	{
		minlevel = 1,
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
		maxlevel = 40,
		multiplier = 4
	}, {
		minlevel = 41,
		maxlevel = 50,
		multiplier = 3
	}, {
		minlevel = 51,
		multiplier = 2
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
