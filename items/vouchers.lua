SMODS.Atlas{
    key = "MainLua",
    path = "MainLua.png",
    px = 71,
    py = 95
}

SMODS.Voucher {
    key = "MainLua",
    atlas = "MainLua",
    pos = { x = 0, y = 0 },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.cgn_lua_rate = 2
                return true
            end
        }))
    end
}

SMODS.Atlas{
    key = "ConfigLua",
    path = "ConfigLua.png",
    px = 71,
    py = 95
}

SMODS.Voucher {
    key = "ConfigLua",
    atlas = "ConfigLua",
    pos = { x = 0, y = 0 },
    config = { extra = { rate = 2.154, display = 2 } }, -- at this rate, assuming no other modifications happen, it's very close to 2X as likely
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.display } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.cgn_lua_rate = 2 * card.ability.extra.rate
                return true
            end
        }))
    end
}