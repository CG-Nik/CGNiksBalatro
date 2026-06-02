SMODS.Atlas{
    key = "Sommers",
    path = "Sommers.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Sommers",
    atlas = "Sommers",
    unlocked = false,
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    attributes = {
        "economy",
        "sell_value"
    },
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 4,
    config = { extra = {
        cap = 25,
        current = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        local sellValuesCombined = 0
        if G.jokers then
            for i,v in ipairs(G.jokers.cards) do
                if v.ability.set == "Joker" then
                    sellValuesCombined = math.min(card.ability.extra.cap, sellValuesCombined + math.floor(v.sell_cost / 2))
                end
            end
        end

        card.ability.extra.current = sellValuesCombined

        return {vars = {
            card.ability.extra.cap,
            card.ability.extra.current
        }}
    end,
    calc_dollar_bonus = function(self,card)
        local sellValuesCombined = 0
        if G.jokers then
            for i,v in ipairs(G.jokers.cards) do
                if v.ability.set == "Joker" then
                    sellValuesCombined = math.min(card.ability.extra.cap, sellValuesCombined + math.floor(v.sell_cost / 2))
                end
            end
        end

        return sellValuesCombined
    end
}