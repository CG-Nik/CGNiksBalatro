SMODS.ConsumableType{
    key = "CGN_Lua",
    default = "CGN_JokersLua",
    collection_rows = { 5, 5 },
    shop_rate = 0,
    primary_colour = HEX("0019a0"),
    secondary_colour = HEX("0028c8"),
    select_card = "consumeables"
}

SMODS.Atlas{
    key = "JokersLua",
    path = "JokersLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "JokersLua",
    set = "CGN_Lua",
    atlas = "JokersLua",
    pos = {x = 0, y = 0},
    cost = 4,
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
    path = "PokerHandsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "PokerHandsLua",
    set = "CGN_Lua",
    atlas = "PokerHandsLua",
    pos = {x = 0, y = 0},
    cost = 4,
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

SMODS.Atlas{
    key = "EnhancementsLua",
    path = "EnhancementsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "EnhancementsLua",
    set = "CGN_Lua",
    atlas = "EnhancementsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    config = {
        max_highlighted = 3
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.max_highlighted}}
    end,
    use = function(self, card, area, copier)
        local enhancement = SMODS.poll_enhancement({key="CGN_EnhancementsLua",guaranteed=true})
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("timpani",2,1)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound("card1", percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(enhancement, nil, false)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound("timpani", percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end
}

SMODS.Atlas{
    key = "EditionsLua",
    path = "EditionsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "EditionsLua",
    set = "CGN_Lua",
    atlas = "EditionsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    config = {
        extra = {
            max_highlighted = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.max_highlighted}}
    end,
    use = function(self, card, area, copier)
        local edition = SMODS.poll_edition({key="CGN_EditionsLua",guaranteed=true})
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("timpani",2,1)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.2)
        for i = 1, #G.jokers.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    G.jokers.highlighted[i]:juice_up(0.3, 0.3)
                    G.jokers.highlighted[i]:set_edition(edition, true)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.2,
            func = function()
                G.jokers:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self,card)
        local selectedJokers = #G.jokers.highlighted <= card.ability.extra.max_highlighted and #G.jokers.highlighted > 0
        local allUneditioned = true
        for i,v in ipairs(G.jokers.highlighted) do
            if v.edition then
                allUneditioned = false
            end
        end
        return (selectedJokers and allUneditioned)
    end
}

SMODS.Atlas{
    key = "SealsLua",
    path = "SealsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "SealsLua",
    set = "CGN_Lua",
    atlas = "SealsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    config = {
        max_highlighted = 2
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.max_highlighted}}
    end,
    use = function(self, card, area, copier)
        local seal = SMODS.poll_seal({key="CGN_SealsLua",guaranteed=true})
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("timpani",2,1)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    G.hand.highlighted[i]:set_seal(seal, nil, true)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end
}