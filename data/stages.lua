-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 7
	}, {
		minlevel = 9,
		maxlevel = 20,
		multiplier = 6
	}, {
		minlevel = 21,
		maxlevel = 50,
		multiplier = 5
	}, {
		minlevel = 51,
		maxlevel = 100,
		multiplier = 4
	}, {
		minlevel = 101,
		multiplier = 2
	}
}
