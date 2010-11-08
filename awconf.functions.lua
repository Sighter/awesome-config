-- file: awconf.functions.lua 

-- ********************
-- Helper Functions
-- ********************


io.stderr:write('\t--> Processing awconf.functions.lua ...\n')

-- The awesome calandar {{{

local calendar = nil
local offset = 0

function remove_calendar()
    if calendar ~= nil then
        naughty.destroy(calendar)
        calendar = nil
        offset = 0
    end
end

function add_calendar(inc_offset)
    local save_offset = offset
    remove_calendar()
    offset = save_offset + inc_offset
    local datespec = os.date("*t")
    datespec = datespec.year * 12 + datespec.month - 1 + offset
    datespec = (datespec % 12 + 1) .. " " .. math.floor(datespec / 12)
    local cal = awful.util.pread("cal -m " .. datespec)
    cal = string.gsub(cal, "^%s*(.-)%s*$", "%1")
    calendar = naughty.notify({
        text = string.format('<span font_desc="%s">%s</span>', "monospace", os.date("%a, %d %B %Y") .. "\n" .. cal),
        timeout = 0, hover_timeout = 0.5,
        width = 165,
    })
end
-- }}}

-- The Autostartfkt {{{
function autostart(progtable)
	local filepath
	local aweruns


	filepath = '/tmp/awerun'

	mfile = io.open(filepath , "r")
	aweruns = mfile:read()
	mfile:close()

	if aweruns == "false" then
		for i in ipairs(progtable) do
			os.execute(progtable[i])
		end
		mfile = io.open(filepath , "w+")
		mfile:write("true \n")
		mfile:flush()
		mfile:close()
		naughty.notify({title = "X", text = "X Restart Detected", timeout = 10})
	else
		naughty.notify({title = "NOX", text = "No X Restart Detected", timeout = 10})
	end
	--naughty.notify({title = "X", text = aweruns, timeout = 10})
end

--}}}y

-- {{{ warptofocus(force)
function warptofocus(force)
--if not force and (not client.focus or awful.mouse.client_under_pointer() == client.focus or
--          awful.layout.get(client.focus.screen) == awful.layout.suit.magnifier) then
--   return
--end
local g = client.focus:geometry()
g.x = g.x + 10 
g.y = g.y + 10
mouse.coords(g)
end
-- }}}

-- restore-fkt {{{

-- function save the focused tag and screen
-- argumets - tagtable,screencount
function save_session(sc)
		local s
		local t
		-- open file to save
		local file = io.open(awful.util.getdir("config") .. "/restore" , "w+")
		
		-- find out selected screen
		for s = 1,sc do

		end

end

-- }}}

-- sig_viewnext_wo {{{
function sig_viewnext_wo()
		-- get idx of selected tag
		local c = 1
		local scr = mouse.screen
			for i,v in ipairs(tags[scr]) do
				if v == awful.tag.selected(scr) then break
				else c = c + 1 end
		end
		
		if c == # tags[scr] then
				awful.screen.focus(1)
				awful.tag.viewonly(tags[mouse.screen][1])
		else
				awful.tag.viewnext()
		end
end


function sig_viewprev_wo()
		-- get idx of selected tag
		local c = 1
		local scr = mouse.screen
		local max
			for i,v in ipairs(tags[scr]) do
				if v == awful.tag.selected(scr) then break
				else c = c + 1 end
		end
		
		if c == 1 then
				awful.screen.focus(-1)
				scr = mouse.screen
				max = # tags[scr]
				awful.tag.viewonly(tags[scr][max])
		else
				awful.tag.viewprev()
		end
end
-- }}}

-- changevol() {{{
function vol_change(value)
		cur = io.popen("amixer get DAC,0 | grep dB | cut -d \" \" -f 4"):read("*n")
		n = cur + value
		os.execute("amixer set DAC,0 " .. n)
		os.execute("amixer set DAC,1 " .. n)
		-- set widget text
		volumewidget.text = n

end

function vol_get()
		return io.popen("amixer get DAC,0 | grep dB | cut -d \" \" -f 4"):read("*n")
end


-- }}}


