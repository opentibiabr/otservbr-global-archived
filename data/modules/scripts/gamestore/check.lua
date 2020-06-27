local storeOffersId = {}

-- grouping offers by ids
for k, category in pairs(GameStore.Categories) do

    for j, offer in pairs(category.offers) do
        if offer.id then
            if not storeOffersId[offer.id] then
                storeOffersId[offer.id] = {}
            end

            local obj = {}
            obj.category = category.name
            obj.name = offer.name
            obj.price = offer.price or 'N/A'
            obj.count = offer.count or 0 
            obj.description = obj.description or ''

            table.append(storeOffersId[offer.id], obj)
        end
    end

end

GameStore.DuplicatedOffers = {}

-- printing duplicated offers
for offerId, offers in pairs(storeOffersId) do

    if #offers > 1 then
        print("duplicated offer id: " .. offerId)
        for k, offer in pairs(offers) do
            table.append(GameStore.DuplicatedOffers, k)
            print("- category: " .. offer.category)
            print("- name: " .. offer.name)
            print("- price: " .. offer.price)
            print("- count: " .. offer.count)
            print("- Description: " .. offer.description)
            print("-------")
        end

        print("")
    end

end
