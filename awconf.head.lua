
require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
-- require("wicked")
require("vicious")
require("sightness")

io.stderr:write('\n\n\nEntering awconf.head.lua at '.. os.date() .. os.time() ..'\n\n')

config_path = '/home/sighter/.config/awesome/'

dofile( config_path .. 'awconf.definitions.lua')		-- define all global variables
dofile( config_path .. 'awconf.functions.lua')			-- define all functions
dofile( config_path .. 'awconf.tags.lua')				-- define the tag table
dofile( config_path .. 'awconf.menus.lua')				-- define the menus
dofile( config_path .. 'awconf.widgets.lua')			-- register widgets with vicious
dofile( config_path .. 'awconf.bindings.lua')			-- key and mouse bindings
dofile( config_path .. 'awconf.apprules.lua')			-- rules to handle apps
dofile( config_path .. 'awconf.signals.lua')			-- add signals to the clients


-- execute the autostart
autostart(autos)

-- vim:ft=lua
