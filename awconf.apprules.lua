-- file: awconf.apprules.lua


-- ********************
-- Rules for applications
-- ********************

io.stderr:write('\t--> Processing awconf.apprules.lua ...\n')


awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
			 		 size_hints_honor = false} },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },

    
	-- Firefox
    { rule = { instance = "Navigator" }, properties = { tag = tags[2][1] } },
	
	-- Misc apps
    { rule = { instance = "envy24control" },properties = { tag = tags[2][5] } },
    { rule = { instance = "twinkle" }, 		properties = { tag = tags[1][7] } },
    { rule = { name = "opengl" }, 			properties = { tag = tags[2][4], floating = true } },

    { rule = { class = "gimp" }, 		properties = { floating = true } },
    { rule = { class = "feh" }, 		properties = { floating = true } },
    { rule = { class = "Blender" }, 	properties = { floating = true } },
    { rule = { instance = "krusader" },	properties = { tag = tags[1][6] } },

	-- Rules for the terminals
    { rule = { icon_name = "urx-irssi" }, 	properties = { tag = tags[1][1] } },
    { rule = { icon_name = "urx-mail" }, 	properties = { tag = tags[1][2] } },
    { rule = { icon_name = "urx-news" },	properties = { tag = tags[1][2] } },
    { rule = { icon_name = "urx-sound" }, 	properties = { tag = tags[2][5] } },
    { rule = { icon_name = "urx-var1" },	properties = { tag = tags[1][3] } },
    { rule = { icon_name = "urx-var2" },	properties = { tag = tags[1][4] } },
    { rule = { icon_name = "urxvt-short" },	properties = { floating = true } },
	{ rule = { icon_name = "urx-log" }, 	properties = {tag = tags[2][6], floating = true } },
	
	-- Documents
    { rule = { instance = "abiword" },	properties = { tag = tags[2][3] } },
    { rule = { instance = "evince" },	properties = { tag = tags[2][3] } },
    { rule = { instance = "Gnumeric" },	properties = { tag = tags[2][3] } },
}

sightness.placethem.rules.rules = {
    { rule = { icon_name = "urx-log" }, 	coordp = { x = 1300 , y = 500 , h = 480 , w = 1240 } },
    { rule = { icon_name = "urx-log-var" },	coordp = { x = 1300 , y = 40 , h = 430 , w = 800 } },
    { rule = { instance = "Navigator" }, 	coordp = { x = 1310 , y = 50 , h = 924 , w = 1220 } },

}
		


