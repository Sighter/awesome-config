
-- Popup Presetlib Libary
-- 	Output of the cpufreq-program
-- Author: Sighter


-- grab environment
require("awful")
require("naughty")

local awful = awful
local naughty = naughty
local ipairs = ipairs
local io = io
local string = string
local os = os



module("popular.cpufreqinfo")




-- init variables
set = {}
set.logging = true
set.logprefix = "\t--> popular :: "


-- function to grab the output from cpufreq-info
function popup()

	out = io.popen("cpufreq-info"):read("*a")
	naughty.notify({ 	text = out,
						timeout = 0,
						position = "bottom_left",
						hover_timeout = 0 })

end

