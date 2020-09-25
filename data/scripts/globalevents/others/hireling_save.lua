local hirelingSave = GlobalEvent("hirelingSave")
function hirelingSave.onShutdown()
	print('>> Saving Hirelings')
	SaveHirelings()
	return true
end
hirelingSave:register()
