SMODS.ConsumableType{
    key = "CGN_Lua",
    default = "CGN_JokersLua",
    collection_rows = { 4, 4 },
    shop_rate = 0,
    primary_colour = HEX("0019a0"),
    secondary_colour = HEX("0028c8")
}

SMODS.Atlas{
    key = "UndiscoveredLuaCard",
    path = "UndiscoveredLuaCard.png",
    px = 71,
    py = 95
}

SMODS.UndiscoveredSprite{
    key = "CGN_Lua",
    atlas = "UndiscoveredLuaCard",
    pos = {x = 0, y = 0},
    overlay_pos = {x = 1, y = 0}
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
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { key = "eternal", set = "Other" }
        if not card.edition or (card.edition and not card.edition.negative) then
            info_queue[#info_queue + 1] = G.P_CENTERS["e_negative"]
        end
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                local newCardKey = SMODS.poll_object({type="Joker",seed="CGN_JokersLua",guaranteed=true,filter=function(pool)
                    local allUnavailable = true
                    for i,v in ipairs(pool) do
                        local center = G.P_CENTERS[v.key]
                        if not center or not center.eternal_compat then
                            v.key = "UNAVAILABLE"
                        else
                            allUnavailable = false
                        end
                    end
                    if allUnavailable then
                        pool[#pool+1] = {key="j_joker",type="Joker"}
                    end
                    return pool
                end})
                local newCard = SMODS.add_card({ key = newCardKey, set = "Joker", edition = "e_negative", key_append = "CGN_JokersLua" })
                newCard:add_sticker("eternal", true)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
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
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        local pokerHands = {}
        for k, v in pairs(G.GAME.hands) do
            if v.visible then
                pokerHands[#pokerHands + 1] = k
            end
        end
        local randomPokerHand = pseudorandom_element(pokerHands,"CGN_PokerHandsLua")

        SMODS.upgrade_poker_hands({hands = randomPokerHand, level_up = card.ability.extra.levels, from = card})
        delay(0.5)
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
        max_highlighted = 4
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
            odds = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        local num,denom = SMODS.get_probability_vars(card, 3, card.ability.extra.odds)
        return {
            vars = {
                num,
                denom
            }
        }
    end,
    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, "CGN_EditionsLua", 1, card.ability.extra.odds) then
            local edition = SMODS.poll_edition({key="CGN_EditionsLua",guaranteed=true})
            local rightmost = nil
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("tarot1")
                    card:juice_up(0.3, 0.5)
                    for i = #G.jokers.cards,1,-1 do
                        if not G.jokers.cards[i].edition then
                            rightmost = G.jokers.cards[i]
                            break
                        end
                    end
                    return true
                end
            }))
            delay(0.2)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    if rightmost then
                        rightmost:juice_up(0.3, 0.3)
                        rightmost:set_edition(edition, true)
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.2,
                func = function()
                    G.jokers:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
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
                        backdrop_colour = G.C.SECONDARY_SET.CGN_Lua,
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
    can_use = function(self,card)
        local anyUneditioned = false
        for i = #G.jokers.cards,1,-1 do
            if not G.jokers.cards[i].edition then
                anyUneditioned = true
                break
            end
        end
        return (G.jokers and anyUneditioned)
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
                play_sound("tarot1")
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

