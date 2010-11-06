
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Widget and layout library
require("wibox")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- require("wicked")
require("vicious")
require("sightness")
require("autost")
require("calendar2")
require("popular")

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


autost.execute()

-- vim:ft=lua
