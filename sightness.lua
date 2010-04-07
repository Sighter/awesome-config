
-- Mixed Libary
-- Author: Sighter


-- grab environment
require("naughty")
require("awful")

local awful = awful
local naughty = naughty
local ipairs = ipairs



module("sightness")


-- init some variables
placethem = {}
placethem.screenres = "nothing"
placethem.rules = {}


-- Test function
function sayhello()
		naughty.notify({ text = "Hello here is the Sightness-Module"})
end

-- apply-function to set the geometry of the given cient
function placethem.rules.apply(c)
		local rules = placethem.rules.rules

		for idx, entry in ipairs(rules) do
				state =	awful.rules.match(c, entry.rule)
				if state == true then
						c:geometry({x = entry.coordp.x, 
									y = entry.coordp.y,
									height = entry.coordp.h,
									width = entry.coordp.w,
							})
				else
						--naughty.notify({ text = "client doesn't matches" })
				end

		end
end
