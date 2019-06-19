local additionals = {
    { description = "trainers", file = "data/world/worldchanges/additionals/trainers_eventRoom.otbm", enabled = true}
}

function onStartup()
    print("> loading additional maps")
    for _, additional in ipairs(additionals) do 
        if additional.enabled then
            Game.loadMap(additional.file)
            print("> loaded " .. additional.description)
        end
    end

    return true
end
