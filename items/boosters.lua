SMODS.Atlas{
    key = "NeonArcanaPack",
    path = "NeonArcanaPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "NeonArcanaPack_1",
    weight = 0.125,
    kind = "Arcana",
    atlas = "NeonArcanaPack",
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_arcana_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.TAROT_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.005,
            scale = 0.1,
            initialize = true,
            lifespan = 2,
            speed = 1.5,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local createdCard
        if G.GAME.used_vouchers.v_omen_globe and pseudorandom("omen_globe") > 0.8 then
            createdCard = {
                set = "Spectral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack_Omen"
            }
        else
            createdCard = {
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack"
            }
        end
        return createdCard
    end
}

SMODS.Booster {
    key = "NeonArcanaPack_2",
    weight = 0.125,
    kind = "Arcana",
    atlas = "NeonArcanaPack",
    cost = 8,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_arcana_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.TAROT_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.005,
            scale = 0.1,
            initialize = true,
            lifespan = 2,
            speed = 1.5,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local createdCard
        if G.GAME.used_vouchers.v_omen_globe and pseudorandom("omen_globe") > 0.8 then
            createdCard = {
                set = "Spectral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack_Omen"
            }
        else
            createdCard = {
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack"
            }
        end
        return createdCard
    end
}

SMODS.Booster {
    key = "NeonArcanaPack_3",
    weight = 0.125,
    kind = "Arcana",
    atlas = "NeonArcanaPack",
    cost = 8,
    pos = { x = 2, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_arcana_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.TAROT_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.005,
            scale = 0.1,
            initialize = true,
            lifespan = 2,
            speed = 1.5,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local createdCard
        if G.GAME.used_vouchers.v_omen_globe and pseudorandom("omen_globe") > 0.8 then
            createdCard = {
                set = "Spectral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack_Omen"
            }
        else
            createdCard = {
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack"
            }
        end
        return createdCard
    end
}

SMODS.Booster {
    key = "NeonArcanaPack_4",
    weight = 0.125,
    kind = "Arcana",
    atlas = "NeonArcanaPack",
    cost = 8,
    pos = { x = 3, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_arcana_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.TAROT_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.2/2,
            initialize = true,
            lifespan = 1*2,
            speed = 1.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local createdCard
        if G.GAME.used_vouchers.v_omen_globe and pseudorandom("omen_globe") > 0.8 then
            createdCard = {
                set = "Spectral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack_Omen"
            }
        else
            createdCard = {
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "CGN_NeonArcanaPack"
            }
        end
        return createdCard
    end
}

SMODS.Atlas{
    key = "NeonCelestialPack",
    path = "NeonCelestialPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "NeonCelestialPack_1",
    weight = 0.125,
    kind = "Celestial",
    atlas = "NeonCelestialPack",
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_celestial_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3)
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0, 0, {
            timer = 0.07/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 15*2,
            speed = 0.1*1.25,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, HEX("a7d6e0"), HEX("fddca0") },
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0, 0, {
            timer = 2/3,
            scale = 0.05/2,
            lifespan = 1.5*2,
            speed = 4*1.25,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE },
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _planet, _hand, _tally = nil, nil, 0
            for _, handname in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                    _hand = handname
                    _tally = G.GAME.hands[handname].played
                end
            end
            if _hand then
                for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                    if planet_center.config.hand_type == _hand then
                        _planet = planet_center.key
                    end
                end
            end
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key = _planet,
                key_append = "CGN_NeonCelestialPack_Telescope"
            }
        else
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "CGN_NeonCelestialPack"
            }
        end
        return _card
    end
}

SMODS.Booster {
    key = "NeonCelestialPack_2",
    weight = 0.125,
    kind = "Celestial",
    atlas = "NeonCelestialPack",
    cost = 8,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_celestial_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3)
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0, 0, {
            timer = 0.07/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 15*2,
            speed = 0.1*1.25,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, HEX("a7d6e0"), HEX("fddca0") },
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0, 0, {
            timer = 2/3,
            scale = 0.05/2,
            lifespan = 1.5*2,
            speed = 4*1.25,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE },
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _planet, _hand, _tally = nil, nil, 0
            for _, handname in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                    _hand = handname
                    _tally = G.GAME.hands[handname].played
                end
            end
            if _hand then
                for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                    if planet_center.config.hand_type == _hand then
                        _planet = planet_center.key
                    end
                end
            end
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key = _planet,
                key_append = "CGN_NeonCelestialPack_Telescope"
            }
        else
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "CGN_NeonCelestialPack"
            }
        end
        return _card
    end
}

