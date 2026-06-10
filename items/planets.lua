SMODS.Atlas{
    key = "planets1",
    path = "planets1.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = "Sol",
    atlas = "planets1",
    set = "Planet",
    cost = 3,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            levels = 1,
            odds = 2
        }
    },
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
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                pluralization,
                card.ability.extra.levels,
                localizedString,
                num,
                denom
            }
        }
    end,
    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, "CGN_Sol", 1, card.ability.extra.odds) then
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
        else
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize("k_nope_ex"),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Planet,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            "tm" or "cm",
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound("tarot2", 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound("tarot2", 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,
    can_use = function(self, card)
        return true
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge("Star", get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}

SMODS.Consumable {
    key = "Europa",
    atlas = "planets1",
    set = "Planet",
    cost = 3,
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            levels = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        local leastPlayed = math.huge
        local hands = {}
        local localized = {}
        for k,v in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(k) then
                if v.played < leastPlayed then
                    leastPlayed = v.played
                    hands = {k}
                    localized = {localize(k, "poker_hands")}
                elseif v.played == leastPlayed then
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
                card.ability.extra.levels,
                localizedString
            }
        }
    end,
    use = function(self, card, area, copier)
        local leastPlayed = math.huge
        local hands = {}
        for k,v in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(k) then
                if v.played < leastPlayed then
                    leastPlayed = v.played
                    hands = {k}
                elseif v.played == leastPlayed then
                    table.insert(hands,k)
                end
            end
        end

        SMODS.upgrade_poker_hands({hands = hands, level_up = 2, from = card})
    end,
    can_use = function(self, card)
        return true
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge("Moon", get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}