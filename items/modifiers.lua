SMODS.Atlas{
    key = "Disease",
    path = "Disease.png",
    px = 71,
    py = 95
}

SMODS.Enhancement{
    key = "Disease",
    atlas = "Disease",
    discovered = true,
    pos = {x = 0, y = 0},
    config = { bonus = 15,
        mult = 2,
        extra = {}
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.bonus,
        card.ability.mult
    }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if specific_vars and specific_vars.nominal_chips and not self.replace_base_card then
            localize { type = 'other', key = 'card_chips', nodes = desc_nodes, vars = { specific_vars.nominal_chips } }
        end
        if specific_vars and specific_vars.bonus_chips then
            localize { type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = { SMODS.signed(specific_vars.bonus_chips) } }
        end
        SMODS.Enhancement.super.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        SMODS.localize_perma_bonuses(specific_vars, desc_nodes)
    end
}

SMODS.current_mod.calculate = function(self,context)
    if context.before then
        local infections = {}

        for i,v in ipairs(context.scoring_hand) do
            if SMODS.has_enhancement(v, "m_CGN_Disease") and not v.debuff then
                table.insert(infections,{v,nil})
                for i1,v1 in ipairs(SMODS.find_card("j_CGN_Uranium", false)) do
                    for i2 = 1,v1.ability.extra.add do
                        table.insert(infections,{v,v1})
                    end
                end
            end
        end

        local viableHand = {}

        for i,v in ipairs(context.full_hand) do
            if not next(SMODS.get_enhancements(v)) then
                table.insert(viableHand,v)
            end
        end

        for i,v in ipairs(viableHand) do
            if i <= #infections then
                v:set_ability("m_CGN_Disease", nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:juice_up()
                        infections[i][1]:juice_up()
                        if infections[i][2] then
                            infections[i][2]:juice_up()
                        end
                        return true
                    end
                }))
                SMODS.calculate_effect({message="Infected!",colour = G.C.GREEN}, v)
                delay(0.2)
            end
        end
    end
end