SMODS.Booster {
    key = "NeonCelestialPack_3",
    weight = 0.125,
    kind = "Celestial",
    atlas = "NeonCelestialPack",
    cost = 8,
    pos = { x = 2, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_celestial_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3)
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0, 0, {
            timer = 0.07/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 15*2,
            speed = 0.1*1.25,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, HEX("a7d6e0"), HEX("fddca0") },
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0, 0, {
            timer = 2/3,
            scale = 0.05/2,
            lifespan = 1.5*2,
            speed = 4*1.25,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE },
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _planet, _hand, _tally = nil, nil, 0
            for _, handname in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                    _hand = handname
                    _tally = G.GAME.hands[handname].played
                end
            end
            if _hand then
                for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                    if planet_center.config.hand_type == _hand then
                        _planet = planet_center.key
                    end
                end
            end
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key = _planet,
                key_append = "CGN_NeonCelestialPack_Telescope"
            }
        else
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "CGN_NeonCelestialPack"
            }
        end
        return _card
    end
}

SMODS.Booster {
    key = "NeonCelestialPack_4",
    weight = 0.125,
    kind = "Celestial",
    atlas = "NeonCelestialPack",
    cost = 8,
    pos = { x = 3, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_celestial_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3)
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0, 0, {
            timer = 0.07/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 15*2,
            speed = 0.1*1.25,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, HEX("a7d6e0"), HEX("fddca0") },
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0, 0, {
            timer = 2/3,
            scale = 0.05/2,
            lifespan = 1.5*2,
            speed = 4*1.25,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE },
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _planet, _hand, _tally = nil, nil, 0
            for _, handname in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                    _hand = handname
                    _tally = G.GAME.hands[handname].played
                end
            end
            if _hand then
                for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                    if planet_center.config.hand_type == _hand then
                        _planet = planet_center.key
                    end
                end
            end
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key = _planet,
                key_append = "CGN_NeonCelestialPack_Telescope"
            }
        else
            _card = {
                set = "Planet",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "CGN_NeonCelestialPack"
            }
        end
        return _card
    end
}

SMODS.Atlas{
    key = "NeonStandardPack",
    path = "NeonStandardPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "NeonStandardPack_1",
    weight = 0.125,
    kind = "Standard",
    atlas = "NeonStandardPack",
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_standard_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.3/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _edition = SMODS.poll_edition { key = "CGN_NeonStandardPack_Edition_" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
        local _seal = SMODS.poll_seal({ mod = 10 })
        return {
            set = "Playing Card",
            edition = _edition,
            seal = _seal,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonStandardPack"
        }
    end,
}

SMODS.Booster {
    key = "NeonStandardPack_2",
    weight = 0.125,
    kind = "Standard",
    atlas = "NeonStandardPack",
    cost = 8,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_standard_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.3/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _edition = SMODS.poll_edition { key = "CGN_NeonStandardPack_Edition_" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
        local _seal = SMODS.poll_seal({ mod = 10 })
        return {
            set = "Playing Card",
            edition = _edition,
            seal = _seal,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonStandardPack"
        }
    end,
}

SMODS.Booster {
    key = "NeonStandardPack_3",
    weight = 0.125,
    kind = "Standard",
    atlas = "NeonStandardPack",
    cost = 8,
    pos = { x = 2, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_standard_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.3/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _edition = SMODS.poll_edition { key = "CGN_NeonStandardPack_Edition_" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
        local _seal = SMODS.poll_seal({ mod = 10 })
        return {
            set = "Playing Card",
            edition = _edition,
            seal = _seal,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonStandardPack"
        }
    end,
}

SMODS.Booster {
    key = "NeonStandardPack_4",
    weight = 0.125,
    kind = "Standard",
    atlas = "NeonStandardPack",
    cost = 8,
    pos = { x = 3, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_standard_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.3/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _edition = SMODS.poll_edition { key = "CGN_NeonStandardPack_Edition_" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
        local _seal = SMODS.poll_seal({ mod = 10 })
        return {
            set = "Playing Card",
            edition = _edition,
            seal = _seal,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonStandardPack"
        }
    end,
}

SMODS.Atlas{
    key = "NeonBuffoonPack",
    path = "NeonBuffoonPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "NeonBuffoonPack_1",
    weight = 0.075,
    kind = "Buffoon",
    atlas = "NeonBuffoonPack",
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_buffoon_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.BUFFOON_PACK)
    end,
    create_card = function(self, card, i)
        return { set = "Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "CGN_NeonBuffoonPack" }
    end,
}

SMODS.Booster {
    key = "NeonBuffoonPack_2",
    weight = 0.075,
    kind = "Buffoon",
    atlas = "NeonBuffoonPack",
    cost = 8,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_buffoon_pack",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.BUFFOON_PACK)
    end,
    create_card = function(self, card, i)
        return { set = "Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "CGN_NeonBuffoonPack" }
    end,
}

SMODS.Atlas{
    key = "NeonSpectralPack",
    path = "NeonSpectralPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "NeonSpectralPack_1",
    weight = 0.035,
    kind = "Spectral",
    atlas = "NeonSpectralPack",
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_spectral_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "Spectral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonSpectralPack"
        }
    end
}

SMODS.Booster {
    key = "NeonSpectralPack_2",
    weight = 0.035,
    kind = "Spectral",
    atlas = "NeonSpectralPack",
    cost = 8,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_spectral_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "Spectral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonSpectralPack"
        }
    end
}

local lua_digital_hallucinations_compat = {
	colour = HEX("0019a0"),
	loc_key = "CGN_plus_lua",
	create = function()
		SMODS.add_card({ set = "CGN_Lua", edition = "e_negative", key_append = "diha" })
	end,
}

SMODS.Atlas{
    key = "LuaPack",
    path = "LuaPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "LuaPack_1",
    weight = 0.3,
    kind = "CGN_Lua",
    atlas = "LuaPack",
    cost = 4,
    pos = { x = 0, y = 0 },
    config = { extra = 2, choose = 1 },
    group_key = "k_CGN_LuaPack",
    draw_hand = true,
    cry_digital_hallucinations = lua_digital_hallucinations_compat,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.CGN_Lua)
		ease_background_colour({new_colour = G.C.SECONDARY_SET.CGN_Lua, special_colour = G.C.BLACK, contrast = 2})
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, G.C.SET.CGN_Lua, G.C.SECONDARY_SET.CGN_Lua },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "CGN_Lua",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_LuaPack"
        }
    end,
}

SMODS.Booster {
    key = "LuaPack_2",
    weight = 0.3,
    kind = "CGN_Lua",
    atlas = "LuaPack",
    cost = 4,
    pos = { x = 1, y = 0 },
    config = { extra = 2, choose = 1 },
    group_key = "k_CGN_LuaPack",
    draw_hand = true,
    cry_digital_hallucinations = lua_digital_hallucinations_compat,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.CGN_Lua)
		ease_background_colour({new_colour = G.C.SECONDARY_SET.CGN_Lua, special_colour = G.C.BLACK, contrast = 2})
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, G.C.SET.CGN_Lua, G.C.SECONDARY_SET.CGN_Lua },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "CGN_Lua",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_LuaPack"
        }
    end,
}