SMODS.Atlas{
    key = "SuitsLua",
    path = "SuitsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "SuitsLua",
    set = "CGN_Lua",
    atlas = "SuitsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    config = {
        max_highlighted = 4
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.max_highlighted}}
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
        local leftmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x < leftmost.T.x then
                leftmost = G.hand.highlighted[i]
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    assert(SMODS.change_base(G.hand.highlighted[i], leftmost.base.suit))
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
    key = "RanksLua",
    path = "RanksLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "RanksLua",
    set = "CGN_Lua",
    atlas = "RanksLua",
    pos = {x = 0, y = 0},
    cost = 4,
    config = {
        max_highlighted = 3
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.max_highlighted}}
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
        local leftmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x < leftmost.T.x then
                leftmost = G.hand.highlighted[i]
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    assert(SMODS.change_base(G.hand.highlighted[i], nil, leftmost.base.value))
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
    key = "ShopLua",
    path = "ShopLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "ShopLua",
    set = "CGN_Lua",
    atlas = "ShopLua",
    pos = {x = 0, y = 0},
    cost = 4,
    select_card = "consumeables",
    config = {
        extra = {
            max_highlighted = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.max_highlighted}}
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
        for i = 1, #G.shop_jokers.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    G.shop_jokers.highlighted[i].ability.couponed = true
                    G.shop_jokers.highlighted[i]:set_cost()
                    return true
                end
            }))
        end
        for i = 1, #G.shop_booster.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    G.shop_booster.highlighted[i].ability.couponed = true
                    G.shop_booster.highlighted[i]:set_cost()
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.2,
            func = function()
                G.shop_jokers:unhighlight_all()
                G.shop_booster:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        local areasExist = G.shop_jokers and G.shop_booster
        if not areasExist then
            return false
        end
        local highlightedShopJokers = G.shop_jokers.highlighted
        local indicesToRemove = {}
        for i,v in ipairs(highlightedShopJokers) do
            if v.config.center.key == "c_CGN_ShopLua" then
                table.insert(indicesToRemove,i)
                break
            end
        end
        for i = #indicesToRemove,1,-1 do
            table.remove(highlightedShopJokers,indicesToRemove[i])
        end
        local selection = (#highlightedShopJokers + #G.shop_booster.highlighted) <= card.ability.extra.max_highlighted and (#highlightedShopJokers + #G.shop_booster.highlighted) > 0
        if not selection then
            return false
        end
        local allCardsUncouponed = true
        for i,v in ipairs(highlightedShopJokers) do
            if v.ability.couponed then
                allCardsUncouponed = false
                break
            end
        end
        for i,v in ipairs(G.shop_booster.highlighted) do
            if v.ability.couponed then
                allCardsUncouponed = false
                break
            end
        end
        return (areasExist and selection and allCardsUncouponed)
    end
}

SMODS.Atlas{
    key = "BlindsLua",
    path = "BlindsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "BlindsLua",
    set = "CGN_Lua",
    atlas = "BlindsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    select_card = "consumeables",
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                SMODS.calculate_effect({message=localize("ph_boss_disabled"),colour=G.C.SECONDARY_SET.CGN_Lua,func = function() G.GAME.blind:disable() end},card)
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss))
    end
}

