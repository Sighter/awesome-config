
-- Autostart Libary
-- Author: Sighter


-- grab environment
require("awful")

local awful = awful
local ipairs = ipairs
local io = io
local string = string
local os = os



module("autost")


-- init variables
set = {}
set.logging = true
set.logprefix = "\t--> autost :: "

entries = {}

-- Main Function
function execute()
	local str = ""
	local running = ""
	local notify = ""
	-- grab "ps -Af" output
	psout = io.popen("ps -Af"):read("*a")
	
	-- iterate through the autostart table
	for idx , item in ipairs(entries) do

			-- check whether programm is running
			if string.find( psout , item.cmd , 1, true ) == nil then
				running = " restarted"
				item.runs = true
			else
				running = " is running"
				item.runs = false
			end

			if item.runs == true and item.term ~= nil then
				os.execute( item.term .. " " .. item.cmd .. " &" )
			elseif item.runs == true and item.term == nil then
				os.execute( item.cmd .. " &" )
			end

			str = str .. set.logprefix .. item.cmd .. running .. "\n"
	end


	if set.logging == true then
		io.stderr:write(str)
	end

end

