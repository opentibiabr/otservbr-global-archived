function onUse(cid, item, frompos, item2, topos)

presente = math.random(1,25)
pos = getPlayerPosition(cid)

--surpriese bag--
if presente == 1 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,13537,1) -- Bag of Apple Slices
doRemoveItem(item.uid,1)

elseif presente == 2 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2787,10) --  White Mushrooms precisa coloca id
doRemoveItem(item.uid,1)

elseif presente == 3 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,3956,1) -- Tusk
doRemoveItem(item.uid,1)

elseif presente == 4 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,5880,1) --  Iron Ore
doRemoveItem(item.uid,1)

elseif presente == 5 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,5882,1) -- Red Dragon Scale
doRemoveItem(item.uid,1)

elseif presente == 7 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2666,1) -- Bag of Apple Slices
doRemoveItem(item.uid,1)

elseif presente == 8 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,18215,1) -- Gnomish Supply Package
doRemoveItem(item.uid,1)

elseif presente == 9 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,25393,1) -- Folded Rift Carpet
doRemoveItem(item.uid,1)

elseif presente == 10 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,26192,1) --  Folded Void Carpet
doRemoveItem(item.uid,1)

elseif presente == 11 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2154,1) -- Yellow Gem
doRemoveItem(item.uid,1)

elseif presente == 12 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2079,1) --  War Horn
doRemoveItem(item.uid,1)

elseif presente == 13 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2114,1) -- Piggy Bank
doRemoveItem(item.uid,1)

elseif presente == 14 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,6574,1) --  Bar of Chocolate
doRemoveItem(item.uid,1)

elseif presente == 15 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2661,1) --  Scarf
doRemoveItem(item.uid,1)

elseif presente == 16 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2199,1) -- Garlic Necklace
doRemoveItem(item.uid,1)

elseif presente == 17 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,5879,1) -- Spider Silk
doRemoveItem(item.uid,1)

elseif presente == 18 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,6571,1) -- Surprise Bag (Blue)
doRemoveItem(item.uid,1)

elseif presente == 19 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2165,1) -- Stealth Ring
doRemoveItem(item.uid,1)

elseif presente == 20 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2163,1) --  Magic Light Wand
doRemoveItem(item.uid,1)

elseif presente == 21 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,25419,1) --  Shaggy Ogre Bag
doRemoveItem(item.uid,1)

elseif presente == 22 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2153,1) -- Violet Gem
doRemoveItem(item.uid,1)


elseif presente == 23 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,9971,1) --  Gold Ingot
doRemoveItem(item.uid,1)

elseif presente == 24 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,24850,2) --  Opals
doRemoveItem(item.uid,1)

elseif presente == 25 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,25393,1) --  Rift Tapestry
doRemoveItem(item.uid,1)

end

return 1
end
