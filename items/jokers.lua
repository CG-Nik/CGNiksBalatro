local scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    local ret = scie(effect, scored_card, key, amount, from_edition)

    local lk = string.lower(key)

    if
        (
            lk == "x_mult"
            or lk == "xmult"
            or lk == "x_mult_mod"
            or lk == "xmult_mod"
        )
        and amount > 1
        and mult
    then
        if next(SMODS.find_card("j_CGN_RedJoker", false)) then
            for i,v in ipairs(SMODS.find_card("j_CGN_RedJoker", false)) do
                SMODS.scale_card(v, {
                    ref_table = v.ability.extra,
                    ref_value = "mult",
                    scalar_value = "scaling",
                    message_key = "a_mult",
                    message_colour = G.C.FILTER
                })
            end
        end
    end

    if
        (
            lk == "mult"
            or lk == "mult_mod"
        )
        and amount > 0
        and mult
    then
        if next(SMODS.find_card("j_CGN_FireAndIce", false)) then
            for i,v in ipairs(SMODS.find_card("j_CGN_FireAndIce", false)) do
                SMODS.scale_card(v, {
                    ref_table = v.ability.extra,
                    ref_value = "chips",
                    scalar_value = "scaling",
                    message_key = "a_chips",
                    message_colour = G.C.FILTER
                })
            end
        end
    end

    return ret
end

SMODS.Atlas{
    key = "Obmij",
    path = "Obmij.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Obmij",
    atlas = "Obmij",
    pos = {x = 0, y = 0},
    attributes = {
        "chips",
    },
    cost = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        chips = 40
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {

                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Atlas{
    key = "Yin",
    path = "Yin.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Yin",
    atlas = "Yin",
    pos = {x = 0, y = 0},
    attributes = {
        "xchips"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        Xchips = 1.5,
        XchipsYang = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        if not card.fake_card then
            info_queue[#info_queue+1] = G.P_CENTERS.j_CGN_Yang
        end
        return {vars = {card.ability.extra.Xchips,card.ability.extra.XchipsYang}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            if next(SMODS.find_card("j_CGN_Yang", false)) then
                return {
                    xchips = card.ability.extra.XchipsYang,
                }
            else
                return {
                    xchips = card.ability.extra.Xchips,
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "Yang",
    path = "Yang.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Yang",
    atlas = "Yang",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        Xmult = 1.5,
        XmultYin = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        if not card.fake_card then
            info_queue[#info_queue+1] = G.P_CENTERS.j_CGN_Yin
        end
        return {vars = {card.ability.extra.Xmult,card.ability.extra.XmultYin}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            if next(SMODS.find_card("j_CGN_Yin", false)) then
                return {
                    Xmult = card.ability.extra.XmultYin,
                }
            else
                return {
                    Xmult = card.ability.extra.Xmult,
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "Pandemic",
    path = "Pandemic.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Pandemic",
    atlas = "Pandemic",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "CGN_Disease"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        mult = 3
    }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_CGN_Disease"]
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local bool = true
            for i,v in ipairs(G.hand.cards) do
                if not SMODS.has_enhancement(v, "m_CGN_Disease") then
                    bool = false
                end
            end

            if bool then
                return {
                    Xmult = card.ability.extra.mult
                }
            end
        end
    end,
    in_pool = function(self,args)
        for i, v in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, "m_CGN_Disease") then
                return true
            end
        end
        return false
    end
}

SMODS.Atlas{
    key = "Cure",
    path = "Cure.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Cure",
    atlas = "Cure",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "chance",
        "CGN_Disease",
        "enhancements"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        mult = 1.5,
        odds = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_CGN_Disease"]
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {vars = {card.ability.extra.mult,num,denom}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_CGN_Disease") then
            return {
                xmult = card.ability.extra.mult
            }
        end

        if context.after then
            for i,v in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(v, "m_CGN_Disease") then
                    if SMODS.pseudorandom_probability(card, "CGN_Cure", 1, card.ability.extra.odds) then
                        v:set_ability("c_base", nil, true)
                        local cardToJuice = card
                        if context.blueprint then
                            cardToJuice = context.blueprint_card
                        end
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                cardToJuice:juice_up()
                                return true
                            end
                        }))
                        SMODS.calculate_effect({message="Cured!",colour = G.C.BLUE}, v)
                    else
                        local cardToJuice = card
                        if context.blueprint then
                            cardToJuice = context.blueprint_card
                        end
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                cardToJuice:juice_up()
                                return true
                            end
                        }))
                        SMODS.calculate_effect({message="Safe!",colour = G.C.FILTER}, v)
                    end
                end
            end
        end
    end,
    in_pool = function(self,args)
        for i, v in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, "m_CGN_Disease") then
                return true
            end
        end
        return false
    end
}

SMODS.Atlas{
    key = "UraniumRod",
    path = "UraniumRod.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "UraniumRod",
    atlas = "UraniumRod",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "reset",
        "hands",
        "scaling"
    },
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 3,
    config = { extra = {
        mult = 0,
        scaling = 0.5
    }},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult,card.ability.extra.scaling,card.ability.extra.hands_played,colours={G.C.DARK_EDITION}}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.mult
            }
        end

        if context.after and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "scaling",
                message_key = "a_xmult",
                message_colour = G.C.FILTER
            })
        end

        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss and not context.blueprint then
            card.ability.extra.mult = 0
            return {
                message = localize("k_reset"),
                colour = G.C.FILTER
            }
        end
    end
}

