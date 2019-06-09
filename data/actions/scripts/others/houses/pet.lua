local Voices = {
	[26364] = "Au au!",
	[26099] = "Grooaarr!"
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (Voices[item:getId()]) then
		local spectators = Game.getSpectators(fromPosition, false, true, 3, 3)
		for i = 1, #spectators do
			cid:say(Voices[item:getId()], TALKTYPE_MONSTER_SAY, false, spectators[i], fromPosition)
		end
	end

	if (item:getId() == 26364) then
		item:transform(26365)
		item:decay()
	elseif (item:getId() == 26099) then
		item:transform(26098)
		item:decay()
	end
	return true
end