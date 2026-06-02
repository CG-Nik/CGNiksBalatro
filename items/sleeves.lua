SMODS.Atlas{
    key = "InfectedSleeve",
    path = "InfectedSleeve.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve {
    key = "InfectedSleeve",
    atlas = "InfectedSleeve",
    pos = {x = 0, y = 0},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_InfectedDeck", stake = "stake_white" },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_CGN_InfectedDeck" then
            key = self.key .. "_alt"
        else
            key = self.key
        end
        return { key = key, vars = vars }
    end,
    apply = function(self,sleeve)
        if self.get_current_deck_key() == "b_CGN_InfectedDeck" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not G.playing_cards then return false end
                    for i, v in ipairs(G.playing_cards) do
                        if v:is_face() then
                            v:set_ability(G.P_CENTERS["m_CGN_Disease"])
                        end
                    end
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not G.playing_cards then return false end
                    for i, v in ipairs(G.playing_cards) do
                        if v:get_id() == 2 or v:get_id() == 14 then
                            v:set_ability(G.P_CENTERS["m_CGN_Disease"])
                        end
                    end
                    return true
                end
            }))
        end

        CardSleeves.Sleeve.apply(self, sleeve)
    end
}

SMODS.Atlas{
    key = "OopsAllSixesSleeve",
    path = "OopsAllSixesSleeve.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve {
    key = "OopsAllSixesSleeve",
    atlas = "OopsAllSixesSleeve",
    pos = {x = 0, y = 0},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_OopsAllSixesDeck", stake = "stake_white" },
    config = {
        extra = {
            probMod = 1.5
        }
    },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_CGN_OopsAllSixesDeck" then
            key = self.key .. "_alt"
            vars = {
                self.config.extra.probMod
            }
        else
            key = self.key
        end
        return { key = key, vars = vars }
    end,
    apply = function(self,sleeve)
        if self.get_current_deck_key() ~= "b_CGN_OopsAllSixesDeck" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not G.playing_cards then return false end
                    for i, v in ipairs(G.playing_cards) do
                        if v:get_id() == 5 or v:get_id() == 7 then
                            assert(SMODS.change_base(v, nil, "6"))
                        end
                    end
                    return true
                end
            }))
        end

        CardSleeves.Sleeve.apply(self, sleeve)
    end,
    calculate = function(self,sleeve,context)
        if context.mod_probability and self.get_current_deck_key() == "b_CGN_OopsAllSixesDeck" then
            return {
                numerator = context.numerator * self.config.extra.probMod * 2,
                denominator = context.denominator * 2
            }
        end
    end
}

SMODS.Atlas{
    key = "InverseTealSleeve",
    path = "InverseTealSleeve.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve {
    key = "InverseTealSleeve",
    atlas = "InverseTealSleeve",
    pos = {x = 0, y = 0},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_InverseTealDeck", stake = "stake_white" },
    config = {
        extra = {
            permaMult = 1
        }
    },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_CGN_InverseTealDeck" then
            key = self.key .. "_alt"
            vars = {
                self.config.extra.permaMult
            }
        else
            key = self.key
        end
        return { key = key, vars = vars }
    end,
    apply = function(self,sleeve)
        if self.get_current_deck_key() == "b_CGN_InverseTealDeck" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not G.playing_cards then return false end
                    for i, v in ipairs(G.playing_cards) do
                        v.ability.perma_mult = v.ability.perma_mult or 0
                        v.ability.perma_mult = v.ability.perma_mult + self.config.extra.permaMult
                    end
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not G.playing_cards then return false end
                    for i, v in ipairs(G.playing_cards) do
                        v.ability.perma_bonus = v.ability.perma_bonus or 0
                        v.ability.perma_bonus = v.ability.perma_bonus + (v.base.nominal * 2)
                    end
                    return true
                end
            }))
        end

        CardSleeves.Sleeve.apply(self, sleeve)
    end
}

SMODS.Atlas{
    key = "PirateSleeve",
    path = "PirateSleeve.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve {
    key = "PirateSleeve",
    atlas = "PirateSleeve",
    pos = {x = 0, y = 0},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_PirateDeck", stake = "stake_white" },
    config = {
        ante_scaling = 1.5,
        extra = {
            dollars = 8,
            dollars_alt = 3
        }
    },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_plasma" then -- you can't have multiple ante_scaling effects at once (at least simply), so it doesn't have the ante_scaling effect with plasma
            key = self.key .. "_plasma"
            vars = {
                self.config.extra.dollars
            }
        elseif self.get_current_deck_key() == "b_CGN_PirateDeck" then
            key = self.key .. "_alt"
            vars = {
                self.config.extra.dollars_alt
            }
        else
            key = self.key
            vars = {
                self.config.ante_scaling,
                self.config.extra.dollars
            }
        end
        return { key = key, vars = vars }
    end,
    calculate = function(self,sleeve,context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if context.beat_boss and self.get_current_deck_key() ~= "b_CGN_PirateDeck" then
                return {
                    dollars = self.config.extra.dollars
                }
            elseif not context.beat_boss and self.get_current_deck_key() == "b_CGN_PirateDeck" then
                return {
                    dollars = self.config.extra.dollars_alt
                }
            end
        end
    end
}

SMODS.Atlas{
    key = "TheseusSleeve",
    path = "TheseusSleeve.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve {
    key = "TheseusSleeve",
    atlas = "TheseusSleeve",
    pos = {x = 0, y = 0},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_TheseusDeck", stake = "stake_white" },
    config = {
        extra = {
            cardsAdded = 4,
            cardsDestroyed = 2
        }
    },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_CGN_TheseusDeck" then
            key = self.key .. "_alt"
            vars = {
                
            }
        else
            key = self.key
            vars = {
                self.config.extra.cardsAdded,
                self.config.extra.cardsDestroyed
            }
        end
        return { key = key, vars = vars }
    end,
    calculate = function(self,sleeve,context)
        if self.get_current_deck_key() == "b_CGN_TheseusDeck" then
            -- effect is handled in the Theseus Deck itself
        else
            if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
                for i = 1,self.config.extra.cardsDestroyed do
                    local cardDestroyed = pseudorandom_element(G.deck.cards, "CGN_TheseusSleeve")
                    SMODS.destroy_cards(cardDestroyed)
                end

                SMODS.calculate_effect({message="-"..self.config.extra.cardsDestroyed.." Cards",colour=G.C.RED},G.deck)

                local newCards = {}
                for i = 1,self.config.extra.cardsAdded do
                    local newCard = SMODS.add_card({set="Enhanced",area=G.deck})
                    table.insert(newCards,newCard)
                end

                return {
                    message = "+"..self.config.extra.cardsAdded.." Cards",
                    colour = G.C.BLUE,
                    func = function()
                        SMODS.calculate_context({ playing_card_added = true, cards = { newCards } })
                    end
                }
            end
        end
    end
}