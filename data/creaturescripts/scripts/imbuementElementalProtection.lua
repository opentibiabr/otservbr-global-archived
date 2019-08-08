local typesEffects = {
    [COMBAT_DEATHDAMAGE] = "absorbPercentDeath",
    [COMBAT_ICEDAMAGE] = "absorbPercentIce",
    [COMBAT_EARTHDAMAGE] = "absorbPercentEarth",
    [COMBAT_FIREDAMAGE] = "absorbPercentFire",
    [COMBAT_ENERGYDAMAGE] = "absorbPercentEnergy",
    [COMBAT_HOLYDAMAGE] = "absorbPercentHoly"
}

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if attacker and attacker ~= creature then

    local player = creature:getPlayer()
    local armor, shield = player:getSlotItem(CONST_SLOT_ARMOR), player:getSlotItem(CONST_SLOT_RIGHT)

        if player then
            if armor then
                local weaponType = armor:getType()
                for i = 1, weaponType:getImbuingSlots() do
                    local slotEnchantArmor = armor:getSpecialAttribute(i)
                    if (slotEnchantArmor and type(slotEnchantArmor) == 'string') then
                        local skillValueArmor = armor:getImbuementPercent(slotEnchantArmor)
                        local typeEnchantArmor = armor:getImbuementType(i) or ""
                        local abEffectArmor = typesEffects[primaryType]
                        if abEffectArmor then
                            if typeEnchantArmor == abEffectArmor then
                                tmpDamage = primaryDamage
                                primaryDamage = primaryDamage - ((primaryDamage * skillValueArmor) / 100)
                                local abArmorTotal = tmpDamage - primaryDamage
                                player:sendTextMessage(MESSAGE_DAMAGE_DEALT, "You absorb " .. math.abs(math.floor(abArmorTotal)) .. " damage due an imbuement in " .. armor:getName() ..".")
                                useStaminaImbuing(player:getId(), armor:getUniqueId())
                            end
                        end
                    end
                end
            end
            if shield then
                local weaponType = shield:getType()
                for i = 1, weaponType:getImbuingSlots() do
                    local slotEnchantShield = shield:getSpecialAttribute(i)
                    if (slotEnchantShield and type(slotEnchantShield) == 'string') then
                        local skillValueShield = shield:getImbuementPercent(slotEnchantShield)
                        local typeEnchantShield = shield:getImbuementType(i) or ""
                        local abEffectShield = typesEffects[primaryType]
                        if abEffectShield then
                            if typeEnchantShield == abEffectShield then
                                tmpDamage = primaryDamage
                                primaryDamage = primaryDamage - ((primaryDamage * skillValueShield) / 100)
                                local abShieldTotal = tmpDamage - primaryDamage
                                player:sendTextMessage(MESSAGE_DAMAGE_DEALT, "You absorb " .. math.abs(math.floor(abShieldTotal)) .. " damage due an imbuement in " .. shield:getName() ..".")
                                useStaminaImbuing(player:getId(), shield:getUniqueId())
                            end
                        end
                    end
                end
            end
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