SMODS.Atlas{
    key = "JumboLuaPack",
    path = "JumboLuaPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "JumboLuaPack_1",
    weight = 0.3,
    kind = "CGN_Lua",
    atlas = "JumboLuaPack",
    cost = 6,
    pos = { x = 0, y = 0 },
    config = { extra = 4, choose = 1 },
    group_key = "k_CGN_LuaPack",
    draw_hand = true,
    cry_digital_hallucinations = lua_digital_hallucinations_compat,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.CGN_Lua)
		ease_background_colour({new_colour = G.C.SECONDARY_SET.CGN_Lua, special_colour = G.C.BLACK, contrast = 2})
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, G.C.SET.CGN_Lua, G.C.SECONDARY_SET.CGN_Lua },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "CGN_Lua",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_JumboLuaPack"
        }
    end,
}

SMODS.Atlas{
    key = "MegaLuaPack",
    path = "MegaLuaPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "MegaLuaPack_1",
    weight = 0.07,
    kind = "CGN_Lua",
    atlas = "MegaLuaPack",
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 4, choose = 2 },
    group_key = "k_CGN_LuaPack",
    draw_hand = true,
    cry_digital_hallucinations = lua_digital_hallucinations_compat,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.CGN_Lua)
		ease_background_colour({new_colour = G.C.SECONDARY_SET.CGN_Lua, special_colour = G.C.BLACK, contrast = 2})
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, G.C.SET.CGN_Lua, G.C.SECONDARY_SET.CGN_Lua },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "CGN_Lua",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_MegaLuaPack"
        }
    end,
}

SMODS.Atlas{
    key = "NeonLuaPack",
    path = "NeonLuaPack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "NeonLuaPack_1",
    weight = 0.07,
    kind = "CGN_Lua",
    atlas = "NeonLuaPack",
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_CGN_LuaPack",
    draw_hand = true,
    cry_digital_hallucinations = lua_digital_hallucinations_compat,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.CGN_Lua)
		ease_background_colour({new_colour = G.C.SECONDARY_SET.CGN_Lua, special_colour = G.C.BLACK, contrast = 2})
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, G.C.SET.CGN_Lua, G.C.SECONDARY_SET.CGN_Lua },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "CGN_Lua",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonLuaPack"
        }
    end,
}

SMODS.Booster {
    key = "NeonLuaPack_2",
    weight = 0.07,
    kind = "CGN_Lua",
    atlas = "NeonLuaPack",
    cost = 8,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 3 },
    group_key = "k_CGN_LuaPack",
    draw_hand = true,
    cry_digital_hallucinations = lua_digital_hallucinations_compat,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.CGN_Lua)
		ease_background_colour({new_colour = G.C.SECONDARY_SET.CGN_Lua, special_colour = G.C.BLACK, contrast = 2})
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015/3,
            scale = 0.1/2,
            initialize = true,
            lifespan = 3*2,
            speed = 0.2*1.25,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, G.C.SET.CGN_Lua, G.C.SECONDARY_SET.CGN_Lua },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "CGN_Lua",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "CGN_NeonLuaPack"
        }
    end,
}