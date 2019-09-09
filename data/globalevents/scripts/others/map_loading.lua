local additionals = {
    { description = "map description", file = "data/world/worldchanges/example.otbm", enabled = false}
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
