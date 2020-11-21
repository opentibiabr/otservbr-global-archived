registerCharmType = {}
setmetatable(registerCharmType,
{
  __call =
  function(self, charm, mask)
    for _,parse in pairs(self) do
      parse(charm, mask)
    end
  end
})

Bestiaryregister = function(charm, mask)
  return registerCharmType(charm, mask)
end

registerCharmType.name = function(charm, mask)
  if mask.name then
    charm:Name(mask.name)
  end
end

registerCharmType.description = function(charm, mask)
  if mask.description then
    charm:Description(mask.description)
  end
end

registerCharmType.type = function(charm, mask)
  if mask.type then
    charm:Type(mask.type)
  end
end

registerCharmType.damageType = function(charm, mask)
  if mask.damageType then
    charm:DamageType(mask.damageType)
  end
end

registerCharmType.percent = function(charm, mask)
  if mask.percent then
    charm:Percentage(mask.percent)
  end
end

registerCharmType.chance = function(charm, mask)
  if mask.chance then
    charm:Chance(mask.chance)
  end
end

registerCharmType.message_c = function(charm, mask)
  if mask.message_c then
    charm:CancelMsg(mask.message_c)
  end
end

registerCharmType.message_l = function(charm, mask)
  if mask.message_l then
    charm:LogMsg(mask.message_l)
  end
end

registerCharmType.effect = function(charm, mask)
  if mask.effect then
    charm:Effect(mask.effect)
  end
end

registerCharmType.points = function(charm, mask)
  if mask.points then
    charm:Points(mask.points)
  end
end

registerCharmType.binary = function(charm, mask)
  if mask.binary then
    charm:Binary(mask.binary)
  end
end
