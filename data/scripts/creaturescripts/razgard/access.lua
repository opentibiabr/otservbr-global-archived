local loginAccess = CreatureEvent("LoginAccess")
function loginAccess.onLogin(player)
    -- [Quests]
    if player:getStorageValue(ACCESS_AREAS_QUEST) < 1 then

        --In Service of Yalahar 
        player:setStorageValue(Storage.InServiceofYalahar.Questline, 51)
        player:setStorageValue(Storage.InServiceofYalahar.Mission01, 6)
        player:setStorageValue(Storage.InServiceofYalahar.Mission02, 8)
         player:setStorageValue(Storage.InServiceofYalahar.Mission03, 6)
        player:setStorageValue(Storage.InServiceofYalahar.Mission04, 6)
        player:setStorageValue(Storage.InServiceofYalahar.Mission05, 8)
        player:setStorageValue(Storage.InServiceofYalahar.Mission06, 5)
        player:setStorageValue(Storage.InServiceofYalahar.Mission07, 5)
        player:setStorageValue(Storage.InServiceofYalahar.Mission08, 4)
        player:setStorageValue(Storage.InServiceofYalahar.Mission09, 2)
        player:setStorageValue(Storage.InServiceofYalahar.Mission10, 1)
        -- part 2
        player:setStorageValue(Storage.InServiceofYalahar.MatrixState, 1)
        player:setStorageValue(Storage.InServiceofYalahar.NotesPalimuth, 1)
        player:setStorageValue(Storage.InServiceofYalahar.NotesAzerus, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DoorToAzerus, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DoorToBog, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DoorToLastFight, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DoorToMatrix, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DoorToQuara, 1)
        player:setStorageValue(Storage.InServiceofYalahar.SewerPipe01, 1)
        player:setStorageValue(Storage.InServiceofYalahar.SewerPipe02, 1)
        player:setStorageValue(Storage.InServiceofYalahar.SewerPipe03, 1)
        player:setStorageValue(Storage.InServiceofYalahar.SewerPipe04, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DiseasedDan, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DiseasedBill, 1)
        player:setStorageValue(Storage.InServiceofYalahar.DiseasedFred, 1)
        player:setStorageValue(Storage.InServiceofYalahar.AlchemistFormula, 1)
        player:setStorageValue(Storage.InServiceofYalahar.BadSide, 1)
        player:setStorageValue(Storage.InServiceofYalahar.GoodSide, 1)
        player:setStorageValue(Storage.InServiceofYalahar.MrWestDoor, 1)
        player:setStorageValue(Storage.InServiceofYalahar.MrWestStatus, 1)
        player:setStorageValue(Storage.InServiceofYalahar.TamerinStatus, 1)
        player:setStorageValue(Storage.InServiceofYalahar.MorikSummon, 1)
        player:setStorageValue(Storage.InServiceofYalahar.QuaraState, 1)
        player:setStorageValue(Storage.InServiceofYalahar.QuaraSplasher, 1)
        player:setStorageValue(Storage.InServiceofYalahar.QuaraSharptooth, 1)
        player:setStorageValue(Storage.InServiceofYalahar.QuaraInky, 1)
        -- The Way to Yalahar
        player:setStorageValue(Storage.TheWayToYalahar.Questline, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.AbDendriel, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.Darashia, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.Venore, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.Ankrahmun, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.PortHope, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.Thais, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.LibertyBay, 1)
        player:setStorageValue(Storage.SearoutesAroundYalahar.Carlin, 1)

        -- Factions
        player:setStorageValue(Storage.DjinnWar.Faction.Greeting, 2)
        player:setStorageValue(Storage.DjinnWar.Faction.Marid, 2)
        player:setStorageValue(Storage.DjinnWar.Faction.Efreet, 2)
        -- Efreet
        player:setStorageValue(Storage.DjinnWar.EfreetFaction.Start, 1)
        player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission01, 3)
        player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission02, 3)
        player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission03, 3)
        -- Marid
        player:setStorageValue(Storage.DjinnWar.MaridFaction.Start, 1)
        player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission01, 2)
        player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission02, 2)
        player:setStorageValue(Storage.DjinnWar.MaridFaction.RataMari, 2)
        player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission03, 3)

        -- The Travelling Trader Quest
        player:setStorageValue(Storage.TravellingTrader.Mission01, 2)
        player:setStorageValue(Storage.TravellingTrader.Mission02, 5)
        player:setStorageValue(Storage.TravellingTrader.Mission03, 3)
        player:setStorageValue(Storage.TravellingTrader.Mission04, 3)
        player:setStorageValue(Storage.TravellingTrader.Mission05, 3)
        player:setStorageValue(Storage.TravellingTrader.Mission06, 2)
        player:setStorageValue(Storage.TravellingTrader.Mission07, 1)

        -- The Postman
        player:setStorageValue(Storage.Postman.Mission01, 6) -- Mission 1 - Check Postal Routes
        player:setStorageValue(Storage.Postman.Mission02, 3) -- Mission 2 - Fix Mailbox
        player:setStorageValue(Storage.Postman.Mission03, 3) -- Mission 3 - Bill Delivery
        player:setStorageValue(Storage.Postman.Mission04, 2) -- Mission 4 - Aggressive Dogs
        player:setStorageValue(Storage.Postman.Mission05, 4) -- Mission 5 - Present Delivery
        player:setStorageValue(Storage.Postman.Mission06, 13) -- Mission 6 - New Uniforms
        player:setStorageValue(Storage.Postman.Mission07, 8) -- Mission 7 - Measurements
        player:setStorageValue(Storage.Postman.Mission08, 3) -- Mission 8 - Missing Courier
        player:setStorageValue(Storage.Postman.Mission09, 4) -- Mission 9 - Dear Santa
        player:setStorageValue(Storage.Postman.Mission10, 3) -- Mission 10 - Mintwallin
        player:setStorageValue(Storage.Postman.Rank, 5)  -- Postman Rank
        player:setStorageValue(Storage.Postman.Door, 1)  -- Postman Door

        player:setStorageValue(ACCESS_AREAS_QUEST, 1)
    end
    -- [End of Quests]

    return true
end
loginAccess:register()