SMODS.Atlas{
    key = "TrashCan",
    path = "TrashCan.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "TrashCan",
    atlas = "TrashCan",
    pos = {x = 0, y = 0},
    attributes = {
        "generation",
        "joker",
        "editions"
    },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        points = 0,
        requirement = 100,
        consumablePoints = 5,
        commonJokerPoints = 10,
        uncommonJokerPoints = 15,
        rareJokerPoints = 25,
        legendaryJokerPoints = 100,
        unknownPoints = 5
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.points,
            card.ability.extra.requirement,
            card.ability.extra.consumablePoints,
            card.ability.extra.commonJokerPoints,
            card.ability.extra.uncommonJokerPoints,
            card.ability.extra.rareJokerPoints,
            card.ability.extra.legendaryJokerPoints,
            card.ability.extra.unknownPoints
        }}
    end,
    calculate = function(self,card,context)
        if context.selling_card and not context.blueprint then
            local scalar = "unknownPoints"

            if context.card.ability.consumeable then
                scalar = "consumablePoints"
            elseif context.card.ability.set == "Joker" then
                if context.card.config.center.rarity == 1 then
                    scalar = "commonJokerPoints"
                elseif context.card.config.center.rarity == 2 then
                    scalar = "uncommonJokerPoints"
                elseif context.card.config.center.rarity == 3 then
                    scalar = "rareJokerPoints"
                elseif context.card.config.center.rarity == 4 then
                    scalar = "legendaryJokerPoints"
                end
            end

            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "points",
                scalar_value = scalar,
                no_message = true
            })

            if card.ability.extra.points >= card.ability.extra.requirement then
                SMODS.calculate_effect({message="Trashed!",colour = G.C.FILTER}, card)
                card:start_dissolve({ G.C.SECONDARY_SET.Tarot }, nil, 1.6)
                for count = 1,5,1 do
                    SMODS.add_card({set = "Consumeables",area = G.consumeables,soulable = false, edition = "e_negative"})
                end
            else
                SMODS.calculate_effect({message=localize("k_upgrade_ex"),colour = G.C.FILTER}, card)
            end
        end
    end
}

SMODS.Atlas{
    key = "RedJoker",
    path = "RedJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "RedJoker",
    atlas = "RedJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "mult",
        "scaling"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 3,
    config = { extra = {
        scaling = 1,
        mult = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.scaling,
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = "ShadowIllusion",
    path = "ShadowIllusion.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "ShadowIllusion",
    atlas = "ShadowIllusion",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "suit"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        mult = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.mult,
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local suits = {}
            local suitNum = 0
            for k,v in pairs(context.scoring_hand) do
                for k2,v2 in pairs(SMODS.Suits) do
                    if v:is_suit(k2) then
                        if suits[k2] ~= true then
                            suitNum = suitNum + 1
                        end
                        suits[k2] = true
                    end
                end
            end

            if suitNum > 1 then
                return
                {
                    Xmult = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "Alloy",
    path = "Alloy.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Alloy",
    atlas = "Alloy",
    pos = {x = 0, y = 0},
    attributes = {
        "on_sell",
        "enhancements"
    },
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 2,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_steel"]
    end,
    calculate = function(self,card,context)
        if context.selling_self then
            if G.hand then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                for i,v in ipairs(G.hand.cards) do
                                    if not SMODS.has_enhancement(v, "m_steel") then
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                v:flip()
                                                play_sound('card1', 1)
                                                v:juice_up(0.3, 0.3)
                                                return true
                                            end
                                        }))
                                        delay(0.2)
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.1,
                                            func = function()
                                                v:set_ability(G.P_CENTERS["m_steel"])
                                                return true
                                            end
                                        }))
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.15,
                                            func = function()
                                                v:flip()
                                                play_sound('tarot2', 1, 0.6)
                                                v:juice_up(0.3, 0.3)
                                                return true
                                            end
                                        })) 
                                    end
                                end
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "Sharpshooter",
    path = "Sharpshooter.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Sharpshooter",
    atlas = "Sharpshooter",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        mult = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = "D6",
    path = "D6.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "D6",
    atlas = "D6",
    pos = {x = 0, y = 0},
    pixel_size = {h = 71},
    attributes = {
        "mult",
        "xmult"
    },
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        plusMult = 5,
        xMult0 = 0.5,
        xMult1 = 1.5,
        xMult2 = 2,
        xMult3 = 2.5
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.plusMult,
            card.ability.extra.xMult0,
            card.ability.extra.xMult1,
            card.ability.extra.xMult2,
            card.ability.extra.xMult3
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local random = pseudorandom("CGN_D6",1,6)
            local cardToMessage = card
            if context.blueprint then
                cardToMessage = context.blueprint_card
            end
            SMODS.calculate_effect({message=random.."!",colour = G.C.FILTER}, cardToMessage)
            if random == 1 then
                mult = mod_mult(1)
                update_hand_text({ sound = nil, modded = true }, { chips = hand_chips, mult = mult })
                SMODS.calculate_effect({message="Mult = 1",colour = G.C.MULT,sound = "chips2"}, cardToMessage)
            elseif random == 2 then
                return {
                    Xmult = card.ability.extra.xMult0
                }
            elseif random == 3 then
                return {
                    mult = card.ability.extra.plusMult
                }
            elseif random == 4 then
                return {
                    Xmult = card.ability.extra.xMult1
                }
            elseif random == 5 then
                return {
                    Xmult = card.ability.extra.xMult2
                }
            else
                return {
                    Xmult = card.ability.extra.xMult3
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "Quarter",
    path = "Quarter.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Quarter",
    atlas = "Quarter",
    pos = {x = 0, y = 0},
    pixel_size = {h = 71},
    attributes = {
        "xmult",
        "chance"
    },
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        mult = 4,
        odds = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {vars = {
            card.ability.extra.mult,
            num,
            denom
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, "CGN_Quarter", 1, card.ability.extra.odds) then
                return {
                    Xmult = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "WildJoker",
    path = "WildJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "WildJoker",
    atlas = "WildJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "full_deck",
        "enhancements"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        scaling = 0.2,
        mult = 1
    }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_wild"]
        local XMultToGive = 1
        if G.deck then
            local cards = 0
            for i, v in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(v, "m_wild") then
                    cards = cards + 1
                end
            end
            XMultToGive = (cards * card.ability.extra.scaling) + 1
        end
        card.ability.extra.mult = XMultToGive
        return {vars = {
            card.ability.extra.scaling,
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        local XMultToGive = 1
        if G.deck then
            local cards = 0
            for i, v in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(v, "m_wild") then
                    cards = cards + 1
                end
            end
            XMultToGive = (cards * card.ability.extra.scaling) + 1
        end

        if context.joker_main then
            return {
                Xmult = XMultToGive
            }
        end
    end,
    in_pool = function(self,args)
        for i, v in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, "m_wild") then
                return true
            end
        end
        return false
    end
}

SMODS.Atlas{
    key = "InfectedJoker",
    path = "InfectedJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "InfectedJoker",
    atlas = "InfectedJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "full_deck",
        "enhancements",
        "CGN_Disease"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        scaling = 0.1,
        mult = 1
    }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_CGN_Disease"]
        local XMultToGive = 1
        if G.deck then
            local cards = 0
            for i,v in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(v, "m_CGN_Disease") then
                    cards = cards + 1
                end
            end
            XMultToGive = (cards * card.ability.extra.scaling) + 1
        end
        card.ability.extra.mult = XMultToGive
        return {vars = {
            card.ability.extra.scaling,
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        local XMultToGive = 1
        if G.deck then
            local cards = 0
            for i,v in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(v, "m_CGN_Disease") then
                    cards = cards + 1
                end
            end
            XMultToGive = (cards * card.ability.extra.scaling) + 1
        end

        if context.joker_main then
            return {
                Xmult = XMultToGive
            }
        end
    end,
    in_pool = function(self,args)
        for i, v in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, "m_CGN_Disease") then
                return true
            end
        end
        return false
    end
}

SMODS.Atlas{
    key = "CyberJoker",
    path = "CyberJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "CyberJoker",
    atlas = "CyberJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "scaling",
        "hand_type"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 2,
    config = { extra = {
        scaling = 0.25,
        poker_hand = "High Card",
        mult = 1
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.scaling,
            localize(card.ability.extra.poker_hand, "poker_hands"),
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.mult
            }
        end

        if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "scaling",
                message_key = "a_xmult",
                message_colour = G.C.FILTER
            })
        end

        if context.end_of_round and context.game_over == false and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for i, v in pairs(G.GAME.hands) do
                if v.visible and i ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = i
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("CGN_CyberJoker"))
            return {
                message = localize('k_reset')
            }
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for i, v in pairs(G.GAME.hands) do
            if v.visible and i ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = i
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("CGN_CyberJoker"))
    end
}

