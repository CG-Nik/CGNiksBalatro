SMODS.Atlas{
    key = "InfectedDeck",
    path = "InfectedDeck.png",
    px = 71,
    py = 95
}

SMODS.Back{
    key = "InfectedDeck",
    atlas = "InfectedDeck",
    unlocked = false,
    pos = {x = 0, y = 0},
    apply = function(self,back)
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
    end,
    check_for_unlock = function(self, args)
        if args.type == "hand_contents" then
            local tally = 0
            for i = 1, #args.cards do
                if SMODS.has_enhancement(args.cards[i], "m_CGN_Disease") then
                    tally = tally + 1
                    if tally == 5 then
                        return true
                    end
                end
            end
        end
        return false
    end
}

SMODS.Atlas{
    key = "OopsAllSixesDeck",
    path = "OopsAllSixesDeck.png",
    px = 71,
    py = 95
}

SMODS.Back{
    key = "OopsAllSixesDeck",
    atlas = "OopsAllSixesDeck",
    pos = {x = 0, y = 0},
    apply = function(self,back)
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
}

SMODS.Atlas{
    key = "InverseTealDeck",
    path = "InverseTealDeck.png",
    px = 71,
    py = 95
}

SMODS.Back{
    key = "InverseTealDeck",
    atlas = "InverseTealDeck",
    pos = {x = 0, y = 0},
    apply = function(self,back)
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
}

SMODS.Atlas{
    key = "PirateDeck",
    path = "PirateDeck.png",
    px = 71,
    py = 95
}

SMODS.Back{
    key = "PirateDeck",
    atlas = "PirateDeck",
    pos = {x = 0, y = 0},
    config = {
        ante_scaling = 1.5,
        extra = {
            dollars = 8
        }
    },
    loc_vars = function(self, info_queue, back)
        return { vars = {
            self.config.ante_scaling,
            self.config.extra.dollars
        }}
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            return {
                dollars = self.config.extra.dollars
            }
        end
    end
}

SMODS.Atlas{
    key = "TheseusDeck",
    path = "TheseusDeck.png",
    px = 71,
    py = 95
}

SMODS.Back{
    key = "TheseusDeck",
    atlas = "TheseusDeck",
    pos = {x = 0, y = 0},
    config = {
        extra = {
            cardsAdded = 4,
            cardsDestroyed = 2
        }
    },
    loc_vars = function(self, info_queue, back)
        return { vars = {
            self.config.extra.cardsAdded,
            self.config.extra.cardsDestroyed
        }}
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            for i = 1,self.config.extra.cardsDestroyed do
                local cardDestroyed = pseudorandom_element(G.deck.cards, "CGN_TheseusDeck")
                SMODS.destroy_cards(cardDestroyed)
            end

            SMODS.calculate_effect({message="-"..self.config.extra.cardsDestroyed.." Cards",colour=G.C.RED},G.deck)

            local newCards = {}
            for i = 1,self.config.extra.cardsAdded do
                local addCard = {set="Enhanced",area=G.deck,no_edition=true}
                if G.GAME.selected_sleeve == "sleeve_CGN_TheseusSleeve" then
                    addCard = {set="Enhanced",area=G.deck,edition=SMODS.poll_edition({key="CGN_TheseusDeck",no_negative=true,guaranteed=true}),seal=SMODS.poll_seal({key="CGN_TheseusDeck",guaranteed=true})}
                end
                local newCard = SMODS.add_card(addCard)
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
}