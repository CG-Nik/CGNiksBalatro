SMODS.Atlas{
    key = "FunctionTag",
    path = "FunctionTag.png",
    px = 34,
    py = 34
}

SMODS.Tag {
    key = "FunctionTag",
    atlas = "FunctionTag",
    min_ante = 2,
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_CGN_MegaLuaPack_1
    end,
    apply = function(self, tag, context)
        if context.type == "new_blind_choice" then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep("+", G.C.SECONDARY_SET.CGN_Lua, function()
                local booster = SMODS.create_card({key = "p_CGN_MegaLuaPack_" .. math.random(1, 1), area = G.play})
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({config = {ref_table = booster}})
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Atlas{
    key = "NeonTag",
    path = "NeonTag.png",
    px = 34,
    py = 34
}

SMODS.Tag {
    key = "NeonTag",
    atlas = "NeonTag",
    min_ante = 2,
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_CGN_NeonArcanaPack_1
        info_queue[#info_queue + 1] = G.P_CENTERS.p_CGN_NeonCelestialPack_1
        info_queue[#info_queue + 1] = G.P_CENTERS.p_CGN_NeonStandardPack_1
        info_queue[#info_queue + 1] = G.P_CENTERS.p_CGN_NeonBuffoonPack_1
        info_queue[#info_queue + 1] = G.P_CENTERS.p_CGN_NeonSpectralPack_1
        info_queue[#info_queue + 1] = G.P_CENTERS.p_CGN_NeonLuaPack_1
    end,
    apply = function(self, tag, context)
        if context.type == "new_blind_choice" then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            local packs = {
                {"p_CGN_NeonArcanaPack_",4,G.C.SECONDARY_SET.Tarot},
                {"p_CGN_NeonCelestialPack_",4,G.C.SECONDARY_SET.Planet},
                {"p_CGN_NeonStandardPack_",4,G.C.FILTER},
                {"p_CGN_NeonBuffoonPack_",2,G.C.FILTER},
                {"p_CGN_NeonSpectralPack_",2,G.C.SECONDARY_SET.Spectral},
                {"p_CGN_NeonLuaPack_",2,G.C.SECONDARY_SET.CGN_Lua}
            }
            local selectedPack = pseudorandom_element(packs,"CGN_NeonTag")
            tag:yep("+", selectedPack[3], function()
                local booster = SMODS.create_card({key = selectedPack[1] .. math.random(1, selectedPack[2]), area = G.play})
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({config = {ref_table = booster}})
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}