SMODS.Atlas{
    key = "Vaporwave",
    path = "Vaporwave.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Vaporwave",
    atlas = "Vaporwave",
    pos = {x = 0, y = 0},
    attributes = {
        "mult",
        "scaling",
        "hand_type"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 1,
    config = { extra = {
        scalingFalse = 1,
        scalingTrue = 3,
        poker_hand = "High Card",
        mult = 0,
        playedRightHand = false,
        activeText = "Have not"
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.scalingFalse,
            card.ability.extra.scalingTrue,
            localize(card.ability.extra.poker_hand, "poker_hands"),
            card.ability.extra.mult,
            card.ability.extra.playedRightHand,
            card.ability.extra.activeText
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand and not card.ability.extra.playedRightHand and not context.blueprint then
            card.ability.extra.playedRightHand = true
            card.ability.extra.activeText = "Have"
            SMODS.calculate_effect({message="Played!",colour = G.C.FILTER}, card)
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local scaling = "scalingFalse"
            if card.ability.extra.playedRightHand then
                scaling = "scalingTrue"
            end

            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = scaling,
                message_key = "a_mult",
                message_colour = G.C.FILTER
            })
            
            local _poker_hands = {}
            for i, v in pairs(G.GAME.hands) do
                if v.visible and i ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = i
                end
            end
            card.ability.extra.playedRightHand = false
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("CGN_Vaporwave"))
            card.ability.extra.activeText = "Have not"
            return {
                message = localize("k_reset"),
                colour = G.C.FILTER
            }
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for i, v in pairs(G.GAME.hands) do
            if v.visible and i ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = i
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("CGN_Vaporwave"))
    end
}

SMODS.Atlas{
    key = "Theta",
    path = "Theta.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Theta",
    atlas = "Theta",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "scaling",
        "hands"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 2,
    config = { extra = {
        scaling = 0.25,
        mult = 1,
        handsPlayed = 0,
        handsToUpgrade = 5
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.scaling,
            card.ability.extra.mult,
            card.ability.extra.handsPlayed,
            card.ability.extra.handsToUpgrade
        }}
    end,
    load = function(self, card, card_table, other_card)
        local eval = function() return card.ability.extra.handsPlayed + 1 >= card.ability.extra.handsToUpgrade end
        juice_card_until(card, eval, true)
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.mult
            }
        end

        if context.before and not context.blueprint and context.main_eval then
            card.ability.extra.handsPlayed = card.ability.extra.handsPlayed + 1
            SMODS.calculate_effect({message=(card.ability.extra.handsPlayed).."!",colour = G.C.FILTER}, card)
            if card.ability.extra.handsPlayed >= card.ability.extra.handsToUpgrade then
                card.ability.extra.handsPlayed = 0
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "scaling",
                    message_key = "a_xmult",
                    message_colour = G.C.FILTER
                })
            end
            if card.ability.extra.handsPlayed + 1 >= card.ability.extra.handsToUpgrade then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local eval = function() return card.ability.extra.handsPlayed + 1 >= card.ability.extra.handsToUpgrade end
                        juice_card_until(card, eval, true)
                        return true
                    end
                }))
            end
            return {}
        end
    end
}

SMODS.Atlas{
    key = "GoldenBow",
    path = "GoldenBow.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "GoldenBow",
    atlas = "GoldenBow",
    pos = {x = 0, y = 0},
    attributes = {
        "economy",
        "hands"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        min = 1,
        max = 3
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.min,
            card.ability.extra.max
        }}
    end,
    calculate = function(self,card,context)
        if context.before then
            local random = pseudorandom("CGN_GoldenBow",card.ability.extra.min,card.ability.extra.max)
            return {
                dollars = random
            }
        end
    end
}

