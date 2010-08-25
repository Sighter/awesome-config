-- file: awconf.widgets.lua


-- ********************
-- Widgets
-- ********************

io.stderr:write('\t--> Processing awconf.widgets.lua ...\n')



-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- add the calendar-functions
mytextclock.mouse_enter = function()
    add_calendar(0)
end
mytextclock.mouse_leave = remove_calendar

mytextclock:buttons({
    awful.button({ }, 4, function()
        add_calendar(-1)
    end),
    awful.button({ }, 5, function()
        add_calendar(1)
    end),
})

calendar2.addCalendarToWidget(mytextclock)


-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Create a table with widgets that go to the right
    right_aligned = {
        layout = awful.widget.layout.horizontal.rightleft
    }
    if s == 1 then table.insert(right_aligned, mysystray) end
    table.insert(right_aligned, mytextclock)
    table.insert(right_aligned, mylayoutbox[s])

    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        mylauncher,
        mytaglist[s],
        mypromptbox[s],
        right_aligned,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.leftright,
        height = mywibox[s].height
    }
end

-- clone the tasklist

--mytasklist_bak = mytasklist[1]

-- create a cloned wibox
--[[
mywibox[3] = wibox({ position = "top", fg = beautiful.fg_normal, bg = beautiful.bg_normal })

mywibox[3].widgets = { mylauncher,
                       mytaglist[1],
                       mytasklist[1],
                       mypromptbox[1],
                       mytextbox,
                       mylayoutbox[1],
                       1 == 1 and mysystray or nil }
--]]


-- Create the second Wibox on Screen ONE 
-- #####################################

