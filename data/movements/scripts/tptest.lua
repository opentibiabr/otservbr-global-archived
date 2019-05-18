function onStepIn(creature, item, position, fromPosition)
    local actionid = item:getActionId()
    if not captureTheFlag.open then
        if position ~= fromPosition then
            creature:teleportTo(fromPosition)
        end
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "Halls of hope em desenvolvimento. Aguarde nosso proximo update.")
        return true
    end 
end