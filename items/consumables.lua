SMODS.Atlas{
    key = "TheInfection",
    path = "TheInfection.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "TheInfection",
    set = "Tarot",
    atlas = "TheInfection",
    pos = {x = 0, y = 0},
    cost = 3,
    config = {
        max_highlighted = 2,
        mod_conv = "m_CGN_Disease"
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_CGN_Disease"]
        return {vars = {card.ability.max_highlighted,card.ability.mod_conv}}
    end,
}

SMODS.Atlas{
    key = "Weakness",
    path = "Weakness.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "Weakness",
    set = "Tarot",
    atlas = "Weakness",
    pos = {x = 0, y = 0},
    cost = 3,
    config = {
        max_highlighted = 3,
        extra = {
            modify_rank = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.max_highlighted,card.ability.extra.modify_rank}}
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
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
                    assert(SMODS.modify_rank(G.hand.highlighted[i], -card.ability.extra.modify_rank))
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
                    play_sound("tarot2", percent, 0.6)
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
    key = "SuperStrength",
    path = "SuperStrength.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "SuperStrength",
    set = "Tarot",
    atlas = "SuperStrength",
    pos = {x = 0, y = 0},
    cost = 3,
    config = {
        max_highlighted = 1,
        extra = {
            modify_rank = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.max_highlighted,card.ability.extra.modify_rank}}
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
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
                    assert(SMODS.modify_rank(G.hand.highlighted[i], card.ability.extra.modify_rank))
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
                    play_sound("tarot2", percent, 0.6)
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