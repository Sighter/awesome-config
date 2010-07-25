
-- Popup Presetlib Libary
-- Author: Sighter


-- grab environment
require("awful")

-- Include the presets
require("popular.cpufreqinfo")


local awful = awful
local ipairs = ipairs
local io = io
local string = string
local os = os



module("popular")




-- init variables
set = {}
set.logging = true
set.logprefix = "\t--> popular :: "

entries = {}

-- function to add a popup to a widget
function addtowidget(widget, func)
	
	-- widget:add_signal('mouse::enter', func)
	widget:buttons(awful.util.table.join(awful.button({ }, 1, func )))


end

