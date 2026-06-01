CGNik.splashText = function(card)
    local messages = {
        { -- Crossmods
            {"CGNik's Balatro has Card Sleeves crossmod content!",G.C.FILTER}
        },
        { -- Text Colors
            {"Mult!",G.C.MULT},
            {"Chips!",G.C.CHIPS},
            {"Money!",G.C.MONEY},
            {"Attention!",G.C.FILTER},
            {"Inactive!",G.C.UI.TEXT_INACTIVE},
            {"Spades!",G.C.SUITS.Spades},
            {"Hearts!",G.C.SUITS.Hearts},
            {"Clubs!",G.C.SUITS.Clubs},
            {"Diamonds!",G.C.SUITS.Diamonds},
            {"Tarot!",G.C.SECONDARY_SET.Tarot},
            {"Planet!",G.C.SECONDARY_SET.Planet},
            {"Spectral!",G.C.SECONDARY_SET.Spectral},
            {"Edition!",G.C.EDITION},
            {"Edition!",G.C.DARK_EDITION},
            {"Common!",G.C.RARITY.Common},
            {"Uncommon!",G.C.RARITY.Uncommon},
            {"Rare!",G.C.RARITY.Rare},
            {"Legendary!",G.C.RARITY.Legendary},
            {"Enhancement!",G.C.SECONDARY_SET.Enhanced}
        },
        { -- Stakes
            {"White Stake!",G.C.WHITE},
            {"Red Stake!",G.C.RED},
            {"Green Stake!",G.C.GREEN},
            {"Black Stake!",G.C.BLACK},
            {"Blue Stake!",G.C.BLUE},
            {"Purple Stake!",G.C.PURPLE},
            {"Orange Stake!",G.C.ORANGE},
            {"Gold Stake!",G.C.GOLD}
        },
        { -- Blinds
            {"Small Blind!",G.C.DYN_UI.DARK},
            {"Big Blind!",G.C.DYN_UI.DARK},
            {"The Hook!",G.C.DYN_UI.DARK},
            {"The Ox!",G.C.DYN_UI.DARK},
            {"The House!",G.C.DYN_UI.DARK},
            {"The Wall!",G.C.DYN_UI.DARK},
            {"The Wheel!",G.C.DYN_UI.DARK},
            {"The Arm!",G.C.DYN_UI.DARK},
            {"The Club!",G.C.DYN_UI.DARK},
            {"The Fish!",G.C.DYN_UI.DARK},
            {"The Psychic!",G.C.DYN_UI.DARK},
            {"The Goad!",G.C.DYN_UI.DARK},
            {"The Water!",G.C.DYN_UI.DARK},
            {"The Window!",G.C.DYN_UI.DARK},
            {"The Manacle!",G.C.DYN_UI.DARK},
            {"The Eye!",G.C.DYN_UI.DARK},
            {"The Mouth!",G.C.DYN_UI.DARK},
            {"The Plant!",G.C.DYN_UI.DARK},
            {"The Serpent!",G.C.DYN_UI.DARK},
            {"The Pillar!",G.C.DYN_UI.DARK},
            {"The Needle!",G.C.DYN_UI.DARK},
            {"The Head!",G.C.DYN_UI.DARK},
            {"The Tooth!",G.C.DYN_UI.DARK},
            {"The Flint!",G.C.DYN_UI.DARK},
            {"The Mark!",G.C.DYN_UI.DARK},
            {"Amber Acorn!",G.C.DYN_UI.DARK},
            {"Verdant Leaf!",G.C.DYN_UI.DARK},
            {"Violet Vessel!",G.C.DYN_UI.DARK},
            {"Crimson Heart!",G.C.DYN_UI.DARK},
            {"Cerulean Bell!",G.C.DYN_UI.DARK}
        },
        { -- Booster Packs
            {"Arcana Pack!",G.C.BOOSTER},
            {"Jumbo Arcana Pack!",G.C.BOOSTER},
            {"Mega Arcana Pack!",G.C.BOOSTER},
            {"Celestial Pack!",G.C.BOOSTER},
            {"Jumbo Celestial Pack!",G.C.BOOSTER},
            {"Mega Celestial Pack!",G.C.BOOSTER},
            {"Standard Pack!",G.C.BOOSTER},
            {"Jumbo Standard Pack!",G.C.BOOSTER},
            {"Mega Standard Pack!",G.C.BOOSTER},
            {"Buffoon Pack!",G.C.BOOSTER},
            {"Jumbo Buffoon Pack!",G.C.BOOSTER},
            {"Mega Buffoon Pack!",G.C.BOOSTER},
            {"Spectral Pack!",G.C.BOOSTER},
            {"Jumbo Spectral Pack!",G.C.BOOSTER},
            {"Mega Spectral Pack!",G.C.BOOSTER}
        },
        { -- Poker Hands
            {"High Card!",G.C.FILTER},
            {"Pair!",G.C.FILTER},
            {"Two Pair!",G.C.FILTER},
            {"Three of a Kind!",G.C.FILTER},
            {"Straight!",G.C.FILTER},
            {"Flush!",G.C.FILTER},
            {"Full House!",G.C.FILTER},
            {"Four of a Kind!",G.C.FILTER},
            {"Straight Flush!",G.C.FILTER},
            {"Royal Flush!",G.C.FILTER},
            {"Five of a Kind!",G.C.FILTER},
            {"Flush House!",G.C.FILTER},
            {"Flush Five!",G.C.FILTER}
        },
        { -- Enhancements
            {"Bonus Card!",G.C.SECONDARY_SET.Enhanced},
            {"Mult Card!",G.C.SECONDARY_SET.Enhanced},
            {"Wild Card!",G.C.SECONDARY_SET.Enhanced},
            {"Glass Card!",G.C.SECONDARY_SET.Enhanced},
            {"Steel Card!",G.C.SECONDARY_SET.Enhanced},
            {"Stone Card!",G.C.SECONDARY_SET.Enhanced},
            {"Gold Card!",G.C.SECONDARY_SET.Enhanced},
            {"Lucky Card!",G.C.SECONDARY_SET.Enhanced}
        },
        { -- Seals
            {"Gold Seal!",G.C.GOLD},
            {"Red Seal!",G.C.RED},
            {"Blue Seal!",G.C.BLUE},
            {"Purple Seal!",G.C.PURPLE}
        },
        { -- Editions
            {"Foil!",G.C.EDITION},
            {"Holographic!",G.C.EDITION},
            {"Polychrome!",G.C.EDITION},
            {"Negative!",G.C.DARK_EDITION}
        },
        { -- Stickers
            {"Eternal!",G.C.FILTER},
            {"Perishable!",G.C.FILTER},
            {"Rental!",G.C.FILTER}
        },
        { -- Misc
            {"Jegg!",G.C.FILTER},
            {"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!",G.C.FILTER},
            {"You can disable this Splash Text system!",G.C.FILTER},
        }
    }
    local msgGroup = messages[math.random(1,#messages)]
    local msg = msgGroup[math.random(1,#msgGroup)]
    local displayTime = (#msg[1]/20) + 0.5
    SMODS.calculate_effect({message=msg[1],colour = msg[2],delay = displayTime}, card)
end

CGNik.jeggClick = function(self)
    Card.click(self)
    CGNik.splashText(self)
end

SMODS.current_mod.menu_cards = function()
    return {
        {key = "j_CGN_Jegg"},
        func = function()
            if not CGNik.config.splashText then
                return
            end
            for i,v in ipairs(G.title_top.cards) do
                if v.config.center.key == "j_CGN_Jegg" then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            CGNik.splashText(v)
                            v.click = CGNik.jeggClick
                            return true
                        end
                    }))
                end
            end
        end
    }
end