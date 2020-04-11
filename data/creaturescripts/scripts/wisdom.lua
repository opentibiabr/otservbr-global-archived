function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('Wisdom of Urmahlullu', getThingPos(cid))
end