SMODS.Atlas{
    key = "colours1",
    path = "colours1.png",
    px = 71,
    py = 95
}

FLUFF.Colour{
    key = "Blua",
    atlas = "colours1",
    pos = { x = 0, y = 0 },
    config = {
        upgrade_rounds = 3,
        create_set = "CGN_Lua"
    }
}

FLUFF.Colour{
    key = "Purple",
    atlas = "colours1",
    pos = { x = 1, y = 0 },
    config = {
        upgrade_rounds = 2,
        extra = {
            cardsPerRound = 3,
            currentCards = 0
        }
    },
    loc_vars = function(self,info_queue,card)
        local tbl = FLUFF.Colour.loc_vars(self, info_queue, card)
        table.insert(tbl.vars,card.ability.extra.cardsPerRound)
        table.insert(tbl.vars,card.ability.extra.cardsPerRound * card.ability.val) -- this is currentCards
        return tbl
    end,
    use = function(self,card,area,copier)
        local suit = pseudorandom_element(SMODS.Suits,"CGN_RoyalPurple")
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, math.min(card.ability.extra.cardsPerRound * card.ability.val,#G.hand.cards) do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound("card1", percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, math.min(card.ability.extra.cardsPerRound * card.ability.val,#G.hand.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    assert(SMODS.change_base(G.hand.cards[i], suit.key))
                    return true
                end
            }))
        end
        for i = 1, math.min(card.ability.extra.cardsPerRound * card.ability.val,#G.hand.cards) do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound("tarot2", percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards >= 1
    end
}