SMODS.Atlas{
    key = "Assassin",
    path = "Assassin.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Assassin",
    atlas = "Assassin",
    pos = {x = 0, y = 0},
    attributes = {
        "economy",
        "hand_type"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        pokerHands = {"High Card", "High Card", "High Card"},
        dollars = 20,
        playedHands = {false,false,false},
        handsLeft = ""
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            localize(card.ability.extra.pokerHands, "poker_hands"),
            card.ability.extra.dollars,
            card.ability.extra.playedHands,
            card.ability.extra.handsLeft
        }}
    end,
    load = function(self, card, card_table, other_card)
        local eval = function() return card.ability.extra.handsLeft == "Complete!" end
        juice_card_until(card, eval, true)
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            local played = card.ability.extra.playedHands
            if played[1] and played[2] and played[3] then
                local cardToMessage = card
                if context.blueprint then
                    cardToMessage = context.blueprint_card
                end
                SMODS.calculate_effect({dollars = card.ability.extra.dollars}, cardToMessage)
            end

            if not context.blueprint then
                local pokerHands = {}
                for k, v in pairs(G.GAME.hands) do
                    if v.visible then
                        pokerHands[#pokerHands + 1] = k
                    end
                end

                local firstHandIndex = pseudorandom("CGN_Assassin",1,#pokerHands)
                card.ability.extra.pokerHands[1] = pokerHands[firstHandIndex]
                table.remove(pokerHands, firstHandIndex)

                local secondHandIndex = pseudorandom("CGN_Assassin",1,#pokerHands)
                card.ability.extra.pokerHands[2] = pokerHands[secondHandIndex]
                table.remove(pokerHands, secondHandIndex)

                local thirdHandIndex = pseudorandom("CGN_Assassin",1,#pokerHands)
                card.ability.extra.pokerHands[3] = pokerHands[thirdHandIndex]

                card.ability.extra.playedHands = {false,false,false}

                local pokerHandsDesc = {}
                for i,v in ipairs(card.ability.extra.pokerHands) do
                    if not card.ability.extra.playedHands[i] then
                        table.insert(pokerHandsDesc,v)
                    end
                end

                if #pokerHandsDesc == 0 then
                    card.ability.extra.handsLeft = "Complete!"
                elseif #pokerHandsDesc == 1 then
                    card.ability.extra.handsLeft = pokerHandsDesc[1]
                elseif #pokerHandsDesc == 2 then
                    card.ability.extra.handsLeft = pokerHandsDesc[1].." and "..pokerHandsDesc[2]
                else
                    card.ability.extra.handsLeft = pokerHandsDesc[1]..", "..pokerHandsDesc[2]..", and "..pokerHandsDesc[3]
                end

                return {
                    message = localize('k_reset')
                }
            end
        end

        if context.before and context.main_eval and not context.blueprint then
            local newHand = false
            if context.scoring_name == card.ability.extra.pokerHands[1] and not card.ability.extra.playedHands[1] then
                card.ability.extra.playedHands[1] = true
                newHand = true
                SMODS.calculate_effect({message=card.ability.extra.pokerHands[1].."!",colour = G.C.FILTER}, card)
            elseif context.scoring_name == card.ability.extra.pokerHands[2] and not card.ability.extra.playedHands[2] then
                card.ability.extra.playedHands[2] = true
                newHand = true
                SMODS.calculate_effect({message=card.ability.extra.pokerHands[2].."!",colour = G.C.FILTER}, card)
            elseif context.scoring_name == card.ability.extra.pokerHands[3] and not card.ability.extra.playedHands[3] then
                card.ability.extra.playedHands[3] = true
                newHand = true
                SMODS.calculate_effect({message=card.ability.extra.pokerHands[3].."!",colour = G.C.FILTER}, card)
            end

            local played = card.ability.extra.playedHands
            if played[1] and played[2] and played[3] and newHand then
                SMODS.calculate_effect({message="Complete!",colour = G.C.FILTER}, card)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local eval = function() return card.ability.extra.handsLeft == "Complete!" end
                        juice_card_until(card, eval, true)
                        return true
                    end
                }))
            end

            local pokerHandsDesc = {}
            for i,v in ipairs(card.ability.extra.pokerHands) do
                if not card.ability.extra.playedHands[i] then
                    table.insert(pokerHandsDesc,v)
                end
            end

            if #pokerHandsDesc == 0 then
                card.ability.extra.handsLeft = "Complete!"
            elseif #pokerHandsDesc == 1 then
                card.ability.extra.handsLeft = pokerHandsDesc[1]
            elseif #pokerHandsDesc == 2 then
                card.ability.extra.handsLeft = pokerHandsDesc[1].." and "..pokerHandsDesc[2]
            else
                card.ability.extra.handsLeft = pokerHandsDesc[1]..", "..pokerHandsDesc[2]..", and "..pokerHandsDesc[3]
            end
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local pokerHands = {}
        for k, v in pairs(G.GAME.hands) do
            if v.visible then
                pokerHands[#pokerHands + 1] = k
            end
        end

        local firstHandIndex = pseudorandom("CGN_Assassin",1,#pokerHands)
        card.ability.extra.pokerHands[1] = pokerHands[firstHandIndex]
        table.remove(pokerHands, firstHandIndex)

        local secondHandIndex = pseudorandom("CGN_Assassin",1,#pokerHands)
        card.ability.extra.pokerHands[2] = pokerHands[secondHandIndex]
        table.remove(pokerHands, secondHandIndex)

        local thirdHandIndex = pseudorandom("CGN_Assassin",1,#pokerHands)
        card.ability.extra.pokerHands[3] = pokerHands[thirdHandIndex]

        card.ability.extra.playedHands = {false,false,false}

        local pokerHandsDesc = {}
        for i,v in ipairs(card.ability.extra.pokerHands) do
            if not card.ability.extra.playedHands[i] then
                table.insert(pokerHandsDesc,v)
            end
        end

        if #pokerHandsDesc == 0 then
            card.ability.extra.handsLeft = "Complete!"
        elseif #pokerHandsDesc == 1 then
            card.ability.extra.handsLeft = pokerHandsDesc[1]
        elseif #pokerHandsDesc == 2 then
            card.ability.extra.handsLeft = pokerHandsDesc[1].." and "..pokerHandsDesc[2]
        else
            card.ability.extra.handsLeft = pokerHandsDesc[1]..", "..pokerHandsDesc[2]..", and "..pokerHandsDesc[3]
        end
    end
}

SMODS.Atlas{
    key = "Coupon",
    path = "Coupon.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Coupon",
    atlas = "Coupon",
    pos = {x = 0, y = 0},
    attributes = {
        "passive"
    },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    calculate = function(self,card,context)
        if context.starting_shop and not context.blueprint then
            local firstCard = G.shop_jokers.cards[1]
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not firstCard.ability.couponed then
                        card:juice_up()
                        firstCard:juice_up()
                        firstCard.ability.couponed = true
                        firstCard:set_cost()
                    end
                    return true
                end
            }))
            return{
                message = "Couponed!",
                colour = G.C.FILTER
            }
        end
    end
}

SMODS.Atlas{
    key = "ThreeSevens",
    path = "ThreeSevens.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "ThreeSevens",
    atlas = "ThreeSevens",
    pos = {x = 0, y = 0},
    attributes = {
        "rank",
        "xmult",
        "seven"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        mult = 1.25,
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 7 then
            return {
                Xmult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = "Jegg",
    path = "Jegg.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Jegg",
    atlas = "Jegg",
    pos = {x = 0, y = 0},
    attributes = {
        "on_sell",
        "generation",
        "joker",
        "scaling"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        jokers_to_create = 1,
        increase = 1
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.jokers_to_create,card.ability.extra.increase}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss and not context.blueprint then
            local preValue = card.ability.extra.jokers_to_create
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "jokers_to_create",
                scalar_value = "increase",
                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = math.min(5,initial + change)
                end,
                no_message = true
            })
            if preValue < 5 then
                SMODS.calculate_effect({message=localize("k_upgrade_ex"),colour = G.C.FILTER}, card)
            else
                SMODS.calculate_effect({message="Capped!",colour = G.C.FILTER}, card)
            end
        end

        if context.selling_self and #G.jokers.cards + G.GAME.joker_buffer - 1 < G.jokers.config.card_limit then
            local extra = 0
            if not card.edition or (card.edition and not card.edition.negative) then
                extra = 1
            end
            local jokerCount = math.min(card.ability.extra.jokers_to_create, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer - extra))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokerCount
            local cardToMessage = card
            if context.blueprint then
                cardToMessage = context.blueprint_card
            end
            SMODS.calculate_effect({message="Jegg!",colour = G.C.FILTER},cardToMessage)
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = 1,jokerCount do
                        SMODS.add_card({set = "Joker", area = G.jokers, key_append = "CGN_Jegg"})
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
        end
    end,
    update = function(self, card, dt)
        if card.ability.extra.jokers_to_create > 5 then
            card.ability.extra.jokers_to_create = 5
        end
    end
}

