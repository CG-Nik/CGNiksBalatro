SMODS.Atlas{
    key = "sleeves1",
    path = "sleeves1.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve {
    key = "InfectedSleeve",
    atlas = "sleeves1",
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
                        if v:get_id() == 14 then
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
                        if v:get_id() == 2 then
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

CardSleeves.Sleeve {
    key = "OopsAllSixesSleeve",
    atlas = "sleeves1",
    pos = {x = 1, y = 0},
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
            vars = {
                self.config.extra.probMod
            }
        end
        return { key = key, vars = vars }
    end,
    calculate = function(self,sleeve,context)
        if context.mod_probability then
            return {
                numerator = context.numerator * self.config.extra.probMod * 2,
                denominator = context.denominator * 2
            }
        end
    end
}

CardSleeves.Sleeve {
    key = "InverseTealSleeve",
    atlas = "sleeves1",
    pos = {x = 2, y = 0},
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

CardSleeves.Sleeve {
    key = "PirateSleeve",
    atlas = "sleeves1",
    pos = {x = 3, y = 0},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_PirateDeck", stake = "stake_white" },
    config = {
        extra = {
            ante_scaling = 1.5,
            dollars = 12,
            dollars_alt = 3
        }
    },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_CGN_PirateDeck" then
            key = self.key .. "_alt"
            vars = {
                self.config.extra.dollars_alt,
            }
        else
            key = self.key
            vars = {
                self.config.extra.ante_scaling,
                self.config.extra.dollars
            }
        end
        return { key = key, vars = vars }
    end,
    apply = function(self,sleeve)
        if self.get_current_deck_key() ~= "b_CGN_PirateDeck" then
            G.GAME.starting_params.ante_scaling = (G.GAME.starting_params.ante_scaling or 1) * self.config.extra.ante_scaling
        end

        CardSleeves.Sleeve.apply(self, sleeve)
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

CardSleeves.Sleeve {
    key = "TheseusSleeve",
    atlas = "sleeves1",
    pos = {x = 4, y = 0},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_TheseusDeck", stake = "stake_white" },
    config = {
        extra = {
            ante_scaling = 1.5,
            cardsAdded = 4,
            cardsDestroyed = 2
        }
    },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_CGN_TheseusDeck" then
            key = self.key .. "_alt"
            vars = {
                self.config.extra.ante_scaling
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
    apply = function(self,sleeve)
        if self.get_current_deck_key() == "b_CGN_TheseusDeck" then
            G.GAME.starting_params.ante_scaling = (G.GAME.starting_params.ante_scaling or 1) * self.config.extra.ante_scaling
        end

        CardSleeves.Sleeve.apply(self, sleeve)
    end,
    calculate = function(self,sleeve,context)
        if self.get_current_deck_key() == "b_CGN_TheseusDeck" then
            -- effect is handled in the Theseus Deck itself
        else
            if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
                local cardsToDestroy = math.min(self.config.extra.cardsDestroyed,#G.deck.cards)
                local pluralization = "s"
                if cardsToDestroy == 1 then
                    pluralization = ""
                end
                
                for i = 1,cardsToDestroy do
                    local cardDestroyed = pseudorandom_element(G.deck.cards, "CGN_TheseusSleeve")
                    SMODS.destroy_cards(cardDestroyed)
                end

                SMODS.calculate_effect({message="-"..cardsToDestroy.." Card"..pluralization,colour=G.C.RED},G.deck)

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

CardSleeves.Sleeve {
    key = "SleevesLua",
    atlas = "sleeves1",
    pos = {x = 0, y = 1},
    unlocked = false,
    unlock_condition = { deck = "b_CGN_DecksLua", stake = "stake_white" },
    config = {
        voucher = "v_CGN_MainLua",
        consumables = {
            "c_CGN_LuaCardsLua"
        }
    },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_CGN_DecksLua" then
            key = self.key .. "_alt"
            self.config.voucher = "v_CGN_ConfigLua"
            self.config.consumables = {"c_CGN_LuaCardsLua"}
            vars = {
                localize({type = "name_text", key = self.config.voucher, set = "Voucher"}),
                localize({type = "name_text", key = self.config.consumables[1], set = "CGN_Lua"})
            }
        else
            key = self.key
            self.config.voucher = "v_CGN_MainLua"
            self.config.consumables = {"c_CGN_LuaCardsLua"}
            vars = {
                localize({type = "name_text", key = self.config.voucher, set = "Voucher"}),
                localize({type = "name_text", key = self.config.consumables[1], set = "CGN_Lua"})
            }
        end
        return { key = key, vars = vars }
    end
}