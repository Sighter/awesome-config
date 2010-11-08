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

-- Table of layouts to cover with awful.layout.inc, order matters.
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
	--"urxvtc -n urx-sound -pe tabbed -e ncmpcpp &" ,
    "urxvtc -n urx-irssi -e screen -D -R -S irssi irssi &",
    "urxvtc -n urx-mail -e mutt &",
    "urxvtc -n urx-mail -e slrn &",
    "urxvtc -n urx-log -e screen -D -R -c /home/sighter/.screenrc-log -S logging &",
}

autost.set.logging = true
autost.set.logprefix = "\t--> autost :: "

autost.entries =
{
	{ term = "urxvtc -n urx-sound -pe tabbed -e", 	cmd = " ncmpcpp" },
	{ term = "urxvtc -n urx-irssi -e", 				cmd = " screen -D -R -S irssi irssi" },
	--{ term = "urxvtc -n urx-var1" },
	--{ term = "urxvtc -n urx-var1" },
	--{ term = "urxvtc -n urx-var2" },
	--{ term = "urxvtc -n urx-var2" },
	{ term = "urxvtc -n urx-news -e",				cmd = " newsbeuter" },
	{ term = "urxvtc -n urx-mail -e",				cmd = " mutt" },
	{ term = "urxvtc -n urx-mail -e",				cmd = " slrn" },
	{ term = "urxvtc -n urx-log -e",				cmd = " screen -c /home/sighter/.screenrc-log" },
	{ cmd = "firefox" },
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