SMODS.Atlas{
    key = "BestJoker",
    path = "BestJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "BestJoker",
    atlas = "BestJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult"
    },
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        Xmult = 4,
        revealed = false
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.Xmult,card.ability.extra.revealed}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult,
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss and not card.ability.extra.revealed and not context.blueprint then
            card.ability.extra.revealed = true
            card.ability.extra.Xmult = 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:add_sticker("eternal", true)
                    return true
                end
            }))
            return {
                message = "Baited!",
                colour = G.C.EDITION
            }
        end
    end,
}

SMODS.Atlas{
    key = "OldTV",
    path = "OldTV.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "OldTV",
    atlas = "OldTV",
    pos = {x = 0, y = 0},
    attributes = {
        "chips"
    },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        min = 0,
        max = 95
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.min,
            card.ability.extra.max
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = pseudorandom("CGN_OldTV",card.ability.extra.min,card.ability.extra.max)
            }
        end
    end
}

SMODS.Atlas{
    key = "Mushroom",
    path = "Mushroom.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Mushroom",
    atlas = "Mushroom",
    pos = {x = 0, y = 0},
    attributes = {
        "on_sell",
        "enhancements"
    },
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 2,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_wild"]
    end,
    calculate = function(self,card,context)
        if context.selling_self then
            if G.hand then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                for i,v in ipairs(G.hand.cards) do
                                    if not SMODS.has_enhancement(v, "m_wild") then
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                v:flip()
                                                play_sound('card1', 1)
                                                v:juice_up(0.3, 0.3)
                                                return true
                                            end
                                        }))
                                        delay(0.2)
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.1,
                                            func = function()
                                                v:set_ability(G.P_CENTERS["m_wild"])
                                                return true
                                            end
                                        }))
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.15,
                                            func = function()
                                                v:flip()
                                                play_sound('tarot2', 1, 0.6)
                                                v:juice_up(0.3, 0.3)
                                                return true
                                            end
                                        }))
                                    end
                                end
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "Cashback",
    path = "Cashback.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Cashback",
    atlas = "Cashback",
    pos = {x = 0, y = 0},
    attributes = {
        "economy",
        "chance",
        "reroll"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        dollars = 5,
        odds = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {vars = {card.ability.extra.dollars,num,denom}}
    end,
    calculate = function(self,card,context)
        if context.reroll_shop then
            if SMODS.pseudorandom_probability(card, "CGN_Cashback", 1, card.ability.extra.odds) then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "TarotStencil",
    path = "TarotStencil.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "TarotStencil",
    atlas = "TarotStencil",
    pos = {x = 0, y = 0},
    pixel_size = {w = 65},
    attributes = {
        "xmult"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    config = { extra = {
        scaling = 1,
        mult = 1
    }
    },
    loc_vars = function(self,info_queue,card)
        local XMultToGive = 1
        if G.consumeables then
            XMultToGive = math.max(1,1 + (card.ability.extra.scaling * (G.consumeables.config.card_limit - #G.consumeables.cards)))
        end

        card.ability.extra.mult = XMultToGive

        return {vars = {
            card.ability.extra.scaling,
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        local XMultToGive = 1
        if G.consumeables then
            XMultToGive = math.max(1,1 + (card.ability.extra.scaling * (G.consumeables.config.card_limit - #G.consumeables.cards)))
        end

        if context.joker_main then
            return {
                Xmult = XMultToGive
            }
        end
    end
}

SMODS.Atlas{
    key = "Pi",
    path = "Pi.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Pi",
    atlas = "Pi",
    pos = {x = 0, y = 0},
    attributes = {
        "xchips",
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    config = { extra = {
        chips = 3.14
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.chips
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Atlas{
    key = "StainedGlass",
    path = "StainedGlass.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "StainedGlass",
    atlas = "StainedGlass",
    pos = {x = 0, y = 0},
    attributes = {
        "chips",
        "mult",
        "enhancements"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        chips = 50,
        mult = 7
    }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_glass"]
        return {vars = {card.ability.extra.chips,card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_glass") then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end,
    in_pool = function(self,args)
        for i, v in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, "m_glass") then
                return true
            end
        end
        return false
    end
}

SMODS.Atlas{
    key = "Skillet",
    path = "Skillet.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Skillet",
    atlas = "Skillet",
    pos = {x = 0, y = 0},
    attributes = {
        "xmult",
        "suit",
        "spades"
    },
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        multPerCard = 0.4,
        suit = "Spades"
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.multPerCard,
            localize(card.ability.extra.suit, "suits_singular")
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local cardCount = 0
            for k,v in pairs(context.scoring_hand) do
                if v:is_suit(card.ability.extra.suit) then
                    cardCount = cardCount + 1
                end
            end

            return {
                xmult = 1 + (cardCount * card.ability.extra.multPerCard)
            }
        end
    end
}

SMODS.Atlas{
    key = "Uranium",
    path = "Uranium.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Uranium",
    atlas = "Uranium",
    pos = {x = 0, y = 0},
    pixel_size = {h = 71},
    attributes = {
        "enhancements",
        "CGN_Disease",
        "passive"
    },
    cost = 7,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        add = 1
    }},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_CGN_Disease"]
        return {vars = {
            card.ability.extra.add
        }}
    end,
    in_pool = function(self,args)
        for i, v in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, "m_CGN_Disease") then
                return true
            end
        end
        return false
    end
}

SMODS.Atlas{
    key = "BluePaint",
    path = "BluePaint.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "BluePaint",
    atlas = "BluePaint",
    pos = {x = 0, y = 0},
    attributes = {
        "chips",
        "enhancements"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    config = { extra = {
        chips = 40
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.chips
        }}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and next(SMODS.get_enhancements(context.other_card)) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Atlas{
    key = "CursedJoker",
    path = "CursedJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "CursedJoker",
    atlas = "CursedJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "chips",
        "mult"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        chips = 66,
        mult = 6
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.chips,
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = "EggJoker",
    path = "EggJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "EggJoker",
    atlas = "EggJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "mult",
        "scaling"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 1,
    config = { extra = {
        scaling = 3,
        mult = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.scaling,card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "scaling",
                message_key = "a_mult",
                message_colour = G.C.FILTER
            })
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = "StarOfTheShow",
    path = "StarOfTheShow.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "StarOfTheShow",
    atlas = "StarOfTheShow",
    pos = {x = 0, y = 0},
    attributes = {
        "rank",
        "ace",
        "retrigger"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    calculate = function(self,card,context)
        if context.repetition and context.other_card:get_id() == 14 and
        (context.cardarea == G.play or (context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1))) then
            return {
                repetitions = 1
            }
        end
    end
}

SMODS.Atlas{
    key = "SmudgedJoker",
    path = "SmudgedJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "SmudgedJoker",
    atlas = "SmudgedJoker",
    pos = {x = 0, y = 0},
    attributes = {
        "suit",
        "passive",
        "hearts",
        "spades",
        "diamonds",
        "clubs"
    },
    cost = 7,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2
}

local smods_smeared_check_ref = SMODS.smeared_check
function SMODS.smeared_check(card, suit, ...)
    if next(SMODS.find_card("j_CGN_SmudgedJoker")) then
        if ((card.base.suit == "Hearts" or card.base.suit == "Spades") and (suit == "Hearts" or suit == "Spades")) then
            return true
        elseif (card.base.suit == "Diamonds" or card.base.suit == "Clubs") and (suit == "Diamonds" or suit == "Clubs") then
            return true
        end
    end
    return smods_smeared_check_ref(card, suit, ...)
end

SMODS.Atlas{
    key = "BoosterJoker",
    path = "BoosterJoker.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "BoosterJoker",
    atlas = "BoosterJoker",
    pos = {x = 0, y = 0},
    pixel_size = {w = 59},
    attributes = {
        "generation",
        "tag"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        odds = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_TAGS["tag_charm"]
        info_queue[#info_queue+1] = G.P_TAGS["tag_meteor"]
        info_queue[#info_queue+1] = G.P_TAGS["tag_ethereal"]
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {vars = {
            localize({ type = "name_text", set = "Tag", key = "tag_charm" }),
            localize({ type = "name_text", set = "Tag", key = "tag_meteor" }),
            localize({ type = "name_text", set = "Tag", key = "tag_ethereal" }),
            num,
            denom
        }}
    end,
    calculate = function(self,card,context)
        if context.ending_shop and SMODS.pseudorandom_probability(card, "CGN_BoosterJoker", 1, card.ability.extra.odds) then
            local tagList = {"tag_charm","tag_meteor","tag_ethereal"}
            local tagKey = pseudorandom_element(tagList, pseudoseed("CGN_BoosterJoker"))

            local cardToMessage = card
            if context.blueprint then
                cardToMessage = context.blueprint_card
            end

            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.calculate_effect({message="Tag!",colour = G.C.FILTER}, cardToMessage)
                    add_tag({ key = tagKey })
                    play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
                    play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true
        end
    end
}

SMODS.Atlas{
    key = "BurningHand",
    path = "BurningHand.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "BurningHand",
    atlas = "BurningHand",
    pos = {x = 0, y = 0},
    attributes = {
        "chips",
        "hands"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        multPerHand = 5
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.multPerHand
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                mult = G.GAME.current_round.hands_left * card.ability.extra.multPerHand
            }
        end
    end
}

SMODS.Atlas{
    key = "SevenSegmentDisplay",
    path = "SevenSegmentDisplay.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "SevenSegmentDisplay",
    atlas = "SevenSegmentDisplay",
    pos = {x = 0, y = 0},
    attributes = {
        "economy",
        "scaling",
        "reset"
    },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 1,
    config = { extra = {
        resetValue = 9,
        scaling = 1,
        payout = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.resetValue,card.ability.extra.scaling,card.ability.extra.payout}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "payout",
                scalar_value = "scaling",
                operation = function(ref_table, ref_value, initial, change)
                    local n = initial + change
                    if n <= ref_table["resetValue"] then
                        ref_table[ref_value] = n
                    else
                        ref_table[ref_value] = 0
                    end
                end,
                no_message = true
            })
            function setSprite()
                local c = card.ability.extra
                local pos = math.floor((9*(c.payout/c.resetValue))+0.5)
                card.children.center:set_sprite_pos({x = pos, y = 0})
            end
            if card.ability.extra.payout == 0 then
                SMODS.calculate_effect({message=localize("k_reset"),colour = G.C.FILTER,func = setSprite()}, card)
            else
                SMODS.calculate_effect({message="+$"..card.ability.extra.scaling,colour = G.C.MONEY,func = setSprite()}, card)
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.payout ~= 0 then
            return card.ability.extra.payout
        end
    end,
    set_sprites = function(self, card, front)
        if not card.config.center.discovered then
            return
        end

        if card.ability then
            local c = card.ability.extra
            local pos = math.floor((9*(c.payout/c.resetValue))+0.5)
            card.children.center:set_sprite_pos({x = pos, y = 0})
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    local c = card.ability.extra
                    local pos = math.floor((9*(c.payout/c.resetValue))+0.5)
                    card.children.center:set_sprite_pos({x = pos, y = 0})
                    return true
                end
            }))
        end
    end
}

SMODS.Atlas{
    key = "KingOfPranks",
    path = "KingOfPranks.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "KingOfPranks",
    atlas = "KingOfPranks",
    pos = {x = 0, y = 0},
    pixel_size = {h = 71},
    attributes = {
        "economy",
        "rank",
        "king"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        payoutMin = 7,
        payoutMax = 9
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.payoutMin,
            card.ability.extra.payoutMax
        }}
    end,
    calculate = function(self,card,context)
        if context.remove_playing_cards then
            local kingsRemoved = 0
            for i,v in ipairs(context.removed) do
                if v:get_id() == 13 then
                    kingsRemoved = kingsRemoved + 1
                end
            end

            local dollarsToAdd = 0
            for i = 1,kingsRemoved do
                dollarsToAdd = dollarsToAdd + pseudorandom("CGN_KingOfPranks",card.ability.extra.payoutMin,card.ability.extra.payoutMax)
            end

            if dollarsToAdd ~= 0 then
                return {
                    dollars = dollarsToAdd
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "Aluminum",
    path = "Aluminum.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Aluminum",
    atlas = "Aluminum",
    pos = {x = 0, y = 0},
    pixel_size = {h = 71},
    attributes = {
        "editions",
        "joker"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    loc_vars = function(self,info_queue,card)
        if not card.edition or (card.edition and not card.edition.foil) then
            info_queue[#info_queue + 1] = G.P_CENTERS["e_foil"]
        end
    end,
    calculate = function(self,card,context)
        if context.setting_blind and context.blind.key == "bl_small" then
            local cardToMessage = card if context.blueprint then cardToMessage = context.blueprint_card end
            for i,v in ipairs(G.jokers.cards) do
                if not v.edition then
                    v:set_edition("e_foil",false)
                    SMODS.calculate_effect({message="Foiled!",colour=G.C.DARK_EDITION},cardToMessage)
                    break
                end
            end
        end
    end
}

SMODS.Atlas{
    key = "Bismuth",
    path = "Bismuth.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Bismuth",
    atlas = "Bismuth",
    pos = {x = 0, y = 0},
    pixel_size = {h = 71},
    attributes = {
        "editions",
        "joker"
    },
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    loc_vars = function(self,info_queue,card)
        if not card.edition or (card.edition and not card.edition.holo) then
            info_queue[#info_queue + 1] = G.P_CENTERS["e_holo"]
        end
    end,
    calculate = function(self,card,context)
        if context.setting_blind and context.blind.key == "bl_small" then
            local cardToMessage = card if context.blueprint then cardToMessage = context.blueprint_card end
            for i,v in ipairs(G.jokers.cards) do
                if not v.edition then
                    v:set_edition("e_holo",false)
                    SMODS.calculate_effect({message="Holographed!",colour=G.C.DARK_EDITION},cardToMessage)
                    break
                end
            end
        end
    end
}

SMODS.Atlas{
    key = "Iridium",
    path = "Iridium.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Iridium",
    atlas = "Iridium",
    pos = {x = 0, y = 0},
    pixel_size = {h = 71},
    attributes = {
        "editions",
        "joker"
    },
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    loc_vars = function(self,info_queue,card)
        if not card.edition or (card.edition and not card.edition.polychrome) then
            info_queue[#info_queue + 1] = G.P_CENTERS["e_polychrome"]
        end
    end,
    calculate = function(self,card,context)
        if context.setting_blind and context.blind.key == "bl_small" then
            local cardToMessage = card if context.blueprint then cardToMessage = context.blueprint_card end
            for i,v in ipairs(G.jokers.cards) do
                if not v.edition then
                    v:set_edition("e_polychrome",false)
                    SMODS.calculate_effect({message="Polychromed!",colour=G.C.DARK_EDITION},cardToMessage)
                    break
                end
            end
        end
    end
}

SMODS.Atlas{
    key = "BirthCertificate",
    path = "BirthCertificate.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "BirthCertificate",
    atlas = "BirthCertificate",
    pos = {x = 0, y = 0},
    attributes = {
        "joker",
        "generation"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    calculate = function(self,card,context)
        if context.open_booster then
            local jokerCount = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokerCount
            local cardToMessage = card
            if context.blueprint then
                cardToMessage = context.blueprint_card
            end
            SMODS.calculate_effect({message=localize("k_plus_joker"),colour=G.C.BLUE},cardToMessage)
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = 1,jokerCount do
                        SMODS.add_card({set = "Joker", area = G.jokers, rarity = "Common", key_append = "CGN_BirthCertificate"})
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
        end
    end
}

SMODS.Atlas{
    key = "EMP",
    path = "EMP.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "EMP",
    atlas = "EMP",
    pos = {x = 0, y = 0},
    attributes = {
        "passive",
        "planet"
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        odds = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        local num,denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {vars = {
            num,
            denom
        }}
    end,
    calculate = function(self,card,context)
        if context.using_consumeable and context.consumeable.ability.set == "Planet" and context.consumeable.ability.hand_type and SMODS.pseudorandom_probability(card, "CGN_EMP", 1, card.ability.extra.odds) then
            local cardToMessage = card
            if context.blueprint then
                cardToMessage = context.blueprint_card
            end
            SMODS.calculate_effect({message=localize("k_level_up_ex"),colour=G.C.SECONDARY_SET.Planet},cardToMessage)
            SMODS.upgrade_poker_hands({hands = context.consumeable.ability.hand_type, from = cardToMessage})
        end
    end
}

SMODS.Atlas{
    key = "StuntDouble",
    path = "StuntDouble.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "StuntDouble",
    atlas = "StuntDouble",
    pos = {x = 0, y = 0},
    attributes = {
        "mult",
        "hands"
    },
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    config = { extra = {
        mult = 30,
        handsLoss = 1
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.mult,
            card.ability.extra.handsLoss
        }}
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.handsLoss
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.handsLoss
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = "Accretion",
    path = "Accretion.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Accretion",
    atlas = "Accretion",
    pos = {x = 0, y = 0},
    attributes = {
        "mult",
        "full_deck",
        "space"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        multPerCard = 2,
        currentMult = 0,
        startingDeckSize = 52
    }
    },
    loc_vars = function(self,info_queue,card)
        local currentMult = 0
        if G.playing_cards then
            currentMult = math.max(0, card.ability.extra.multPerCard * (#G.playing_cards - G.GAME.starting_deck_size))
        end
        card.ability.extra.currentMult = currentMult
        card.ability.extra.startingDeckSize = G.GAME.starting_deck_size
        return {vars = {
            card.ability.extra.multPerCard,
            card.ability.extra.currentMult,
            card.ability.extra.startingDeckSize
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                mult = math.max(0, card.ability.extra.multPerCard * (#G.playing_cards - G.GAME.starting_deck_size))
            }
        end
    end
}

SMODS.Atlas{
    key = "InstantGratification",
    path = "InstantGratification.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "InstantGratification",
    atlas = "InstantGratification",
    pos = {x = 0, y = 0},
    attributes = {
        "economy",
        "discard"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        dollars = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.dollars
        }}
    end,
    calculate = function(self,card,context)
        if context.pre_discard then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end
}

SMODS.Atlas{
    key = "SpinningJoker",
    path = "SpinningJoker.png",
    px = 95,
    py = 95,
    atlas_table = "ANIMATION_ATLAS",
    frames = 4,
    fps = 4
}

SMODS.Joker{
    key = "SpinningJoker",
    atlas = "SpinningJoker",
    pixel_size = {w = 95},
    pos = {x = 0, y = 0},
    attributes = {
        "chips",
        "scaling",
        "nonscoring"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        chips = 0,
        scaling = 2,
        tempScaling = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.chips,
            card.ability.extra.scaling,
            card.ability.extra.tempScaling
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.before and not context.blueprint then
            for i,v in ipairs(context.scoring_hand) do
                v.j_CGN_SpinningJoker_Scoring = true
            end
            local nonScoringCards = 0
            for i,v in ipairs(context.full_hand) do
                if not v.j_CGN_SpinningJoker_Scoring then
                    nonScoringCards = nonScoringCards + 1
                end
                v.j_CGN_SpinningJoker_Scoring = nil
            end
            card.ability.extra.tempScaling = nonScoringCards * card.ability.extra.scaling
            if card.ability.extra.tempScaling ~= 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_value = "tempScaling",
                    message_key = "a_chips",
                    message_colour = G.C.FILTER
                })
            end
        end
    end,
    update = function(self,card,dt)
        if not card.config.center.discovered then
            return
        end
        if G.SETTINGS.reduced_motion then
            card.children.center.current_animation.FPS = 1
        else
            card.children.center.current_animation.FPS = math.min(10,math.floor(math.log(math.max(1,(card.ability.extra.chips or 0)),2))+1)
        end
    end
}

SMODS.Atlas{
    key = "IndexCard",
    path = "IndexCard.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "IndexCard",
    atlas = "IndexCard",
    pos = {x = 0, y = 0},
    pixel_size = {h = 29},
    attributes = {
        "economy"
    },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    config = { extra = {
        dollars = 7
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.dollars}}
    end,
    calc_dollar_bonus = function(self, card)
        if not SMODS.last_hand_oneshot then
            return card.ability.extra.dollars
        end
    end
}

SMODS.Atlas{
    key = "FireAndIce",
    path = "FireAndIce.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "FireAndIce",
    atlas = "FireAndIce",
    pos = {x = 0, y = 0},
    attributes = {
        "chips",
        "scaling"
    },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 2,
    config = { extra = {
        chips = 0,
        scaling = 3
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {
            card.ability.extra.chips,
            card.ability.extra.scaling
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}