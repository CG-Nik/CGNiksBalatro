SMODS.Atlas{
    key = "Apparition",
    path = "Apparition.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "Apparition",
    set = "Spectral",
    atlas = "Apparition",
    pos = {x = 0, y = 0},
    cost = 4,
    config = {
        extra = {
            cards = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        if not card.edition or (card.edition and not card.edition.negative) then
            info_queue[#info_queue + 1] = G.P_CENTERS["e_negative_consumable"]
        end
        return { vars = {
            card.ability.extra.cards
        }}
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
        for i = 1,card.ability.extra.cards do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    SMODS.add_card({ set = "Tarot", soulable = false, edition = "e_negative", key_append = "CGN_Apparition" })
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        local slotsTaken = 0
        if card.area == G.consumeables and not card.edition or (card.edition and not card.edition.negative) then
            slotsTaken = 1
        end
        return G.consumeables and ((#G.consumeables.cards - slotsTaken) <= G.consumeables.config.card_limit)
    end
}

SMODS.Atlas{
    key = "Hallucination",
    path = "Hallucination.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "Hallucination",
    set = "Spectral",
    atlas = "Hallucination",
    pos = {x = 0, y = 0},
    cost = 4,
    config = {
        extra = {
            cards = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        if not card.edition or (card.edition and not card.edition.negative) then
            info_queue[#info_queue + 1] = G.P_CENTERS["e_negative_consumable"]
        end
        return { vars = {
            card.ability.extra.cards
        }}
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
        for i = 1,card.ability.extra.cards do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    SMODS.add_card({ set = "Planet", soulable = false, edition = "e_negative", key_append = "CGN_Hallucination" })
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        local slotsTaken = 0
        if card.area == G.consumeables and not card.edition or (card.edition and not card.edition.negative) then
            slotsTaken = 1
        end
        return G.consumeables and ((#G.consumeables.cards - slotsTaken) <= G.consumeables.config.card_limit)
    end
}