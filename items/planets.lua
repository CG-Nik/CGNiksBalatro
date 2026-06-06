SMODS.Atlas{
    key = "Sol",
    path = "Sol.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = "Sol",
    atlas = "Sol",
    set = "Planet",
    cost = 3,
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local highestPlayed = -1
        local hands = {}
        local localized = {}
        for k,v in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(k) then
                if v.played > highestPlayed then
                    highestPlayed = v.played
                    hands = {k}
                    localized = {localize(k, "poker_hands")}
                elseif v.played == highestPlayed then
                    table.insert(hands,k)
                    table.insert(localized,localize(k, "poker_hands"))
                end
            end
        end
        local localizedString = ""
        local pluralization = "s"
        if #localized == 0 then
            localizedString = "None"
            pluralization = ""
        elseif #localized == 1 then
            localizedString = localized[1]
            pluralization = ""
        elseif #localized == 2 then
            localizedString = localized[1].." and "..localized[2]
        elseif #localized == 3 then
            localizedString = localized[1]..", "..localized[2]..", and "..localized[3]
        elseif #localized > 3 then
            local extra = #localized - 3
            localizedString = localized[1]..", "..localized[2]..", "..localized[3]..", and "..extra.." more..."
        end
        return {
            vars = {
                pluralization,
                localizedString
            }
        }
    end,
    use = function(self, card, area, copier)
        local highestPlayed = -1
        local hands = {}
        for k,v in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(k) then
                if v.played > highestPlayed then
                    highestPlayed = v.played
                    hands = {k}
                elseif v.played == highestPlayed then
                    table.insert(hands,k)
                end
            end
        end

        SMODS.upgrade_poker_hands({hands = hands, from = card})
    end,
    can_use = function(self, card)
        return true
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge("Star", get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}