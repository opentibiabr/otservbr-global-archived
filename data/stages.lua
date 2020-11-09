-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages

experienceStages = {
	{
		minlevel = 1,
		maxlevel = 10,
		multiplier = 5
	}, {
		minlevel = 11,
		maxlevel = 20,
		multiplier = 4
	}, {
		minlevel = 21,
		maxlevel = 30,
		multiplier = 3
	}, {
		minlevel = 31,
		maxlevel = 40,
		multiplier = 2
	}, {
		minlevel = 41,
		maxlevel = 50,
		multiplier = 1.5
	}, {
		minlevel = 51,
		multiplier = 1
	}
}

skillsStages = {
	{
		minlevel = 1,
		multiplier = 1
	}
}

magicLevelStages = {
	{
		minlevel = 1,
		multiplier = 1
	}
}