SMODS.Atlas{
    key = "TagsLua",
    path = "TagsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "TagsLua",
    set = "CGN_Lua",
    atlas = "TagsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    select_card = "consumeables",
    loc_vars = function(self, info_queue, card)
        if not G.GAME.round_resets.blind_tags then
            return {vars = {"None","None"}}
        end
        local small = G.GAME.round_resets.blind_tags.Small
        local big = G.GAME.round_resets.blind_tags.Big
        -- this doesn't have an info_queue because info_queue'ing a tag is incredibly broken for some reason
        return {vars = {
            localize({ type = "name_text", set = "Tag", key = small }),
            localize({ type = "name_text", set = "Tag", key = big })
        }}
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3,0.5)
                local small = G.GAME.round_resets.blind_tags.Small
                add_tag({ key = small })
                play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
                play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
                return true
            end
        }))
        delay(0.5)
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("tarot1")
                    card:juice_up(0.3,0.5)
                    local big = G.GAME.round_resets.blind_tags.Big
                    add_tag({ key = big })
                    play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
                    play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Atlas{
    key = "PlanetsLua",
    path = "PlanetsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "PlanetsLua",
    set = "CGN_Lua",
    atlas = "PlanetsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.15,
                            func = function()
                                local slotsEmpty = (G.consumeables.config.card_limit - #G.consumeables.cards)
                                for i = 1, slotsEmpty do
                                    local percent = 0.85 + (i - 0.999) / (slotsEmpty - 0.998) * 0.3
                                    play_sound("tarot2", percent, 0.6)
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            SMODS.add_card({ set = "Planet", soulable = false, key_append = "CGN_PlanetsLua" })
                                            return true
                                        end
                                    }))
                                end
                                return true
                            end
                        }))

                        return true
                    end
                }))
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        local slotsTaken = 0
        if card.area == G.consumeables and (not card.edition or (card.edition and not card.edition.negative)) then
            slotsTaken = 1
        end
        return G.consumeables and ((#G.consumeables.cards - slotsTaken) < G.consumeables.config.card_limit)
    end
}

SMODS.Atlas{
    key = "TarotsLua",
    path = "TarotsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "TarotsLua",
    set = "CGN_Lua",
    atlas = "TarotsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.15,
                            func = function()
                                local slotsEmpty = (G.consumeables.config.card_limit - #G.consumeables.cards)
                                for i = 1, slotsEmpty do
                                    local percent = 0.85 + (i - 0.999) / (slotsEmpty - 0.998) * 0.3
                                    play_sound("tarot2", percent, 0.6)
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            SMODS.add_card({ set = "Tarot", soulable = false, key_append = "CGN_TarotsLua" })
                                            return true
                                        end
                                    }))
                                end
                                return true
                            end
                        }))

                        return true
                    end
                }))
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        local slotsTaken = 0
        if card.area == G.consumeables and (not card.edition or (card.edition and not card.edition.negative)) then
            slotsTaken = 1
        end
        return G.consumeables and ((#G.consumeables.cards - slotsTaken) < G.consumeables.config.card_limit)
    end
}

SMODS.Atlas{
    key = "SpectralsLua",
    path = "SpectralsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "SpectralsLua",
    set = "CGN_Lua",
    atlas = "SpectralsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.15,
                            func = function()
                                local slotsEmpty = (G.consumeables.config.card_limit - #G.consumeables.cards)
                                for i = 1, slotsEmpty do
                                    local percent = 0.85 + (i - 0.999) / (slotsEmpty - 0.998) * 0.3
                                    play_sound("tarot2", percent, 0.6)
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            SMODS.add_card({ set = "Spectral", soulable = false, key_append = "CGN_SpectralsLua" })
                                            return true
                                        end
                                    }))
                                end
                                return true
                            end
                        }))

                        return true
                    end
                }))
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        local slotsTaken = 0
        if card.area == G.consumeables and (not card.edition or (card.edition and not card.edition.negative)) then
            slotsTaken = 1
        end
        return G.consumeables and ((#G.consumeables.cards - slotsTaken) < G.consumeables.config.card_limit)
    end
}

SMODS.Atlas{
    key = "LuaCardsLua",
    path = "LuaCardsLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "LuaCardsLua",
    set = "CGN_Lua",
    atlas = "LuaCardsLua",
    pos = {x = 0, y = 0},
    cost = 4,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.15,
                            func = function()
                                local slotsEmpty = (G.consumeables.config.card_limit - #G.consumeables.cards)
                                for i = 1, slotsEmpty do
                                    local percent = 0.85 + (i - 0.999) / (slotsEmpty - 0.998) * 0.3
                                    play_sound("tarot2", percent, 0.6)
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            SMODS.add_card({ set = "CGN_Lua", soulable = false, key_append = "CGN_LuaCardsLua" })
                                            return true
                                        end
                                    }))
                                end
                                return true
                            end
                        }))

                        return true
                    end
                }))
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        local slotsTaken = 0
        if card.area == G.consumeables and (not card.edition or (card.edition and not card.edition.negative)) then
            slotsTaken = 1
        end
        return G.consumeables and ((#G.consumeables.cards - slotsTaken) < G.consumeables.config.card_limit)
    end
}

SMODS.Atlas{
    key = "VouchersLua",
    path = "VouchersLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "VouchersLua",
    set = "CGN_Lua",
    atlas = "VouchersLua",
    select_card = "consumeables",
    pos = {x = 0, y = 0},
    cost = 4,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                SMODS.add_voucher_to_shop(nil, true)
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.STATE == G.STATES.SHOP
    end
}

SMODS.Atlas{
    key = "BoostersLua",
    path = "BoostersLua.png",
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = "BoostersLua",
    set = "CGN_Lua",
    atlas = "BoostersLua",
    pos = {x = 0, y = 0},
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS["tag_charm"]
        info_queue[#info_queue+1] = G.P_TAGS["tag_meteor"]
        info_queue[#info_queue+1] = G.P_TAGS["tag_ethereal"]
        return {vars = {
            localize({ type = "name_text", set = "Tag", key = "tag_charm" }),
            localize({ type = "name_text", set = "Tag", key = "tag_meteor" }),
            localize({ type = "name_text", set = "Tag", key = "tag_ethereal" })
        }}
    end,
    use = function(self, card, area, copier)
        local tagList = {"tag_charm","tag_meteor","tag_ethereal"}
        local tagKey = pseudorandom_element(tagList, pseudoseed("CGN_TagsLua"))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3,0.5)
                add_tag({ key = tagKey })
                play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
                play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}