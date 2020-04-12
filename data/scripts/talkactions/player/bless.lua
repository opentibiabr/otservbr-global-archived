local talk = TalkAction("!bless")

function talk.onSay(player, words, param)
    return Blessings.BuyAllBlesses(player)
end

talk:register()
