-- Winged Boots
local wingedBoots = MoveEvent()
wingedBoots.onEquip = defaultEquip
wingedBoots:type("equip")
wingedBoots:slot("boots")
wingedBoots:level(220)
wingedBoots:vocation("paladin", true, true)
wingedBoots:vocation("royal paladin")
wingedBoots:id(36452)
wingedBoots:register()

-- Cobra Boots
local cobraBoots = MoveEvent()
cobraBoots.onEquip = defaultEquip
cobraBoots:type("equip")
cobraBoots:slot("boots")
cobraBoots:level(220)
cobraBoots:vocation("knight", true, true)
cobraBoots:vocation("elite knight")
cobraBoots:id(35229)
cobraBoots:register()
