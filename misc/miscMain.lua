SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {
		r = 0.1, minw = 8, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK
	}, nodes = {
        {n = G.UIT.C, config = {
            r = 0.1, minw = 6, minh = 4, align = "tm", padding = 0.1, colour = G.C.BLACK, no_fill = true
        }, nodes = {
            {n = G.UIT.R, config = {align = "cm",padding = 0.1}, nodes = {
                create_toggle{ col = true, label = "Splash Text (requires restart)", scale = 0.85, w = 0, shadow = true, ref_table = CGNik.config, ref_value = "splashText" }
            }},
            {n = G.UIT.R, config = {align = "cm",padding = 0.1}, nodes = {
                create_toggle{ col = true, label = "Crossmod Content (requires restart)", scale = 0.85, w = 0, shadow = true, ref_table = CGNik.config, ref_value = "crossMod" }
            }}
        }}
	}}
end

SMODS.current_mod.optional_features = function()
    return {
        -- post_trigger = true,
        -- retrigger_joker = true,
        -- quantum_enhancements = true,
		-- object_weights = true,
        --[[
		cardareas = {
            discard = true,
            deck = true
        }
        --]]
    }
end

SMODS.current_mod.ui_config = {
	colour = G.C.L_BLACK, -- Colour of the mod menu
	author_colour = G.C.GREEN, -- Colour of the text displaying the mod authors
	bg_colour = { G.C.GREEN[1], G.C.GREEN[2], G.C.GREEN[3], 0.5 }, -- Colour of the area behind the mod menu.
	back_colour = G.C.GREEN, -- Colour of the "Back" button
	tab_button_colour = G.C.GREEN, -- Colour of the tab buttons
	collection_option_cycle_colour = G.C.GREEN -- Colour of the option cycle in the collection
}