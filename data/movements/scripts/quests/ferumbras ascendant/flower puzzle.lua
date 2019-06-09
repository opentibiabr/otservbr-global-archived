local positions = {
	[1] = {squarepos = Position(33452, 32721, 14), flower1 = Position(33455, 32685, 14), flower2 = Position(33455, 32691, 14), flower3 = Position(33455, 32707, 14)},
	[2] = {squarepos = Position(33455, 32721, 14), flower1 = Position(33456, 32685, 14), flower2 = Position(33456, 32691, 14), flower3 = Position(33456, 32707, 14)},
	[3] = {squarepos = Position(33458, 32721, 14), flower1 = Position(33457, 32685, 14), flower2 = Position(33457, 32691, 14), flower3 = Position(33457, 32707, 14)},
	[4] = {squarepos = Position(33461, 32721, 14), flower1 = Position(33458, 32685, 14), flower2 = Position(33458, 32691, 14), flower3 = Position(33458, 32707, 14)},
	[5] = {squarepos = Position(33464, 32721, 14), flower1 = Position(33459, 32685, 14), flower2 = Position(33459, 32691, 14), flower3 = Position(33459, 32707, 14)},
	[6] = {squarepos = Position(33467, 32721, 14), flower1 = Position(33460, 32685, 14), flower2 = Position(33460, 32691, 14), flower3 = Position(33460, 32707, 14)}, -- done
	[7] = {squarepos = Position(33452, 32724, 14), flower1 = Position(33455, 32686, 14), flower2 = Position(33455, 32692, 14), flower3 = Position(33455, 32708, 14)},
	[8] = {squarepos = Position(33455, 32724, 14), flower1 = Position(33456, 32686, 14), flower2 = Position(33456, 32692, 14), flower3 = Position(33456, 32708, 14)},
	[9] = {squarepos = Position(33458, 32724, 14), flower1 = Position(33457, 32686, 14), flower2 = Position(33457, 32692, 14), flower3 = Position(33457, 32708, 14)},
	[10] = {squarepos = Position(33461, 32724, 14), flower1 = Position(33458, 32686, 14), flower2 = Position(33458, 32692, 14), flower3 = Position(33458, 32708, 14)},
	[11] = {squarepos = Position(33464, 32724, 14), flower1 = Position(33459, 32686, 14), flower2 = Position(33459, 32692, 14), flower3 = Position(33459, 32708, 14)},
	[12] = {squarepos = Position(33467, 32724, 14), flower1 = Position(33460, 32686, 14), flower2 = Position(33460, 32692, 14), flower3 = Position(33460, 32708, 14)}, -- done
	[13] = {squarepos = Position(33452, 32727, 14), flower1 = Position(33455, 32687, 14), flower2 = Position(33455, 32693, 14), flower3 = Position(33455, 32709, 14)},
	[14] = {squarepos = Position(33455, 32727, 14), flower1 = Position(33456, 32687, 14), flower2 = Position(33456, 32693, 14), flower3 = Position(33456, 32709, 14)},
	[15] = {squarepos = Position(33458, 32727, 14), flower1 = Position(33457, 32687, 14), flower2 = Position(33457, 32693, 14), flower3 = Position(33457, 32709, 14)},
	[16] = {squarepos = Position(33461, 32727, 14), flower1 = Position(33458, 32687, 14), flower2 = Position(33458, 32693, 14), flower3 = Position(33458, 32709, 14)},
	[17] = {squarepos = Position(33464, 32727, 14), flower1 = Position(33459, 32687, 14), flower2 = Position(33459, 32693, 14), flower3 = Position(33459, 32709, 14)},
	[18] = {squarepos = Position(33467, 32727, 14), flower1 = Position(33460, 32687, 14), flower2 = Position(33460, 32693, 14), flower3 = Position(33460, 32709, 14)}

}
function onStepIn(creature, item, position, fromPosition)
	for i = 1, #positions do
		local itempos = positions[i]
		if position == itempos.squarepos then
			if item.itemid == 25194 then
				item:transform(25195)
				local flower1 = Tile(itempos.flower1):getItemById(2762) or Tile(itempos.flower1):getItemById(2764) or Tile(itempos.flower1):getItemById(2763)
				local flower2 = Tile(itempos.flower2):getItemById(2762) or Tile(itempos.flower2):getItemById(2764) or Tile(itempos.flower2):getItemById(2763)
				local flower3 = Tile(itempos.flower3):getItemById(2762) or Tile(itempos.flower3):getItemById(2764) or Tile(itempos.flower3):getItemById(2763)
				if not flower1 then
					flower1 = Game.createItem(2763, 1, itempos.flower1)
				end
				if not flower2 then
					flower2 = Game.createItem(2763, 1, itempos.flower2)
				end
				if not flower3 then
					flower3 = Game.createItem(2763, 1, itempos.flower3)
				end
				flower1:transform(2763)
				flower2:transform(2763)
				flower3:transform(2763)
			elseif item.itemid == 25195 then
				item:transform(25196)
				local flower1 = Tile(itempos.flower1):getItemById(2762) or Tile(itempos.flower1):getItemById(2764) or Tile(itempos.flower1):getItemById(2763)
				local flower2 = Tile(itempos.flower2):getItemById(2762) or Tile(itempos.flower2):getItemById(2764) or Tile(itempos.flower2):getItemById(2763)
				local flower3 = Tile(itempos.flower3):getItemById(2762) or Tile(itempos.flower3):getItemById(2764) or Tile(itempos.flower3):getItemById(2763)
				if not flower1 then
					flower1 = Game.createItem(2764, 1, itempos.flower1)
				end
				if not flower2 then
					flower2 = Game.createItem(2764, 1, itempos.flower2)
				end
				if not flower3 then
					flower3 = Game.createItem(2764, 1, itempos.flower3)
				end
				flower1:transform(2764)
				flower2:transform(2764)
				flower3:transform(2764)
			elseif item.itemid == 25196 then
				item:transform(25197)
				local flower1 = Tile(itempos.flower1):getItemById(2762) or Tile(itempos.flower1):getItemById(2764) or Tile(itempos.flower1):getItemById(2763)
				local flower2 = Tile(itempos.flower2):getItemById(2762) or Tile(itempos.flower2):getItemById(2764) or Tile(itempos.flower2):getItemById(2763)
				local flower3 = Tile(itempos.flower3):getItemById(2762) or Tile(itempos.flower3):getItemById(2764) or Tile(itempos.flower3):getItemById(2763)
				if not flower1 then
					flower1 = Game.createItem(2762, 1, itempos.flower1)
				end
				if not flower2 then
					flower2 = Game.createItem(2762, 1, itempos.flower2)
				end
				if not flower3 then
					flower3 = Game.createItem(2762, 1, itempos.flower3)
				end
				flower1:transform(2762)
				flower2:transform(2762)
				flower3:transform(2762)
			elseif item.itemid == 25197 then
				item:transform(25194)
				local flower1 = Tile(itempos.flower1):getItemById(2762) or Tile(itempos.flower1):getItemById(2764) or Tile(itempos.flower1):getItemById(2763)
				local flower2 = Tile(itempos.flower2):getItemById(2762) or Tile(itempos.flower2):getItemById(2764) or Tile(itempos.flower2):getItemById(2763)
				local flower3 = Tile(itempos.flower3):getItemById(2762) or Tile(itempos.flower3):getItemById(2764) or Tile(itempos.flower3):getItemById(2763)
				if flower1 then
					flower1:remove()
				end
				if flower2 then
					flower2:remove()
				end
				if flower3 then
					flower3:remove()
				end
			end
		end
	end
	return true
end
