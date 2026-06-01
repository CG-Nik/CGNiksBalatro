SMODS.ConsumableType{
    key = "CGN_Lua",
    default = "CGN_JokersLua",
    collection_rows = { 5, 5 },
    shop_rate = 0,
    primary_colour = HEX("0019a0"),
    secondary_colour = HEX("0028c8")
}

SMODS.Atlas{
    key = "JokersLua",
    path = "LuaCardPlaceholder.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "JokersLua",
    set = "CGN_Lua",
    atlas = "JokersLua",
    pos = {x = 0, y = 0},
    cost = 3,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("timpani")
                local newCard = SMODS.add_card({ set = "Joker", edition = "e_negative", key_append = "CGN_JokersLua" })
                newCard:add_sticker("eternal", true)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards <= G.jokers.config.card_limit
    end
}

SMODS.Atlas{
    key = "PokerHandsLua",
    path = "LuaCardPlaceholder.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "PokerHandsLua",
    set = "CGN_Lua",
    atlas = "PokerHandsLua",
    pos = {x = 0, y = 0},
    cost = 3,
    config = {
        extra = {
            levels = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.levels}}
    end,
    use = function(self, card, area, copier)
        local pokerHands = {}
        for k, v in pairs(G.GAME.hands) do
            if v.visible then
                pokerHands[#pokerHands + 1] = k
            end
        end
        local randomPokerHand = pseudorandom_element(pokerHands,"CGN_PokerHandsLua")

        SMODS.upgrade_poker_hands({hands = randomPokerHand, level_up = card.ability.extra.levels, from = card})
    end,
    can_use = function(self, card)
        return true
    end
}