-- create the sightbox-table
---[[
sightbox = {}


myn.brackl = '<span color="white">[</span>'
myn.brackr = '<span color="white">]</span>'
myn.space  = '   '




-- Filesystem - usage - widgets
-- root
fswidget_root_text = widget({ type = 'textbox' ,align = "left" ,name = "feswidget_root_text"   })
vicious.register(fswidget_root_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Root:</span> ${/ used_gb} | <span color="white">${/ size_gb}</span>' .. myn.brackr , 120)
awful.widget.layout.margins[fswidget_root_text] = { left = 6, right = 6}

-- var
fswidget_var_text = widget({ type = 'textbox' ,align = "left" ,name = "feswidget_var_text"   })
vicious.register(fswidget_var_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Var:</span> ${/var used_gb} | <span color="white">${/var size_gb}</span>' .. myn.brackr , 120)
awful.widget.layout.margins[fswidget_var_text] = { left = 6, right = 6}

-- home
fswidget_home_text = widget({ type = 'textbox' ,align = "left" ,name = "feswidget_home_text"   })
vicious.register(fswidget_home_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Home:</span> ${/home used_gb} | <span color="white">${/home size_gb}</span>' .. myn.brackr , 120)
awful.widget.layout.margins[fswidget_home_text] = { left = 6, right = 6}


-- CPU Useage
cpuwidget =	widget({type = 'textbox',name = 'cpuwidget'})
vicious.register(cpuwidget, vicious.widgets.cpu, myn.brackl .. '<span color="lightblue">CPU:</span> $1% $2%' .. myn.brackr , 2)
awful.widget.layout.margins[cpuwidget] = { left = 6, right = 6}
popular.addtowidget(cpuwidget, popular.cpufreqinfo.popup)

-- Battery
batwidget =	widget({type = 'textbox',name = 'batwidget'})
vicious.register(batwidget, vicious.widgets.bat, myn.brackl .. '<span color="lightblue">Bat:</span> $2% $1 ' .. myn.brackr , 2, "BAT0")
awful.widget.layout.margins[batwidget] = { left = 6, right = 6}

--[[ Thermal monitoring
-- CPU 1
cputherm1 =	widget({type = 'textbox',name = 'cputherm1'})
vicious.register(cputherm1, vicious.widgets.thermal , myn.brackl .. '<span color="lightblue">CPU Therm:</span> $1°', 2, {"coretemp.0","core"})
awful.widget.layout.margins[cputherm1] = { left = 6}
-- CPU 2
cputherm2 =	widget({type = 'textbox',name = 'cputherm2'})
vicious.register(cputherm2, vicious.widgets.thermal ,' $1°', 2, {"coretemp.1","core"})
-- CPU 3
cputherm3 =	widget({type = 'textbox',name = 'cputherm3'})
vicious.register(cputherm3, vicious.widgets.thermal ,' $1°', 2, {"coretemp.2","core"})
-- CPU 4
cputherm4 =	widget({type = 'textbox',name = 'cputherm4'})
vicious.register(cputherm4, vicious.widgets.thermal , ' $1°' .. myn.brackr , 2, {"coretemp.3","core"})
awful.widget.layout.margins[cputherm4] = { right = 6}

-- Thermal monitoring for hdds
hddtemp1 =	widget({type = 'textbox',name = 'hddtemp1'})
vicious.register(hddtemp1, vicious.widgets.hddtemp, myn.brackl .. '<span color="lightblue">Hddtemp:</span> ${/dev/sda}° | ${/dev/sdb}° ' .. myn.brackr , 2)
awful.widget.layout.margins[hddtemp1] = { left = 6, right = 6}
--]]

-- Net Stats
netwidget =	widget({type = 'textbox',name = 'netwidget'})
netstat = io.popen("ifconfig"):read("*a")
if string.find(netstat,"wlan0") then
		vicious.register(netwidget, vicious.widgets.net, myn.brackl .. '<span color="lightblue">Wlan:</span> ${eth0 down_kb}/${eth0 up_kb}' .. myn.brackr,3)
else
		vicious.register(netwidget, vicious.widgets.net, myn.brackl .. '<span color="lightblue">Eth:</span> ${eth0 down_kb}/${eth0 up_kb}' .. myn.brackr,3)
end
awful.widget.layout.margins[netwidget] = { left = 6, right = 6}


-- Pacman Updates
pacmwidget = widget({type = 'textbox',name = 'pacmwidget'})
vicious.register(pacmwidget, vicious.widgets.pkg, "$1" , 40, "Arch") 
awful.widget.layout.margins[pacmwidget] = { right = 6}
pacmimage = widget({ type = 'imagebox' , name = 'pacmimage'})
pacmimage.image = image("/home/sighter/.config/awesome/icons/pacman.png")


-- Mpd Playing song
mpdwidget = widget({ type = 'textbox', name = 'mpdwidget' })
vicious.register(mpdwidget, vicious.widgets.mpd, '   ' ..  myn.brackl .. '<span color="lightblue">MPD:</span> ${Artist} - ${Title}' .. myn.brackr, 10)
awful.widget.layout.margins[mpdwidget] = { left = 3, right = 6}


-- Volume Widget
volumewidget = widget({ type = 'textbox', name = 'volumewidget' })
volumewidget.text = vol_get()
awful.widget.layout.margins[volumewidget] = { right = 6}
volimage = widget({ type = 'imagebox' , name = 'volimage'})
volimage.image = image("/home/sighter/.config/awesome/icons/vol.png")
awful.widget.layout.margins[volimage] = { left = 6}



-- fill the wibox
sightbox[1] = awful.wibox({ position = "bottom", fg = beautiful.fg_normal, bg = beautiful.bg_normal, screen = 1})
sightbox[1].widgets = { 
		{
			cpuwidget,
			fswidget_root_text,
			fswidget_var_text,
			fswidget_home_text,
			layout = awful.widget.layout.horizontal.leftright,
		},
		{
			batwidget,
			pacmimage,
			pacmwidget,
			netwidget,
			volumewidget,
			pmlauncher,
			layout = awful.widget.layout.horizontal.rightleft,
		},
		layout = awful.widget.layout.horizontal.leftright,
        height = sightbox[1].height
}
				


-- place it on screen one
sightbox[1].screen = 1


