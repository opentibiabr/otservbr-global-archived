-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages

experienceStages = {
	{
		minlevel = 1,
		multiplier = configManager.getNumber(configKeys.RATE_EXP) --2, 4
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
