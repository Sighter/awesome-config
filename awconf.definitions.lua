-- file: awconf.definitions.lua


-- ********************
-- Variable definitions
-- ********************

io.stderr:write('\t--> Processing awconf.definitions.lua ...\n')


theme_path = "/home/sighter/.config/awesome/themes/default/theme.lua"

-- Actually load theme
beautiful.init(theme_path)

terminal = "urxvtc"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- layout table
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

-- autostart table
autos =
{
    "urxvtc -n urx-sound -pe tabbed -e ncmpcpp &" ,
    "urxvtc -n urx-irssi -e screen -D -R -S irssi irssi &",
    "urxvtc -n urx-var1 &",
    "urxvtc -n urx-var1 &",
    "urxvtc -n urx-var2 &",
    "urxvtc -n urx-var2 &",
    "urxvtc -n urx-news -e newsbeuter &",
    "urxvtc -n urx-mail -e mutt &",
    "urxvtc -n urx-mail -e slrn &",
    "urxvtc -n urx-log -e screen -c /home/sighter/.screenrc-log &",
    "firefox &",
}


-- Define if we want to use titlebar on all applications.
use_titlebar = false
tasklist_noicons = false


-- sightness definitions
sightness.placethem.screenres = { 
								{ x = 1280, y = 1024 },
								{ x = 1280, y = 1024 }
							}

-- Transparency Settings - not used
dyntransp = true
op_f = 0.95
op_u = 0.90


-- My objects 
myn = {}
myn.img = {}
myn.menus = {}
myn.fkt = {}

